import load from '../../docs/environment-load.json';
import fields from '../../docs/environment-runtime.json';
import { describeEnvironment } from './environment-storage';
import { EnvironmentRuntime, type EnvRuntimeNode } from './environment-runtime';
import type { EnvFieldType, EnvValue } from './environment';
import type { ObjectNode } from './objects';

export const ENV_GLOBAL_GROUP_ORDER = load.groups.map(group => group.className);

// TGCL calls ObjectFactory in serialized order. CreateEnvNode takes the next
// preconstructed slot, and Environment.OnLevelLoad registers that same queue.
export function describeLevelEnvironment(nodes: ObjectNode[]) {
  const source = nodes.filter(node => node.className === 'EnvNode');
  const issues: string[] = [];
  if (source.length > load.queue.limit) issues.push(`原版 EnvNode 创建队列最多 ${load.queue.limit} 个节点`);
  if (new Set(source.map(node => node.id)).size !== source.length) issues.push('EnvNode ID 重复');
  const queue = source.map((node, queueIndex) => {
    const info = describeEnvironment(node, nodes);
    const complete = info.groups.every(group => group.complete) && !!info.registration && !!info.region?.complete;
    if (!complete) issues.push(`EnvNode #${node.id} 的原版运行输入不完整`);
    return { nodeId: node.id, queueIndex, nativeOffset: load.queue.environmentOffset + queueIndex * load.queue.stride,
      complete, registration: info.registration, region: info.region, groups: info.groups };
  });
  const eventObjects = nodes.filter(node => ['SetEnvDefault', 'SetEnvHull'].includes(node.className)).map(node => ({ nodeId: node.id, className: node.className }));
  return { groups: load.groups, queue, complete: issues.length === 0, issues, eventObjects,
    phase: 'Environment.OnLevelLoad 的 EnvNode 队列注册结果',
    limitation: '初始全局输出需由调用方明确提供；SetEnvDefault/SetEnvHull 自动事件与完整渲染仍待还原。' };
}

// Models the verified queue-registration phase. OnLevelLoad clears defaults;
// event objects are described separately until their dispatch is recovered.
// This API is deliberately named for the queue, not complete Level rendering.
export function createQueuedEnvironmentRuntime(nodes: ObjectNode[], outputs: Record<string, Record<string, EnvValue>>) {
  const plan = describeLevelEnvironment(nodes);
  if (!plan.complete) throw new Error(plan.issues.join('；'));
  const variables = plan.groups.map(group => {
    const spec = fields.groups.find(spec => spec.className === group.className)!;
    if (!outputs[group.className]) throw new Error(`缺少已初始化全局环境输出 ${group.className}`);
    return { name: group.className, fields: spec.fields.map(field => ({ name: field.name, type: field.tag as EnvFieldType })), output: outputs[group.className] };
  });
  const queue: EnvRuntimeNode[] = plan.queue.map(entry => {
    const registration = entry.registration!, hull = entry.region!.hull!;
    return { id: entry.nodeId, enabled: registration.state.enabled, layer: registration.layer, hull,
      timing: { fadeIn: registration.fadeIn, fadeOut: registration.fadeOut, duration: registration.duration },
      values: Object.fromEntries(entry.groups.map(group => [group.className, Object.fromEntries(group.fields.map(field => [field.name, field.value!]))])) };
  });
  return new EnvironmentRuntime(variables, queue);
}
