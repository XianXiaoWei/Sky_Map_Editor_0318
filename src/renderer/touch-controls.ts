import * as THREE from 'three';
import type { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import type { TransformControls } from 'three/addons/controls/TransformControls.js';
interface TouchOptions {
  camera(): THREE.PerspectiveCamera;
  orbit: OrbitControls;
  transform: TransformControls;
  available(): boolean;
  editing(): boolean;
  brush(): boolean;
  brushStart(event: PointerEvent): void;
  brushMove(event: PointerEvent): void;
  brushEnd(): void;
  tap(event: PointerEvent): void;
  subject(): boolean;
  moveSubject(x: number, forward: number, vertical: number, jump: boolean): void;
  lookSubject(x: number, y: number): boolean;
  zoomSubject(factor: number): boolean;
}
/** Independent pointer ownership permits movement, look and elevation at the
 * same time. Camera motion runs in the existing display animation loop. */
export function createTouchControls(viewport: HTMLElement, canvas: HTMLCanvasElement, options: TouchOptions) {
  const axes = { x: 0, forward: 0, vertical: 0, yaw: 0, pitch: 0 }, points = new Map<number, {x: number; y: number; startX: number; startY: number}>();
  const root = document.createElement('div'); root.id = 'touch-controls';
  let previous = 0, moved = false, painting = false, gizmo = false, longPress: ReturnType<typeof setTimeout> | undefined;
  const cleanup: (() => void)[] = [], releases = new Set<() => void>();
  const stopLongPress = () => { clearTimeout(longPress); longPress = undefined; };
  const commit = () => { options.camera().lookAt(options.orbit.target); options.camera().updateMatrixWorld(); };
  const look = (x: number, y: number) => {
    if(options.subject()&&options.lookSubject(x,y))return;
    const camera=options.camera(), direction=options.orbit.target.clone().sub(camera.position), sphere=new THREE.Spherical().setFromVector3(direction);
    sphere.theta -= x; sphere.phi = THREE.MathUtils.clamp(sphere.phi + y, .005, Math.PI-.005);
    options.orbit.target.copy(new THREE.Vector3().setFromSpherical(sphere).add(camera.position)); commit();
  };
  const zoom = (factor: number) => {
    if(options.subject()&&options.zoomSubject(factor))return;
    const camera=options.camera(),offset=camera.position.clone().sub(options.orbit.target),distance=offset.length();
    if(distance>0)camera.position.copy(offset.multiplyScalar(THREE.MathUtils.clamp(distance*factor,Math.max(.2,options.orbit.minDistance),options.orbit.maxDistance)/distance).add(options.orbit.target));commit();
  };
  const pan = (x: number, y: number) => {
    if(options.subject())return;
    const camera=options.camera(),scale=2*camera.position.distanceTo(options.orbit.target)*Math.tan(THREE.MathUtils.degToRad(camera.fov/2))/Math.max(1,viewport.clientHeight);
    camera.updateMatrixWorld(); const delta=new THREE.Vector3().setFromMatrixColumn(camera.matrixWorld,0).multiplyScalar(-x*scale).addScaledVector(new THREE.Vector3().setFromMatrixColumn(camera.matrixWorld,1),y*scale);
    camera.position.add(delta);options.orbit.target.add(delta);commit();
  };
  const listen = (target: EventTarget, type: string, handler: EventListener, capture = false) => { target.addEventListener(type, handler, {capture,passive:false});cleanup.push(()=>target.removeEventListener(type,handler,capture)); };
  const reset = () => {
    stopLongPress();for(const release of [...releases])release();
    for(const id of points.keys())if(canvas.hasPointerCapture(id))canvas.releasePointerCapture(id);points.clear();
    if(painting){painting=false;options.brushEnd();}if(gizmo&&options.transform.dragging)options.transform.pointerUp({x:0,y:0,button:0} as PointerEvent);
    gizmo=false;moved=false;previous=0;for(const key of Object.keys(axes) as (keyof typeof axes)[])axes[key]=0;
    options.moveSubject(0,0,0,false); root.querySelectorAll<HTMLElement>('.touch-stick').forEach(el=>el.style.transform='');
  };
  function joystick(id: string, label: string, assign: (x: number,y: number)=>void) {
    const pad=document.createElement('div');pad.id=id;pad.className='touch-pad';pad.setAttribute('role','slider');pad.setAttribute('aria-label',label);pad.tabIndex=0;
    const title=document.createElement('span');title.textContent=label;const stick=document.createElement('i');stick.className='touch-stick';pad.append(title,stick);root.append(pad);
    let pointer: number | undefined;
    const release=()=>{if(pointer===undefined)return;const id=pointer;pointer=undefined;assign(0,0);stick.style.transform='';pad.classList.remove('pressed');if(pad.hasPointerCapture(id))pad.releasePointerCapture(id);releases.delete(release);};
    const update=(event:PointerEvent)=>{const r=pad.getBoundingClientRect(),radius=r.width*.36;let x=(event.clientX-r.x-r.width/2)/radius,y=(event.clientY-r.y-r.height/2)/radius;const length=Math.hypot(x,y);if(length>1){x/=length;y/=length;}stick.style.transform=`translate(${x*radius}px,${y*radius}px)`;const magnitude=Math.hypot(x,y),scale=magnitude<.12?0:(magnitude-.12)/(.88*magnitude);assign(x*scale,y*scale);pad.setAttribute('aria-valuetext',`${x.toFixed(2)}, ${(-y).toFixed(2)}`);};
    listen(pad,'pointerdown',((event:PointerEvent)=>{event.preventDefault();if(pointer!==undefined||!options.available())return;pointer=event.pointerId;pad.setPointerCapture(pointer);pad.classList.add('pressed');releases.add(release);update(event);}) as EventListener);
    listen(pad,'pointermove',((event:PointerEvent)=>{if(event.pointerId===pointer){if(!options.available())release();else update(event);}}) as EventListener);
    for(const type of ['pointerup','pointercancel','lostpointercapture'])listen(pad,type,((event:PointerEvent)=>{if(event.pointerId===pointer)release();}) as EventListener);
  }
  joystick('touch-move','移动',(x,y)=>{axes.x=x;axes.forward=-y;});
  joystick('touch-look','看向',(x,y)=>{axes.yaw=x;axes.pitch=y;});
  const bottom=document.createElement('div');bottom.className='touch-bottom';root.append(bottom);
  const elevate=document.createElement('input');elevate.id='touch-elevation';elevate.type='range';elevate.min='-1';elevate.max='1';elevate.step='.01';elevate.value='0';elevate.setAttribute('aria-label','下降或上升，松手归零');
  elevate.oninput=()=>{if(options.available())axes.vertical=Number(elevate.value);};
  const zero=()=>{axes.vertical=0;elevate.value='0';};
  listen(elevate,'pointerdown',((e:PointerEvent)=>{if(!options.available()){e.preventDefault();return;}elevate.setPointerCapture(e.pointerId);releases.add(zero);}) as EventListener);
  for(const type of ['pointerup','pointercancel','lostpointercapture'])listen(elevate,type,(()=>{zero();releases.delete(zero);}) as EventListener);
  const elevation=document.createElement('label');elevation.textContent='下降';elevation.append(elevate,document.createTextNode('上升'));bottom.append(elevation);
  const jump=document.createElement('button');jump.id='touch-jump';jump.textContent='跳跃';jump.onclick=()=>{if(options.available()&&options.subject())options.moveSubject(axes.x,axes.forward,axes.vertical,true);};bottom.append(jump);
  const speed=document.createElement('button');speed.id='touch-speed';speed.textContent='1×';let multiplier=1;speed.onclick=()=>{multiplier=multiplier===1?3:multiplier===3?.3:1;speed.textContent=`${multiplier}×`;};bottom.append(speed);
  viewport.append(root);
  for(const type of ['pointerdown','pointermove','pointerup','click','contextmenu'])listen(root,type,e=>e.stopPropagation());
  const down=(event:PointerEvent)=>{
    if(event.pointerType!=='touch'||!options.available())return;
    if(!points.size){moved=false;gizmo=false;const rect=canvas.getBoundingClientRect();options.transform.pointerHover({x:(event.clientX-rect.left)/rect.width*2-1,y:-(event.clientY-rect.top)/rect.height*2+1,button:0} as PointerEvent);
      if(options.editing()&&options.transform.axis){gizmo=true;return;}}
    if(gizmo)return;
    event.preventDefault();event.stopImmediatePropagation();canvas.setPointerCapture(event.pointerId);
    points.set(event.pointerId,{x:event.clientX,y:event.clientY,startX:event.clientX,startY:event.clientY});
    if(points.size>1){moved=true;stopLongPress();if(painting){painting=false;options.brushEnd();}}
    else longPress=setTimeout(()=>{if(points.size!==1||moved||options.brush())return;moved=true;canvas.dispatchEvent(new MouseEvent('contextmenu',{bubbles:true,cancelable:true,clientX:event.clientX,clientY:event.clientY}));},550);
  };
  const move=(event:PointerEvent)=>{
    if(event.pointerType!=='touch'||gizmo)return;const point=points.get(event.pointerId);if(!point)return;
    event.preventDefault();event.stopImmediatePropagation();if(!options.available()){reset();return;}
    const dx=event.clientX-point.x,dy=event.clientY-point.y;
    if(points.size>=2){const pair=[...points.entries()].slice(0,2),first=pair[0][1],second=pair[1][1];const before=Math.hypot(first.x-second.x,first.y-second.y);point.x=event.clientX;point.y=event.clientY;const after=Math.hypot(first.x-second.x,first.y-second.y);if(pair.some(([id])=>id===event.pointerId)){pan(dx*.5,dy*.5);if(before>5&&after>5)zoom(before/after);}return;}
    if(!moved&&Math.hypot(event.clientX-point.startX,event.clientY-point.startY)<=5)return;moved=true;stopLongPress();
    if(options.editing()&&options.brush()){if(!painting){painting=true;options.brushStart(event);}options.brushMove(event);}else look(dx*.004,dy*.004);
    point.x=event.clientX;point.y=event.clientY;
  };
  const up=(event:PointerEvent)=>{
    if(event.pointerType!=='touch')return;if(gizmo){gizmo=false;return;}if(!points.has(event.pointerId))return;
    event.preventDefault();event.stopImmediatePropagation();stopLongPress();points.delete(event.pointerId);
    if(canvas.hasPointerCapture(event.pointerId))canvas.releasePointerCapture(event.pointerId);
    if(!points.size){if(painting){painting=false;options.brushEnd();}else if(!moved&&options.available()&&event.type==='pointerup')options.tap(event);}
  };
  listen(canvas,'pointerdown',down as EventListener,true);listen(canvas,'pointermove',move as EventListener,true);listen(canvas,'pointerup',up as EventListener,true);
  listen(canvas,'pointercancel',(()=>reset()) as EventListener,true);
  listen(canvas,'lostpointercapture',((event:PointerEvent)=>{if(points.has(event.pointerId))reset();}) as EventListener);
  listen(window,'blur',reset);listen(window,'sky-suspend',reset);listen(document,'visibilitychange',()=>{if(document.hidden)reset();});
  return { reset, zoom, update(now:number) {
    if(!options.available()){reset();return;}const dt=previous?Math.min(.05,Math.max(0,(now-previous)/1000)):0;previous=now;
    jump.hidden=!options.subject();
    if(options.subject())options.moveSubject(axes.x,axes.forward,axes.vertical,false);
    else if(axes.x||axes.forward||axes.vertical){const camera=options.camera();camera.updateMatrixWorld();const forward=camera.getWorldDirection(new THREE.Vector3());forward.y=0;if(forward.lengthSq()<1e-8)forward.set(0,0,-1);forward.normalize();
      const delta=forward.multiplyScalar(axes.forward).addScaledVector(new THREE.Vector3().setFromMatrixColumn(camera.matrixWorld,0),axes.x);delta.y=axes.vertical;
      if(delta.lengthSq()>1)delta.normalize();delta.multiplyScalar(THREE.MathUtils.clamp(camera.position.distanceTo(options.orbit.target)*.3,10,500)*multiplier*dt);camera.position.add(delta);options.orbit.target.add(delta);commit();}
    if(axes.yaw||axes.pitch)look(axes.yaw*1.8*dt,axes.pitch*1.8*dt);
  }, dispose(){reset();cleanup.forEach(fn=>fn());root.remove();} };
}
