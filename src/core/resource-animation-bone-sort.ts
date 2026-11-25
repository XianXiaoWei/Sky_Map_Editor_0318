import type { ModelBakeMemory } from './model-baked-runtime';

/** Bytewise strcmp used by the original fixed-name bone records. */
export function compareOriginalBoneNames(m: ModelBakeMemory, left: bigint, right: bigint) {
  for (let i = 0n; ; i++) {
    const a = m.bytes(left + i, 1)[0], b = m.bytes(right + i, 1)[0];
    if (a !== b) return a - b;
    if (!a) return 0;
  }
}

/** Original uint16 bone-name sort 0x10009eb40 and small/incomplete sort
 * helpers. Preserve equal-name ordering from its median partition, rather
 * than relying on the host's stable Array.sort. Skeletons have <=256 bones,
 * so the native >=1000-element pivot path cannot be reached here. */
export function sortOriginalAnimationBoneIndices(m: ModelBakeMemory, controller: bigint, records: bigint, count: number) {
  if (!Number.isInteger(count) || count < 0 || count > 256) throw new Error('原骨骼排序数量无效');
  const raw = m.bytes(controller + 0x5610n, count * 2), view = new DataView(raw.buffer, raw.byteOffset, raw.byteLength);
  const get = (i: number) => view.getUint16(i * 2, true), set = (i: number, value: number) => view.setUint16(i * 2, value, true);
  const skip = BigInt(m.read32(controller + 0x5810n));
  const less = (a: number, b: number) => compareOriginalBoneNames(m, records + BigInt(a * 0x44) + skip, records + BigInt(b * 0x44) + skip) < 0;
  const atLess = (a: number, b: number) => less(get(a), get(b));
  const swap = (a: number, b: number) => { const value = get(a); set(a, get(b)); set(b, value); };
  const three = (x: number, y: number, z: number) => {
    if (!atLess(y, x)) {
      if (!atLess(z, y)) return 0;
      swap(y, z); if (atLess(y, x)) { swap(x, y); return 2; } return 1;
    }
    if (atLess(z, y)) { swap(x, z); return 1; }
    swap(x, y); if (atLess(z, y)) { swap(y, z); return 2; } return 1;
  };
  const small = (first: number, length: number) => {
    if (length < 2) return;
    if (length === 2) { if (atLess(first + 1, first)) swap(first, first + 1); return; }
    three(first, first + 1, first + 2);
    for (let i = first + 3; i < first + length; i++) for (let j = i; j > first && atLess(j, j - 1); j--) swap(j, j - 1);
  };
  const insertion = (first: number, last: number, incomplete: boolean) => {
    if (last - first <= 5) { small(first, last - first); return true; }
    three(first, first + 1, first + 2); let moved = 0;
    for (let i = first + 3; i < last; i++) {
      if (atLess(i, i - 1)) {
        const value = get(i); let j = i;
        do { set(j, get(j - 1)); j--; } while (j !== first && less(value, get(j - 1)));
        set(j, value);
        if (incomplete && ++moved === 8) return i + 1 === last;
      }
    }
    return true;
  };
  const sort = (start: number, end: number) => {
    let first = start, last = end;
    restart: while (true) {
      const length = last - first;
      if (length <= 5) { small(first, length); return; }
      if (length <= 30) { insertion(first, last, false); return; }
      let median = first + Math.floor(length / 2), swaps = three(first, median, last - 1);
      let i = first, j = last - 1;
      if (!atLess(i, median)) {
        while (true) {
          if (i === --j) {
            i++; j = last - 1;
            if (!atLess(first, j)) {
              while (true) {
                if (i === j) return;
                if (atLess(first, i)) { swap(i, j); swaps++; i++; break; }
                i++;
              }
            }
            if (i === j) return;
            while (true) {
              while (!atLess(first, i)) i++;
              while (atLess(first, --j)) { /* original downward scan */ }
              if (i >= j) break;
              swap(i, j); swaps++; i++;
            }
            first = i; continue restart;
          }
          if (atLess(j, median)) { swap(i, j); swaps++; break; }
        }
      }
      i++;
      if (i < j) {
        while (true) {
          while (atLess(i, median)) i++;
          while (!atLess(--j, median)) { /* guarded by the first partition */ }
          if (i > j) break;
          swap(i, j); swaps++; if (median === i) median = j; i++;
        }
      }
      if (i !== median && atLess(median, i)) { swap(i, median); swaps++; }
      if (!swaps) {
        const leftDone = insertion(first, i, true), rightDone = insertion(i + 1, last, true);
        if (rightDone) { if (leftDone) return; last = i; continue; }
        if (leftDone) { first = i + 1; continue; }
      }
      if (i - first < last - i) { sort(first, i); first = i + 1; }
      else { sort(i + 1, last); last = i; }
    }
  };
  sort(0, count);
}
