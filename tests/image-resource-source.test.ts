import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import {AssetCatalog} from '../src/main/assets';
import {decodePng} from '../src/core/png';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
test('Original Image aliases resolve existing texels and declared case rather than resource-name filenames',()=>{
 const catalog=new AssetCatalog(data,'CandleSpaceEnd');
 for(const [name,source] of Object.entries({HeatTex:'Heat.png',BasicGeoAtlas1:'LandColTex.png',LifeForceMural02Sh:'LifeForceMuralSh_02.png',BirdStripTex:'birdStripTex.png'})){
  assert.equal(fs.existsSync(path.join(data,'Images/Bin',name+'.png')),false,name);
  assert.equal(catalog.image(name).exists,true,name);
  assert.equal(path.basename(catalog.imageFile(name)),source);
  const image=decodePng(fs.readFileSync(catalog.imageFile(name)));assert.ok(image.width>0&&image.height>0);
 }
 assert.equal(catalog.image('White').exists,true);
 assert.equal(catalog.image('MissingTextureForTest').exists,false);
});
test('Image source resolution retains root confinement and does not fall back when a declared source is missing',()=>{
 const root=fs.mkdtempSync(path.join(os.tmpdir(),'sky-image-source-'));
 try{
  fs.mkdirSync(path.join(root,'Resources'));fs.mkdirSync(path.join(root,'Images/Bin'),{recursive:true});
  fs.writeFileSync(path.join(root,'Images/Bin/Alias.png'),'wrong fallback');
  fs.writeFileSync(path.join(root,'Resources/ImageDefs.lua'),'resourcedef "Image" "Alias" { source="Missing.png" }\nresourcedef "Image" "Escape" { source="../../outside.png" }');
  const catalog=new AssetCatalog(root);assert.equal(catalog.image('Alias').exists,false);
  assert.throws(()=>catalog.imageFile('Escape'),/source/);
  assert.throws(()=>catalog.imageFile('../Alias'),/名称/);
 }finally{fs.rmSync(root,{recursive:true,force:true});}
});
