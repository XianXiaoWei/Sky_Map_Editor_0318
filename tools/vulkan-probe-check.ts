import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { bindVulkanMaterial } from '../src/main/vulkan-material';
import { VulkanHost } from '../src/main/vulkan';
import { reduceProbe, probeUniforms } from '../src/core/probe';
import { halfFloat } from '../src/core/resources';

async function main() {
  const host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
  const report:Record<string,unknown>={passed:false,scope:'Actual reduced probe RGBA16F upload via shared Vulkan material binding; all cube faces/mips/corners and SH. Explicit sample fixtures, not game viewport parity.'};
  try {
    report.device=await host.start();
    const vertex='#version 450\nlayout(location=0) in vec3 a_position;void main(){gl_Position=vec4(a_position,1.0);}\n';
    const fragment=`#version 450
uniform samplerCube u_probeCube;
uniform vec4 u_probeShR0,u_probeShR1,u_probeShG0,u_probeShG1,u_probeShB0,u_probeShB1;
uniform vec3 u_probeShRGB2,u_averageProbeColor,u_probeCenter;
layout(location=0) out vec4 color;
layout(location=1) out vec4 shColor;
void main(){
  int pixel=int(gl_FragCoord.x),row=int(gl_FragCoord.y),face=pixel/6,level=pixel%6,n=32>>level;
  int x=(row&1)==0?0:n-1,y=(row&2)==0?0:n-1;
  float s=(2.0*float(x)+1.0)/float(n)-1.0,t=(2.0*float(y)+1.0)/float(n)-1.0;
  vec3 direction=face==0?vec3(1,-t,-s):face==1?vec3(-1,-t,s):face==2?vec3(s,1,t):face==3?vec3(s,-1,-t):face==4?vec3(s,-t,1):vec3(-s,-t,-1);
  color=textureLod(u_probeCube,direction,float(level));
  int c=pixel%11;
  vec3 sh=c<4?vec3(u_probeShR0[c],u_probeShG0[c],u_probeShB0[c]):c<8?vec3(u_probeShR1[c-4],u_probeShG1[c-4],u_probeShB1[c-4]):c==8?u_probeShRGB2:c==9?u_averageProbeColor:u_probeCenter;
  shColor=vec4(sh,1);
}
`;
    const compiled=await compileVulkanShaders([{stage:'vert',format:'vulkan450',text:vertex},{stage:'frag',format:'vulkan450',text:fragment}]);
    assert.equal(compiled.success,true,compiled.log);
    let componentsVerified=0;
    for(const hardware of [false,true]) {
      const history=Float32Array.from({length:6144*4},(_,i)=>((i>>2)%1024)/32+(i/4096|0)*16+i%4/4);
      const reduced=reduceProbe({history,sh:Float32Array.from({length:27},(_,i)=>(i-13)/32)},
        {coordinates:new Float32Array([0,0,0,0,2,.99,.99,0,0,0,0,0]),directions:new Float32Array([1,0,0,0,0,1,0,0,0,0,-1,0]),
          colors:new Float32Array([1.1,1.2,1.3,1.4,2.1,2.2,2.3,2.4,3.1,3.2,3.3,3.4])},hardware);
      const center=[100,.1,-77], uniforms=probeUniforms(reduced.sh);
      await host.setMaterialScene(await bindVulkanMaterial(compiled,{shader:'reduced-probe-upload',state:6,stride:12,
        vertices:new Uint8Array(new Float32Array([-1,-1,0,1,-1,0,1,1,0,-1,1,0]).buffer),indices:new Uint32Array([0,1,2,0,2,3]),
        attributes:{a_position:{format:'vec3',offset:0}},uniforms:{},textures:{},
        probe:{...reduced,center}}));
      const frame=await host.materialFrame(36,4);
      for(let row=0;row<4;row++)for(let column=0;column<36;column++) {
        const face=Math.floor(column/6),level=column%6,n=32>>level,x=row&1?n-1:0,y=row&2?n-1:0;
        const source=(8192-8*n*n+face*n*n+y*n+x)*4;
        const expected=Array.from(reduced.half.subarray(source,source+4),halfFloat),at=(row*36+column)*4;
        assert.deepEqual(Array.from(frame.attachments[0].subarray(at,at+4)),expected,`F16C=${hardware} face=${face} mip=${level} corner=${row}`);
        const c=column%11,sh=c<9?Array.from(reduced.sh.subarray(c*3,c*3+3)):c===9?uniforms.u_averageProbeColor:center.map(Math.fround);
        assert.deepEqual(Array.from(frame.attachments[1].subarray(at,at+4)),[...sh,1]);
        componentsVerified+=8;
      }
    }
    report.componentsVerified=componentsVerified;report.cubeFaces=6;report.mipLevels=6;report.cornersPerMip=4;report.halfPaths=2;report.passed=true;
  }catch(error){report.error=String(error);throw error;}
  finally{host.stop();await fs.writeFile('docs/vulkan-probe-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
