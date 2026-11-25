import {cloudParticleDrawInstances,stepCloudParticleLife,type CloudParticlePackCamera} from './cloud-particle-dynamic';
import {CLOUD_PARTICLE_BARN_BYTES,cloudParticleEmissionSources,cloudParticleQueuedSpheres,type CloudParticlePhysicsSphere} from './cloud-particle-emission';
import {stepCloudParticlePhysics,type CloudParticlePhysicsInput} from './cloud-particle-physics';
export type CloudParticleInteraction = Pick<CloudParticlePhysicsInput,'forceVelocity'|'forceVector'|'minimumDistance'|'sphere'>;
// A reviewable runtime chain for explicit particle state and interaction
// inputs. Life -> copy previous positions -> integration -> instance packing
// -> original depth order. Full native interaction production is pending.
// Returns a new snapshot so a missing/invalid interaction never half-updates
// the caller's ring. No default zero forces or synthesized spheres.
export function stepCloudParticleRuntime(storage:Uint8Array,scaledDelta:number,time:number,camera:CloudParticlePackCamera,
  interaction:(slot:number,queuedSpheres:CloudParticlePhysicsSphere[])=>CloudParticleInteraction) {
  if(!(storage instanceof Uint8Array)||storage.length!==CLOUD_PARTICLE_BARN_BYTES||typeof interaction!=='function'||!Number.isFinite(Math.fround(scaledDelta))||scaledDelta<=0)throw new Error('原云粒子运行输入无效');
  const next=storage.slice(),view=new DataView(next.buffer),read3=(base:number,slot:number)=>Array.from({length:3},(_,lane)=>view.getFloat32(base+lane*0x1000+slot*4,true));
  const queuedSpheres=cloudParticleQueuedSpheres(next);
  // Original copies the queued spheres to temporary interaction sources,
  // then clears the count before aging/integrating particles.
  view.setUint32(0xc820,0,true);
  const life=new Float32Array(1024);for(let slot=0;slot<1024;slot++)life[slot]=view.getFloat32(0x8018+slot*4,true);
  const ring=stepCloudParticleLife({life,head:view.getUint32(0xc824,true),count:view.getUint32(0xc828,true)},scaledDelta);
  view.setUint32(0xc824,ring.head,true);view.setUint32(0xc828,ring.count,true);
  for(let slot=0;slot<1024;slot++)view.setFloat32(0x8018+slot*4,ring.life[slot],true);
  const previous=new Float32Array(3072),vectors=new Float32Array(3072);
  for(let index=0;index<ring.count;index++) {
    const slot=(ring.head+index)&1023,position=read3(0x18,slot);
    position.forEach((v,lane)=>previous[lane*1024+slot]=v);
    const result=stepCloudParticlePhysics({...interaction(slot,queuedSpheres),position,velocity:read3(0x4018,slot),speed:view.getFloat32(0x7018+slot*4,true),size:view.getFloat32(0x3018+slot*4,true),delta:scaledDelta});
    for(let lane=0;lane<3;lane++) {
      view.setFloat32(0x18+lane*0x1000+slot*4,result.position[lane],true);
      view.setFloat32(0x4018+lane*0x1000+slot*4,result.velocity[lane],true);
      vectors[lane*1024+slot]=result.vector[lane];
    }
    view.setFloat32(0x7018+slot*4,result.speed,true);view.setFloat32(0x3018+slot*4,result.size,true);
  }
  const draw=cloudParticleDrawInstances(cloudParticleEmissionSources(next,vectors,previous),camera,time);
  return {storage:next,head:ring.head,count:ring.count,...draw};
}
