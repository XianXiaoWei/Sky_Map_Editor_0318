import type {ModelBakeMemory} from './model-baked-runtime';
export class OriginalCrabAuthorityDivideFailure extends Error {constructor(){super('Original CrabBarn authority division has zero player count');this.name='OriginalCrabAuthorityDivideFailure';}}
/** Whole 0x10025f030. Explicit owners override the round-robin player
 * selection; the original unsigned divide boundary is preserved. */
export function assignOriginalCrabAuthority(m:ModelBakeMemory,barn:bigint,players:bigint,count:number,invalidId:number){
 for(let i=0;i<m.read32(barn+0x410n);i++){
  const crab=m.read64(barn+16n+BigInt(i)*8n),owner=m.read32(crab+0x500n),specified=owner!==(invalidId>>>0);
  if(!specified&&!(count>>>0))throw new OriginalCrabAuthorityDivideFailure();
  m.write32(crab+0x598n,specified?owner:m.read32(players+BigInt(i%(count>>>0))*4n));m.write8(crab+0x59cn,Number(specified));
 }
}
export interface CrabBarnUpdateServices {
 findStream(owner:bigint,name:'CrabBarn'):bigint;
 receive(barn:bigint,stream:bigint,game:bigint):void;
 send(stream:bigint,game:bigint,crabs:bigint,count:number,playerId:number,deltaBits:number):void;
}
/** Whole 0x10025ed80; stream bodies are explicit services. The 128-byte
 * interaction history and its count are copied after receive/send returns. */
export function updateOriginalCrabBarn(m:ModelBakeMemory,barn:bigint,game:bigint,owner:bigint,s:CrabBarnUpdateServices){
 const stream=s.findStream(owner,'CrabBarn');
 if(stream){if(m.read32(stream))s.send(stream,game,barn+16n,m.read32(barn+0x410n),m.read32(m.read64(m.read64(game+0x178n)+32n)+0x7d18n),0x3f800000);else s.receive(barn,stream,game);}
 m.write32(barn+0x518n,m.read32(barn+0x514n));m.bytes(barn+0x494n,128).set(m.bytes(barn+0x414n,128));m.write32(barn+0x514n,0);
}
