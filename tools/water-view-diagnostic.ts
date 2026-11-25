import fs from 'node:fs';
import path from 'node:path';
import * as THREE from 'three';
import {ObjectsDocument} from '../src/core/objects';
import {MeshesDocument} from '../src/core/meshes';
import {savedWaterRenderStates} from '../src/core/water-render-state';
import {createViewportEnvironment} from '../src/main/viewport-environment';
import {AssetCatalog} from '../src/main/assets';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
for(const level of process.argv.slice(2).length?process.argv.slice(2):['Dusk','SkyHub2','RainForest']){
 const nodes=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin'))).nodes,mesh=new MeshesDocument(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes'))),env=createViewportEnvironment(nodes,undefined,{level}),catalog=new AssetCatalog(data,level),water=savedWaterRenderStates(nodes);
 const box=new THREE.Box3();
 for(const g of mesh.geometries.filter(g=>g.kind==='terrain'))box.union(new THREE.Box3().setFromBufferAttribute(new THREE.BufferAttribute(mesh.geometryView(g).positions,3)));
 const p=water[0]?.model.slice(12,15)??[0,0,0];
 console.log(JSON.stringify({level,box:{min:box.min.toArray(),max:box.max.toArray()},water,env:[p,[p[0],p[1]+50,p[2]],[p[0],p[1]+150,p[2]],box.getCenter(new THREE.Vector3()).toArray()].map(eye=>({eye,values:env(eye).values,average:env(eye).average}))}));
 if(level==='Dusk')for(const name of ['OceanDark','Tonemap']){const program=catalog.program(name);fs.writeFileSync(`/root/sky-research/${name}.vert`,program.vertexSource);fs.writeFileSync(`/root/sky-research/${name}.frag`,program.fragmentSource);}
 env.dispose();
}
