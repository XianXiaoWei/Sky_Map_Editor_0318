import * as THREE from 'three';
import type { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import { createFlyCamera } from './fly-camera';

// Mouse/touch navigation for remote desktops. Moves only the editor camera.
export function createCameraController(viewport: HTMLElement, camera: THREE.PerspectiveCamera, orbit: OrbitControls,
  available:()=>boolean, focus:()=>void, frame:()=>void) {
  const flight=createFlyCamera(orbit.domElement!,camera,orbit,available);
  const panel=document.createElement('section'); panel.id='camera-controller';panel.setAttribute('aria-label','相机控制器');
  const heading=document.createElement('button');heading.className='camera-heading';heading.textContent='相机控制 ▾';
  heading.setAttribute('aria-expanded','true');heading.title='展开或收起相机控制器';
  const body=document.createElement('div');body.className='camera-controls-body';panel.append(heading,body);
  heading.onclick=()=>{body.hidden=!body.hidden;heading.textContent=body.hidden?'相机控制 ▸':'相机控制 ▾';heading.setAttribute('aria-expanded',String(!body.hidden));};
  let animation=0, release:undefined|(()=>void);
  const commit=()=>{orbit.update();camera.updateMatrixWorld();};
  const pan=(x:number,y:number)=>{
    camera.updateMatrixWorld();
    const scale=2*camera.position.distanceTo(orbit.target)*Math.tan(THREE.MathUtils.degToRad(camera.fov/2))/Math.max(1,viewport.clientHeight);
    const delta=new THREE.Vector3().setFromMatrixColumn(camera.matrixWorld,0).multiplyScalar(x*scale)
      .add(new THREE.Vector3().setFromMatrixColumn(camera.matrixWorld,1).multiplyScalar(y*scale));
    camera.position.add(delta);orbit.target.add(delta);commit();
  };
  const rotate=(x:number,y:number)=>{
    const align=new THREE.Quaternion().setFromUnitVectors(camera.up.clone().normalize(),new THREE.Vector3(0,1,0));
    const spherical=new THREE.Spherical().setFromVector3(camera.position.clone().sub(orbit.target).applyQuaternion(align));
    spherical.theta+=x;spherical.phi=THREE.MathUtils.clamp(spherical.phi+y,Math.max(1e-5,orbit.minPolarAngle),Math.min(Math.PI-1e-5,orbit.maxPolarAngle));
    camera.position.copy(new THREE.Vector3().setFromSpherical(spherical).applyQuaternion(align.invert()).add(orbit.target));commit();
  };
  const zoom=(factor:number)=>{
    const offset=camera.position.clone().sub(orbit.target),radius=offset.length();
    const distance=THREE.MathUtils.clamp(radius*factor,Math.max(orbit.minDistance,camera.near*2),orbit.maxDistance);
    if(radius>0)camera.position.copy(offset.multiplyScalar(distance/radius).add(orbit.target));commit();
  };
  const stop=()=>{cancelAnimationFrame(animation);release?.();release=undefined;flight.reset();};
  function button(label:string,text:string,action?:()=>void,hold?:(dt:number)=>void,drag?:(dx:number,dy:number)=>void) {
    const element=document.createElement('button');element.textContent=text;element.setAttribute('aria-label',label);
    element.title=label+(drag?'：按住左键拖动':'：点按或按住');
    element.addEventListener('pointerdown',event=>{
      if(event.button!==0 || !available())return;
      event.preventDefault();stop();element.setPointerCapture(event.pointerId);
      const damping=orbit.enableDamping,enabled=orbit.enabled;
      orbit.enableDamping=false;orbit.update();orbit.enabled=false;
      element.classList.add('pressed');let x=event.clientX,y=event.clientY;
      const move=(next:PointerEvent)=>{if(next.pointerId!==event.pointerId)return;if(!available()){stop();return;}
        drag?.(next.clientX-x,next.clientY-y);x=next.clientX;y=next.clientY;};
      const end=(next:PointerEvent)=>{if(next.pointerId===event.pointerId)stop();};
      element.addEventListener('pointermove',move);element.addEventListener('pointerup',end);
      element.addEventListener('pointercancel',end);element.addEventListener('lostpointercapture',end);
      release=()=>{
        element.removeEventListener('pointermove',move);element.removeEventListener('pointerup',end);
        element.removeEventListener('pointercancel',end);element.removeEventListener('lostpointercapture',end);
        if(element.hasPointerCapture(event.pointerId))element.releasePointerCapture(event.pointerId);
        element.classList.remove('pressed');orbit.enableDamping=damping;orbit.enabled=enabled;
      };
      action?.();const start=performance.now();let previous=start;
      const repeat=(now:number)=>{if(!available()){stop();return;}const dt=Math.min(.05,(now-previous)/1000);previous=now;
        if(now-start>250)hold?.(dt);animation=requestAnimationFrame(repeat);};
      if(hold)animation=requestAnimationFrame(repeat);
    });
    // Native button keyboard activation remains available without double-firing
    // the click synthesized after a pointer press.
    element.onclick=event=>{if(event.detail===0 && available()){stop();const damping=orbit.enableDamping;orbit.enableDamping=false;orbit.update();action?.();orbit.enableDamping=damping;}};
    return element;
  }
  function pad(label:string,kind:'pan'|'rotate') {
    const group=document.createElement('div');group.className='camera-group';
    const title=document.createElement('span');title.textContent=label;
    const grid=document.createElement('div');grid.className='camera-pad';
    const move=kind==='pan'?pan:rotate,step=kind==='pan'?18:Math.PI/36,rate=kind==='pan'?240:Math.PI/2;
    const arrow=(direction:string,glyph:string,x:number,y:number,position:string)=>{
      const b=button(`相机${label}${direction}`,glyph,()=>move(x*step,y*step),dt=>move(x*rate*dt,y*rate*dt));b.style.gridArea=position;grid.append(b);
    };
    arrow('向上','↑',0,kind==='pan'?1:-1,'up');arrow('向左','←',-1,0,'left');
    arrow('向右','→',1,0,'right');arrow('向下','↓',0,kind==='pan'?-1:1,'down');
    const drag=button(`拖动${label}`,kind==='pan'?'✥':'⟳',undefined,undefined,
      kind==='pan'?(dx,dy)=>pan(-dx,dy):(dx,dy)=>rotate(-dx*Math.PI*2/Math.max(1,viewport.clientHeight),-dy*Math.PI*2/Math.max(1,viewport.clientHeight)));
    drag.style.gridArea='center';drag.className='camera-drag';grid.append(drag);group.append(title,grid);body.append(group);
  }
  pad('平移','pan');pad('旋转','rotate');
  const zoomGroup=document.createElement('div');zoomGroup.className='camera-group';
  const zoomTitle=document.createElement('span');zoomTitle.textContent='缩放';
  const zoomRow=document.createElement('div');zoomRow.className='camera-zoom';
  zoomRow.append(button('相机缩小','−',()=>zoom(1.12),dt=>zoom(Math.exp(dt*1.6))),
    button('拖动缩放','↕',undefined,undefined,(_dx,dy)=>zoom(Math.exp(dy*.01))),
    button('相机放大','+',()=>zoom(1/1.12),dt=>zoom(Math.exp(-dt*1.6))));
  zoomGroup.append(zoomTitle,zoomRow);body.append(zoomGroup);
  const framing=document.createElement('div');framing.className='camera-framing';
  framing.append(button('相机聚焦所选','聚焦',focus),button('相机显示全景','全景',frame));body.append(framing);
  const pose=document.createElement('details'),summary=document.createElement('summary');summary.textContent='相机坐标';pose.append(summary);
  const coordinates:HTMLInputElement[]=[];
  for(const [kind,label] of [['position','位置'],['target','看向']] as const){
    const row=document.createElement('div');row.className='camera-pose';row.append(document.createTextNode(label));
    for(const axis of ['X','Y','Z']){const input=document.createElement('input');input.type='number';input.step='any';input.setAttribute('aria-label',`相机${label}${axis}`);input.dataset.cameraCoordinate=kind+axis;input.style.width='54px';coordinates.push(input);row.append(input);}pose.append(row);
  }
  const readPose=()=>[...camera.position.toArray(),...orbit.target.toArray()].forEach((value,i)=>coordinates[i].value=String(value));
  pose.addEventListener('toggle',()=>{if(pose.open)readPose();});
  const apply=document.createElement('button');apply.textContent='应用相机坐标';apply.setAttribute('aria-label','应用相机坐标');
  apply.onclick=()=>{if(!available())return;const values=coordinates.map(i=>i.value.trim()===''?NaN:Number(i.value));
    const valid=values.every(Number.isFinite)&&Math.hypot(...values.slice(0,3).map((v,i)=>v-values[i+3]))>1e-6;
    coordinates.forEach(i=>i.setCustomValidity(valid?'':'需要有限坐标，位置与看向应不同'));if(!valid){coordinates[0].reportValidity();return;}
    stop();const damping=orbit.enableDamping;orbit.enableDamping=false;orbit.update();camera.position.fromArray(values);orbit.target.fromArray(values,3);commit();orbit.enableDamping=damping;
  };pose.append(apply);body.append(pose);
  const hint=document.createElement('small');hint.textContent='WASD 移动 · Q↓ E↑\n右键拖动看向 · Shift 加速';hint.style.whiteSpace='pre-line';body.append(hint);
  for(const type of ['pointerdown','pointermove','pointerup','click','dblclick','mousedown','mouseup','wheel','contextmenu'])
    panel.addEventListener(type,event=>{event.stopPropagation();if(type==='contextmenu'||type==='wheel')event.preventDefault();});
  window.addEventListener('blur',stop);
  const hide=()=>{if(document.hidden)stop();};document.addEventListener('visibilitychange',hide);
  viewport.append(panel);
  return {update:(now:number)=>flight.update(now),reset:stop,dispose(){stop();flight.dispose();window.removeEventListener('blur',stop);document.removeEventListener('visibilitychange',hide);panel.remove();}};
}
