import * as THREE from 'three';
import {canIgnite,ignitionDistance,type IgnitionSnapshot,type IgnitionTarget} from '../core/viewport-ignition';

type Bridge={viewportIgnitionState():Promise<IgnitionSnapshot>;igniteViewportTarget(token:number,id:number):Promise<IgnitionSnapshot>;resetViewportIgnition():Promise<unknown>;ignitionUiAssets():Promise<{name:string;atlas:string;uv:number[];image:string;ring:string}>};
/** DOM interaction over the Vulkan viewport. Targets come from actual Candle
 * records and saved SoulTrap members with submitted DarkStone geometry. */
export class IgnitionController {
 private state?:IgnitionSnapshot;private generation=0;private polling=false;private nextPoll=0;private pending=false;
 private target?:IgnitionTarget;private eye=new THREE.Vector3();private ray=new THREE.Raycaster();private projected=new THREE.Vector3();
 private originals=new Map<number,{object:THREE.Object3D;matrix:THREE.Matrix4;auto:boolean;visible:boolean}>();
 private button:HTMLButtonElement;private level='';
 constructor(private root:HTMLElement,private api:Bridge,private objects:Map<number,THREE.Object3D>,private content:THREE.Object3D,private changed:()=>void,private error:(message:string)=>void){
  this.button=document.createElement('button');this.button.id='ignite-target';this.button.className='ignition-action';this.button.hidden=true;this.button.type='button';
  this.button.innerHTML='<span class="ignition-ring" aria-hidden="true"></span><span class="ignition-icon" aria-hidden="true"></span><span class="ignition-label">点火</span><kbd>X</kbd>';
  this.button.setAttribute('aria-label','点燃附近目标');this.button.title='点燃 · X';
  root.append(this.button);
  for(const event of ['pointerdown','pointerup','mousedown','touchstart','contextmenu'])this.button.addEventListener(event,e=>e.stopPropagation());
  this.button.onclick=e=>{e.stopPropagation();void this.ignite();};
  window.addEventListener('keydown',e=>{if(e.code!=='KeyX'||e.repeat||e.ctrlKey||e.altKey||e.metaKey||(e.target as HTMLElement)?.closest('input,textarea,select,[contenteditable="true"]')||this.button.hidden)return;e.preventDefault();e.stopImmediatePropagation();void this.ignite();},true);
 }
 reset(level=''){
  this.generation++;this.level=level;this.state=undefined;this.target=undefined;this.pending=false;this.nextPoll=0;this.button.hidden=true;
  for(const p of this.originals.values()){p.object.matrix.copy(p.matrix);p.object.matrixAutoUpdate=p.auto;p.object.visible=p.visible;delete p.object.userData.ignitionProgress;delete p.object.userData.ignitionShape;p.object.updateMatrixWorld(true);}this.originals.clear();
 }
 configure(level:string){this.reset(level);const generation=this.generation;this.polling=true;void this.api.resetViewportIgnition().catch(e=>{if(generation===this.generation)this.error(e.message);}).finally(()=>{if(generation===this.generation)this.polling=false;});
  void this.api.ignitionUiAssets().then(asset=>{
   if(generation!==this.generation)return;
   const [u0,v0,u1,v1]=asset.uv,icon=this.button.querySelector<HTMLElement>('.ignition-icon')!,ring=this.button.querySelector<HTMLElement>('.ignition-ring')!;
   icon.style.maskImage=`url("${asset.image}")`;icon.style.maskSize=`${100/(u1-u0)}% ${100/(v1-v0)}%`;icon.style.maskPosition=`${100*u0/(1-(u1-u0))}% ${100*v0/(1-(v1-v0))}%`;
   ring.style.maskImage=`url("${asset.ring}")`;this.button.dataset.nativeIcon=asset.name;this.button.dataset.nativeAtlas=asset.atlas;
  }).catch(e=>{if(generation===this.generation)this.error(e.message);});
 }
 private accept(state:IgnitionSnapshot){
  if(state.level!==this.level)return;
  let geometryChanged=false;
  if(this.state&&state.token!==this.state.token){for(const p of this.originals.values()){p.object.matrix.copy(p.matrix);p.object.matrixAutoUpdate=p.auto;p.object.visible=p.visible;delete p.object.userData.ignitionProgress;delete p.object.userData.ignitionShape;p.object.updateMatrixWorld(true);geometryChanged=true;}this.originals.clear();}
  this.state=state;
  if(this.target&&state.targets.find(t=>t.nodeId===this.target!.nodeId)?.lit){this.target=undefined;this.button.hidden=true;}
  for(const t of state.targets){
   if(t.kind!=='darkstone'||!t.lit)continue;const object=this.objects.get(t.nodeId);if(!object)continue;
   let original=this.originals.get(t.nodeId);
   if(!original){object.updateMatrix();original={object,matrix:object.matrix.clone(),auto:object.matrixAutoUpdate,visible:object.visible};this.originals.set(t.nodeId,original);}
   object.matrixAutoUpdate=false;const scale=t.shrinkScale??[1,1,1];
   // Original Darkstone transform updates preserve the model translation.
   object.matrix.copy(original.matrix).multiply(new THREE.Matrix4().makeScale(scale[0],scale[1],scale[2]));
   const visible=original.visible&&!t.burnt;
   const shapeKey=scale.join(',');geometryChanged=geometryChanged||object.visible!==visible||object.userData.ignitionProgress!==t.progress||object.userData.ignitionShape!==shapeKey;
   object.userData.ignitionProgress=t.progress;object.userData.ignitionShape=shapeKey;object.visible=visible;object.updateMatrixWorld(true);
  }
  if(geometryChanged)this.changed();
 }
 private visible(t:IgnitionTarget,camera:THREE.PerspectiveCamera){
  const object=this.objects.get(t.nodeId);if(t.kind==='darkstone'&&(!object||!object.visible))return false;
  const position=new THREE.Vector3().fromArray(t.position);this.projected.copy(position).project(camera);
  if(this.projected.z<=-1||this.projected.z>=1||Math.abs(this.projected.x)>.93||Math.abs(this.projected.y)>.9)return false;
  const delta=position.clone().sub(this.eye),distance=delta.length();if(distance<.01)return false;
  this.ray.set(this.eye,delta.divideScalar(distance));this.ray.far=Math.max(0,distance-.15);this.ray.near=.05;
  const hits=this.ray.intersectObjects(this.content.children,true);
  return !hits.some(h=>{if(!h.object.visible||h.object.userData.editorHelper)return false;let p:THREE.Object3D|null=h.object;while(p){if(p.userData.nodeId===t.nodeId)return false;p=p.parent;}return true;});
 }
 private place(element:HTMLElement,t:IgnitionTarget,camera:THREE.PerspectiveCamera){
  this.projected.fromArray(t.position).project(camera);element.style.left=((this.projected.x+1)*.5*this.root.clientWidth)+'px';element.style.top=((1-this.projected.y)*.5*this.root.clientHeight)+'px';
 }
 update(now:number,camera:THREE.PerspectiveCamera,paused:boolean){
  this.eye.copy(camera.position);if(!this.level||paused){this.button.hidden=true;this.target=undefined;return;}
  if(!this.polling&&now>=this.nextPoll){const generation=this.generation;this.polling=true;this.nextPoll=now+250;void this.api.viewportIgnitionState().then(state=>{if(generation===this.generation)this.accept(state);}).catch(()=>{}).finally(()=>{if(generation===this.generation)this.polling=false;});}
  const targets=this.state?.targets??[];this.target=targets.filter(t=>canIgnite(t,this.eye.toArray())).sort((a,b)=>ignitionDistance(a,this.eye.toArray())-ignitionDistance(b,this.eye.toArray())).find(t=>this.visible(t,camera));
  this.button.hidden=!this.target;this.button.disabled=this.pending;
  if(this.target){this.place(this.button,this.target,camera);this.button.dataset.nodeId=String(this.target.nodeId);this.button.dataset.kind=this.target.kind;this.button.setAttribute('aria-label',this.target.kind==='candle'?'点燃蜡烛':'烧掉黑暗植物');}
 }
 private async ignite(){
  const target=this.target,state=this.state;if(!target||!state||this.pending||!canIgnite(target,this.eye.toArray()))return;
  const generation=this.generation;this.pending=true;this.button.disabled=true;
  try{const next=await this.api.igniteViewportTarget(state.token,target.nodeId);if(generation===this.generation){this.accept(next);this.changed();}}
  catch(e){if(generation===this.generation)this.error((e as Error).message);}
  finally{if(generation===this.generation)this.pending=false;}
 }
}
