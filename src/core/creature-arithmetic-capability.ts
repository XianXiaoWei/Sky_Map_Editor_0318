import evidence from '../../docs/creature-arithmetic-capability.json';
import type {NatureArithmeticServices} from './nature-event-runtime';
// Native SIMD geometry keeps an unused W lane through normalization (0/0).
// Its NaN sign can differ from the explicit JS libm return lane. Use the
// already captured native arithmetic results, without inventing new payloads.
const results=new Map(evidence.rows.map(([op,a,b,result])=>[`${op}:${a}:${b}`,result]));
export const originalCreatureArithmetic:NatureArithmeticServices={resolveDualNaN(op,a,b){
 const result=results.get(`${['add','sub','mul','div'].indexOf(op)}:${a>>>0}:${b>>>0}`);
 if(result===undefined)throw new Error('Creature dual-NaN operands are outside the captured original arithmetic capability');
 return result;
}};
