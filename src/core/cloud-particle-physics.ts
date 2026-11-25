const f=Math.fround,add=(a:number,b:number)=>f(f(a)+f(b)),sub=(a:number,b:number)=>f(f(a)-f(b));
const mul=(a:number,b:number)=>f(f(a)*f(b)),div=(a:number,b:number)=>f(f(a)/f(b));
const dot=(a:number[],b:number[])=>add(mul(a[2],b[2]),add(mul(a[0],b[0]),mul(a[1],b[1])));
const length=(a:number[])=>f(Math.sqrt(dot(a,a)));
const difference=(a:number[],b:number[])=>a.map((v,i)=>sub(v,b[i]));
// These native max(0,x), min(x,1) pairs choose 1 for unordered x.
const clamp=(v:number)=>Number.isNaN(v)?1:Math.min(1,Math.max(0,v));
const normalize=(v:number[],threshold:number)=>{const n=length(v);return n>f(threshold)?v.map(x=>div(x,n)):v;};
export interface CloudParticlePhysicsInput {
 position:number[];velocity:number[];speed:number;size:number;delta:number;
 // Explicit outputs of the preceding nearest-three interaction block:
 // forceVelocity is its weighted velocity average; forceVector is the
 // accumulated displacement/response. Native adds them before smoothing.
 forceVelocity:number[];forceVector:number[];minimumDistance:number;
 sphere:{previous:number[];current:number[];velocity:number[];direction:number[];weight:number};
}
export interface CloudParticlePhysicsMath {exp:(value:number)=>number;}
const jsMath:CloudParticlePhysicsMath={exp:v=>f(Math.exp(v))};
// CloudParticleBarn integration 0x10022757e..0x100227885 and the original
// exponential weights at 0x100226839..0x1002268db. Interaction selection and
// force production remain separate explicit inputs, not invented samples.
export function stepCloudParticlePhysics(input:CloudParticlePhysicsInput,math=jsMath) {
 const valid3=(v:number[])=>v.length===3&&v.every(n=>Number.isFinite(n)&&Number.isFinite(f(n)));
 if(![input.position,input.velocity,input.forceVelocity,input.forceVector,input.sphere.previous,input.sphere.current,input.sphere.velocity,input.sphere.direction].every(valid3)
   || ![input.speed,input.size,input.delta,input.minimumDistance,input.sphere.weight].every(n=>Number.isFinite(n)&&Number.isFinite(f(n)))||input.delta<=0)throw new Error('原云粒子物理输入无效');
 const delta=f(input.delta),velocityWeight=sub(1,f(math.exp(mul(delta,-18.858261108398438)))),velocityRemaining=sub(1,velocityWeight);
 const speedWeight=sub(1,f(math.exp(mul(delta,-27.488723754882812)))),speedRemaining=sub(1,speedWeight);
 const blended=input.velocity.map((v,i)=>add(mul(mul(add(input.forceVector[i],input.forceVelocity[i]),.8),velocityWeight),mul(v,velocityRemaining)));
 const speed=add(mul(speedRemaining,input.speed),mul(div(length(blended),.8),speedWeight));
 const offset=difference(input.position,input.sphere.previous),axis=input.sphere.direction.map(f),axisDot=dot(axis,offset);
 const radial=normalize(offset.map((v,i)=>sub(v,mul(axis[i],axisDot))),1e-5),relative=difference(blended,input.sphere.velocity),radialDot=dot(radial,relative);
 const constrained=input.sphere.velocity.map((v,i)=>add(v,sub(relative[i],mul(radial[i],radialDot))));
 let amount=mul(f(.08249999582767487),input.sphere.weight);
 amount=mul(clamp(div(add(input.minimumDistance,-2.5),f(-1.5))),amount);
 const velocity=blended.map((v,i)=>add(mul(v,sub(1,amount)),mul(amount,constrained[i]))),velocityLength=length(velocity);
 let gate=clamp(div(add(velocityLength,f(-.4)),f(-.4)));
 gate=add(mul(gate,0),sub(1,gate));gate=mul(gate,gate);
 const displacementScale=mul(mul(speed,delta),gate),unitVelocity=velocityLength>f(.001)?velocity.map(v=>div(v,velocityLength)):[0,1,0];
 const displacement=unitVelocity.map(v=>mul(displacementScale,v)),position=input.position.map((v,i)=>add(v,displacement[i]));
 const remainingVelocity=velocity.map((v,i)=>sub(v,displacement[i]));
 const outward=normalize(difference(position,input.sphere.current),1e-5);
 const movement=position.map((v,i)=>sub(div(sub(v,input.position[i]),delta),input.sphere.velocity[i]));
 const projected=dot(movement,outward),growth=mul(clamp(projected),f(1.1));
 const size=add(input.size,mul(Number.isNaN(growth)?f(.25):Math.max(f(.25),growth),delta));
 return {position,velocity:remainingVelocity,speed,size,vector:input.forceVector.map(v=>mul(v,f(.15)))};
}
