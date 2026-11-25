import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';

const fail = (file: string, line: number, severity: number, expression: string): never => {
  throw new NativeObjectFoundationFailure(file, line, severity, expression);
};
const byte = (m: ModelBakeMemory, address: bigint) => m.bytes(address, 1)[0];

/** Whole RenderList registration 0x1007b97b0. The fixed table has holes and
 * permits duplicate registrations. A null render is a no-op, even at capacity. */
export function registerOriginalRenderList(m: ModelBakeMemory, list: bigint, render: bigint): void {
  if (!render) return;
  const capacity = m.read32(list + 0x18n);
  if (capacity) {
    const slots = m.read64(list);
    for (let i = 0; i < capacity; i++) {
      const slot = slots + BigInt(i) * 8n;
      if (!m.read64(slot)) {m.write64(slot, render); return;}
    }
  }
  fail('RenderList.cpp', 90, 4, 'allocated');
}

/** Whole unregister 0x1007b9820. Clears every matching registration and
 * stably removes every queued occurrence. Native leaves the unused queue tail
 * and render's queued flag untouched; it does not swap with the last entry. */
export function unregisterOriginalRenderList(m: ModelBakeMemory, list: bigint, render: bigint): void {
  const capacity = m.read32(list + 0x18n);
  for (let i = 0; i < capacity; i++) {
    const slot = m.read64(list) + BigInt(i) * 8n;
    if (m.read64(slot) === render) m.write64(slot, 0n);
  }
  const table = m.read64(list + 0x10n), count = m.read32(list + 8n);
  let out = 0;
  for (let i = 0; i < count; i++) {
    const item = m.read64(table + BigInt(i) * 8n);
    if (item !== render) {
      if (out !== i) m.write64(table + BigInt(out) * 8n, item);
      out++;
    }
  }
  m.write32(list + 8n, out);
}

/** Whole queue append 0x1007b9990. Storage/capacity belongs to the scene
 * owner; native adds no capacity check here. Count is stored before the item. */
export function appendOriginalRenderList(m: ModelBakeMemory, list: bigint, render: bigint): void {
  if (!byte(m, render + 0x538n)) fail('RenderList.cpp', 109, 3, 'vertexRender->IsInitialized()');
  const table = m.read64(list + 0x10n), count = m.read32(list + 8n);
  m.write32(list + 8n, (count + 1) >>> 0);
  m.write64(table + BigInt(count) * 8n, render);
}

/** Whole primitive count 0x1007f65d0, including native's non-indexed chunk
 * check against the selected index buffer capacity, uint32 accumulation and
 * topology conversion. This is the real eligibility gate before submission. */
export function countOriginalRenderPrimitives(m: ModelBakeMemory, render: bigint): number {
  const data = m.read64(render), index = BigInt(m.read32(render + 0x508n)) * 0x38n;
  const indexed = m.read32(data + index + 0x250n), offset = m.read32(render + (indexed ? 0x518n : 0x514n));
  if (offset > m.read32(data + (indexed ? index + 0x244n : 0x13cn))) {
    fail('Vertex.cpp', indexed ? 397 : 398, 3, indexed ? 'm_indexOffset <= idxBuf.capacity' : 'useIdxs || m_vertexOffset <= m_vertexData->m_vertexCapacity');
  }
  let count = 0;
  if (byte(m, render + 0x528n)) {
    const chunks = m.read32(render + 0x53cn);
    if (chunks) {
      const capacity = m.read32(data + index + 0x244n);
      for (let i = 0; i < chunks; i++) {
        const chunk = render + 0x540n + BigInt(i) * 12n;
        const chunkOffset = m.read32(chunk);
        if (chunkOffset > capacity) fail('Vertex.cpp', 406, 3, 'chunk.idxOffset <= idxBuf.capacity');
        const remaining = indexed ? capacity - chunkOffset : (m.read32(data + 0x13cn) - m.read32(render + 0x514n)) >>> 0;
        count = (count + Math.min(remaining, m.read32(chunk + 4n))) >>> 0;
      }
    }
  } else {
    const capacity = m.read32(data + (indexed ? index + 0x244n : 0x13cn));
    count = Math.min((capacity - offset) >>> 0, m.read32(render + 0x50cn));
  }
  const topology = m.read32(render + 0x524n);
  return topology === 1 || topology === 5 ? count >>> 1 : topology === 4 ? Math.floor(count / 3) : count;
}

/** Whole VertexRender queue wrapper 0x1007f6540. Nonzero initialized/enabled
 * bytes are accepted, while the duplicate guard is specifically queued == 1.
 * A missing list still marks a nonempty render queued, as the original does. */
export function queueOriginalVertexRender(m: ModelBakeMemory, render: bigint): void {
  if (!byte(m, render + 0x538n)) fail('Vertex.cpp', 306, 3, 'IsInitialized()');
  if (byte(m, render + 0x52an) === 1) fail('Vertex.cpp', 307, 3, '!m_queued');
  if (!byte(m, render + 0x529n) || !countOriginalRenderPrimitives(m, render)) return;
  const list = m.read64(render + 0x500n);
  if (list) appendOriginalRenderList(m, list, render);
  m.write8(render + 0x52an, 1);
}

/** Whole EndQueue 0x1007f6770. Frame queue count is owned elsewhere. */
export function endOriginalVertexRenderQueue(m: ModelBakeMemory, render: bigint): void {
  m.write8(render + 0x52an, 0);
}

/** Whole context lookup 0x1007ba080. Optional outputs are unchanged on miss;
 * writes retain original order for aliased output pointers. */
export function findOriginalRenderListContext(m: ModelBakeMemory, list: bigint, formatOut = 0n, contextOut = 0n, flagOut = 0n): boolean {
  if (!byte(m, list + 0x3cn)) return false;
  if (formatOut) m.write64(formatOut, list + 0xc0n);
  if (contextOut) m.write64(contextOut, list + 0x40n);
  if (flagOut) m.write8(flagOut, byte(m, list + 0xe0n));
  return true;
}

export interface OriginalRenderListContextServices {
  updateRenderFormat(render: bigint, format: bigint, context: bigint): void;
}
/** Whole SetContext 0x1007b9fc0. GPU program refresh is an explicit service;
 * slots and capacity are re-read after each live callback. Ready is set last. */
export function setOriginalRenderListContext(m: ModelBakeMemory, list: bigint, format: bigint, context: bigint, flag: number, services: OriginalRenderListContextServices): void {
  m.bytes(list + 0xc0n, 32).set(Uint8Array.from(m.bytes(format, 32)));
  const snapshot = Uint8Array.from(m.bytes(context, 128));
  for (const offset of [96, 64, 32, 0]) m.bytes(list + 0x40n + BigInt(offset), 32).set(snapshot.subarray(offset, offset + 32));
  m.write8(list + 0xe0n, flag);
  let capacity = m.read32(list + 0x18n);
  for (let i = 0; i < capacity; i++) {
    const render = m.read64(m.read64(list) + BigInt(i) * 8n);
    if (render) {
      services.updateRenderFormat(render, list + 0xc0n, list + 0x40n);
      capacity = m.read32(list + 0x18n);
    }
  }
  m.write8(list + 0x3cn, 1);
}

/** Shared services for the existing original VertexRender initializer,
 * Renderable reset and Model submission. Operates on their live memory only;
 * it allocates neither a substitute Model nor a scene registry. */
export function originalRenderListServices(memory: ModelBakeMemory) {
  return {
    registerRenderList: (list: bigint, render: bigint) => registerOriginalRenderList(memory, list, render),
    unregisterRenderList: (list: bigint, render: bigint) => unregisterOriginalRenderList(memory, list, render),
    queue: (render: bigint) => queueOriginalVertexRender(memory, render),
    findRenderContext: (list: bigint, _initialFormat: Uint8Array) => ({
      found: byte(memory, list + 0x3cn) !== 0, format: list + 0xc0n, context: list + 0x40n,
    }),
  };
}
