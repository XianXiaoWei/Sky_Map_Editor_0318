/** Capture all validation messages over renderer restarts. Logging to a
 * shared file can overwrite messages when two independent hosts open it. */
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import {VulkanHost} from '../src/main/vulkan';

const directory=fs.mkdtempSync(path.join(os.tmpdir(),'sky-full-validation-'));
fs.writeFileSync(path.join(directory,'vk_layer_settings.txt'),'khronos_validation.enables = VK_VALIDATION_FEATURE_ENABLE_SYNCHRONIZATION_VALIDATION_EXT\nkhronos_validation.debug_action = VK_DBG_LAYER_ACTION_LOG_MSG\nkhronos_validation.report_flags = error,warn\nkhronos_validation.log_filename = stdout\n');
process.env.VK_INSTANCE_LAYERS='VK_LAYER_KHRONOS_validation';process.env.VK_LAYER_SETTINGS_PATH=directory;
const graphReport=process.env.SKY_FULL_GRAPH_REPORT??'/root/sky-research/fps-validation-graph.json';process.env.SKY_FULL_GRAPH_REPORT=graphReport;
const validationReport=process.env.SKY_VALIDATION_REPORT??'docs/gt1030-vulkan-validation.json';
const logs:string[]=[];
const proto=VulkanHost.prototype as any,original=proto.startNative;
proto.startNative=function(...args:any[]){
 const pending=original.apply(this,args),file=path.join(directory,`renderer-${logs.length}.log`);logs.push(file);fs.writeFileSync(file,'');
 this.process?.stderr.on('data',(chunk:Buffer)=>fs.appendFileSync(file,chunk));return pending;
};
process.once('beforeExit',()=>{
 const graph=JSON.parse(fs.readFileSync(graphReport,'utf8'));
 const messages=logs.flatMap(file=>fs.readFileSync(file,'utf8').split('\n').filter(line=>/Validation (?:Error|Warning)|VUID-|SYNC-HAZARD/.test(line)));
 const report={passed:graph.passed&&messages.length===0,rendererProcesses:logs.length,frames:graph.maps.reduce((n:number,m:any)=>n+m.frames.length,0),warningsAndErrors:messages,logs,scope:'Complete per-process diagnostic streams across map and renderer lifecycle; synchronization validation, compute sampling/readback and timestamp queries. Validation stdout is separated from binary replies.'};
 fs.writeFileSync(validationReport,JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));assert.equal(report.passed,true);
});
void import('./full-preview-graph-check');
