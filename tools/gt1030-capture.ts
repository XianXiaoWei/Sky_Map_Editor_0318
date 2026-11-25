import fs from 'node:fs';
import {VulkanHost} from '../src/main/vulkan';
const ids=new WeakMap<object,number>();let count=0;
const proto=VulkanHost.prototype as any,write=proto.write;
proto.write=async function(bytes:Buffer){let id=ids.get(this);if(id===undefined){id=count++;ids.set(this,id);fs.writeFileSync(`/root/sky-research/gt1030-packets-${id}.bin`,Buffer.alloc(0));}fs.appendFileSync(`/root/sky-research/gt1030-packets-${id}.bin`,bytes);return write.call(this,bytes);};
process.argv=[process.argv[0],process.argv[1],'WorldEmpty'];
process.env.SKY_FULL_GRAPH_REPORT='/root/sky-research/gt1030-capture.json';
void import('./full-preview-graph-check');
