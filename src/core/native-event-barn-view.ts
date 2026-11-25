import type { NativeEventBarnMemory } from './native-event-barn-runtime';
import { originalEventBarnCapacity, type OriginalEventBarn, type OriginalEventNode } from './event-barn-runtime';

/** Resolve original slot pointers into shared event buffers. The state machine
 * reads and writes the same Barn/Event storage used by creation and field load.
 * Callbacks replace events through barn.nodes; commit writes those slot/link
 * changes back after dispatch. Other state bytes are shared throughout. */
export function bindNativeEventBarnView(memory: NativeEventBarnMemory, address: bigint, bytes: Uint8Array,
  resolveEvent: (pointer: bigint) => Uint8Array, eventPointer: (event: Uint8Array) => bigint):
  { barn: OriginalEventBarn; commit(): void } {
  if (bytes.byteLength < 0x1050f4) throw new Error('Incomplete native EventBarn allocation');
  const nodes: OriginalEventNode[] = Array.from({ length: originalEventBarnCapacity }, () => ({ event: null, next: null }));
  const nodeFor = (pointer: bigint): OriginalEventNode | null => {
    if (!pointer) return null;
    const offset = pointer - address - 0x30n;
    if (offset < 0n || offset >= 0x5000n || offset % 16n) throw new Error('Invalid native EventBarn node pointer');
    return nodes[Number(offset / 16n)];
  };
  nodes.forEach((node, index) => {
    const slot = address + 0x30n + BigInt(index * 16), pointer = memory.read64(slot);
    node.event = pointer ? resolveEvent(pointer) : null;
    node.next = nodeFor(memory.read64(slot + 8n));
  });
  const barn: OriginalEventBarn = { bytes, nodes, freeHead: nodeFor(memory.read64(address + 0x5030n)) };
  const pointers = new Map(nodes.map((node, index) => [node, address + 0x30n + BigInt(index * 16)]));
  const pointerFor = (node: OriginalEventNode | null): bigint => {
    if (!node) return 0n;
    const pointer = pointers.get(node);
    if (pointer === undefined) throw new Error('Foreign native EventBarn node');
    return pointer;
  };
  return { barn, commit() {
    nodes.forEach((node, index) => {
      const slot = address + 0x30n + BigInt(index * 16);
      memory.write64(slot, node.event ? eventPointer(node.event) : 0n);
      memory.write64(slot + 8n, pointerFor(node.next));
    });
    memory.write64(address + 0x5030n, pointerFor(barn.freeHead));
  } };
}
