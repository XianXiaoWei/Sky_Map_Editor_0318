import {modelBakeCases,prepareModelBakeLookup,type ModelBakeCase} from './model-baked-cases';
export function modelLodCases():ModelBakeCase[]{
 const source=modelBakeCases(),selected=source.filter(c=>c.name.startsWith('resources-')||c.source?.kind==='mesh'&&c.source.lod===0),base=source.find(c=>c.name==='index-0-0')!;
 for(const count of [0,1,2,6,7,0x7fffffff,0x80000000,0xffffffff]){const b=Buffer.from(base.memory,'hex');b.writeUInt32LE(count,0x4e8);selected.push({...base,name:`lod-count-${count}`,memory:b.toString('hex')});}
 return selected.map(c=>prepareModelBakeLookup({...c,op:2,out:0x1900}));
}
