import evidence from '../../docs/beamo-rsqrt-capability.json';
const sample=Uint8Array.from(evidence.fallbackLightingHex.match(/../g)!,h=>parseInt(h,16));
/** Explicit viewport fallback for resources without a compatible saved bake.
 * Uses the independently executed original default-light encoder bytes shared
 * by the model uploader. It is labeled default lighting, never a saved bake. */
export function defaultModelLighting(vertexCount:number){
 if(!Number.isInteger(vertexCount)||vertexCount<0||vertexCount>1000000||sample.length!==12)throw new Error('Default model lighting size invalid');
 const output=new Uint8Array(vertexCount*12);for(let i=0;i<vertexCount;i++)output.set(sample,i*12);return output;
}
