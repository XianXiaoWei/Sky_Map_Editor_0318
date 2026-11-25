import { MAX_CLOUD_CARDS } from './cloud-card-layout';

// Original specialized libc++ control flow: group records at 0x100222830
// use insertion limit 6; distance records at 0x100224290 use limit 30.
// Array.sort is stable in JS and produces a different equal-key permutation.
// Return source indices so complete records remain associated with their key.
function originalOrder(length: number, lessSource: (a: number, b: number) => boolean, insertionLimit: number) {
  const order = Array.from({ length }, (_, i) => i);
  const less = (a: number, b: number) => lessSource(order[a], order[b]);
  const swap = (a: number, b: number) => { [order[a], order[b]] = [order[b], order[a]]; };
  function sort3(x: number, y: number, z: number) {
    if (!less(y, x)) {
      if (!less(z, y)) return 0;
      swap(y, z);
      if (less(y, x)) { swap(x, y); return 2; }
      return 1;
    }
    if (less(z, y)) { swap(x, z); return 1; }
    swap(x, y);
    if (less(z, y)) { swap(y, z); return 2; }
    return 1;
  }
  function small(first: number, end: number) {
    const count = end - first;
    if (count === 2) { if (less(first + 1, first)) swap(first, first + 1); }
    else if (count >= 3) {
      sort3(first, first + 1, first + 2);
      // Original sort4/sort5 use adjacent swaps after sort3.
      for (let i = first + 3; i < end; i++) for (let j = i; j > first && less(j, j - 1); j--) swap(j, j - 1);
    }
  }
  function insertion(first: number, end: number, incomplete: boolean) {
    if (end - first <= 5) { small(first, end); return true; }
    sort3(first, first + 1, first + 2);
    let count = 0;
    for (let i = first + 3; i < end; i++) {
      if (!less(i, i - 1)) continue;
      const value = order[i]; let j = i;
      do { order[j] = order[j - 1]; j--; } while (j !== first && lessSource(value, order[j - 1]));
      order[j] = value;
      if (incomplete && ++count === 8) return i + 1 === end;
    }
    return true;
  }
  function sort(first: number, end: number) {
    restart: while (true) {
      const count = end - first;
      if (count <= 5) { small(first, end); return; }
      if (count <= insertionLimit) { insertion(first, end, false); return; }
      let middle = first + Math.floor(count / 2), swaps: number;
      if (count >= 1000) {
        // The 1024-particle specialization reaches the original sort5
        // median branch. CloudCard's 512 capacity never takes this path.
        const quarter = Math.floor(count / 4), samples = [first, first + quarter, middle, middle + quarter, end - 1];
        swaps = sort3(samples[0], samples[1], samples[2]);
        for (let k = 3; k < 5; k++) for (let j = k; j > 0 && less(samples[j], samples[j - 1]); j--) {
          swap(samples[j], samples[j - 1]); swaps++;
        }
      } else swaps = sort3(first, middle, end - 1);
      let i = first, j = end - 1;
      if (!less(i, middle)) {
        while (true) {
          if (i === --j) {
            i++; j = end;
            if (!less(first, --j)) {
              while (true) {
                if (i === j) return;
                if (less(first, i)) { swap(i, j); swaps++; i++; break; }
                i++;
              }
            }
            if (i === j) return;
            while (true) {
              while (!less(first, i)) i++;
              while (less(first, --j)) { /* guarded downward scan */ }
              if (i >= j) break;
              swap(i, j); swaps++; i++;
            }
            first = i;
            continue restart;
          }
          if (less(j, middle)) { swap(i, j); swaps++; break; }
        }
      }
      i++;
      if (i < j) {
        while (true) {
          while (less(i, middle)) i++;
          while (!less(--j, middle)) { /* guarded downward scan */ }
          if (i > j) break;
          swap(i, j); swaps++;
          if (middle === i) middle = j;
          i++;
        }
      }
      if (i !== middle && less(middle, i)) { swap(i, middle); swaps++; }
      if (swaps === 0) {
        const leftDone = insertion(first, i, true);
        if (insertion(i + 1, end, true)) {
          if (leftDone) return;
          end = i; continue;
        }
        if (leftDone) { first = i + 1; continue; }
      }
      if (i - first < end - i) { sort(first, i); first = i + 1; }
      else { sort(i + 1, end); end = i; }
    }
  }
  sort(0, length);
  return Uint32Array.from(order);
}

export function cloudCardGroupOrder(groups: ArrayLike<number>) {
  if (groups.length > MAX_CLOUD_CARDS || !Array.from(groups).every(v => Number.isInteger(v) && v >= 0 && v <= 0xffffffff)) throw new Error('CloudCard 连接组排序输入无效');
  return originalOrder(groups.length, (a, b) => groups[a] < groups[b], 6);
}

export function cloudCardDistanceOrder(distances: ArrayLike<number>) {
  if (distances.length > MAX_CLOUD_CARDS || !Array.from(distances).every(v => Number.isFinite(Math.fround(v)) && v >= 0)) throw new Error('CloudCard 距离排序输入无效');
  const values = Array.from(distances, Math.fround);
  return originalOrder(values.length, (a, b) => values[a] < values[b], 30);
}

// Original CloudParticleBarn's uint16 index specialization at 0x100229600.
// Keys are signed view-space depth, not squared nonnegative distance.
export function cloudParticleDepthOrder(depths: ArrayLike<number>) {
  if (depths.length > 1024 || !Array.from(depths).every(v => Number.isFinite(Math.fround(v)))) throw new Error('云粒子深度排序输入无效');
  const values = Array.from(depths, Math.fround);
  return Uint16Array.from(originalOrder(values.length, (a, b) => values[a] < values[b], 30));
}
