import { prepareBeamoBakeInput,evaluatePreparedBeamoBake,type BeamoBakeInput } from '../src/core/beamo-bake-adapter';
export interface BeamoBakeCase extends BeamoBakeInput {label:string;}
export function beamoBakeMemory(c: BeamoBakeCase): Buffer {
 return Buffer.from(prepareBeamoBakeInput(c));
}
export function evaluateBeamoBake(c: BeamoBakeCase) {
 const result=evaluatePreparedBeamoBake(c),b=Buffer.from(result.memory),accepted=result.accepted;
 // Original stores the final predicate in a private stack slot.
 b.writeUInt32LE(+accepted,0xc68);
 const out=Buffer.alloc(4+b.length);out.writeUInt32LE(+accepted);b.copy(out,4);return out;
}
