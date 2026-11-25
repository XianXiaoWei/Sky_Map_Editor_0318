import {modelBakeCases,prepareModelBakeLookup,type ModelBakeCase} from './model-baked-cases';
export function modelUnbakedCases():ModelBakeCase[]{
 const cases=modelBakeCases().filter(c=>!c.source||c.source.kind==='mesh'),base=cases.find(c=>c.name==='index-0-0')!;
 for(const ready of [0,1,2,255])for(const index of [-1,0,1,2,0x7fffffff]){const b=Buffer.from(base.memory,'hex');b[0x508]=ready;cases.push({...base,name:`ready-${ready}-${index}`,index,memory:b.toString('hex')});}
 return cases.map(c=>prepareModelBakeLookup({...c,op:3}));
}
