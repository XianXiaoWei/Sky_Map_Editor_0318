import test from 'node:test';
import assert from 'node:assert/strict';
import { EventEmitter } from 'node:events';
import { PassThrough } from 'node:stream';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { VulkanHost, type VulkanTransport } from '../src/main/vulkan';
import { VULKAN_FRAME_MAGIC } from '../src/core/vulkan-protocol';

test('late output and exit from a stopped renderer cannot corrupt the next renderer frame', async () => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-vulkan-lifecycle-'));
  const executable = path.join(directory, 'renderer'); fs.writeFileSync(executable, '');
  const transports: VulkanTransport[] = [];
  const host = new VulkanHost(executable, () => {
    const transport = new EventEmitter() as VulkanTransport;
    transport.stdin = new PassThrough(); transport.stdout = new PassThrough(); transport.stderr = new PassThrough();
    transport.exitCode = null; transport.killed = false;
    transport.kill = () => { transport.killed = true; return true; };
    transports.push(transport);
    queueMicrotask(() => (transport.stderr as PassThrough).write('{"engine":"Vulkan","backend":"test","device":"test","apiVersion":1,"deviceType":4}\n'));
    return transport;
  });
  try {
    await host.start(); const previous = transports[0]; host.stop(); await host.start();
    const current = transports[1];
    const timing='{"gpuFrameTiming":{"request":17,"width":384,"height":216,"opaqueMs":3,"depthCloudFogMs":9}}\n';
    (current.stderr as PassThrough).write(timing.slice(0,19));assert.equal(host.fullCacheInfo().gpuFrameTiming,undefined);
    (current.stderr as PassThrough).write(timing.slice(19));assert.equal(host.fullCacheInfo().gpuFrameTiming?.depthCloudFogMs,9);
    (previous.stderr as PassThrough).write('{"gpuFrameTiming":{"request":16,"opaqueMs":500}}\n');assert.equal(host.fullCacheInfo().gpuFrameTiming?.request,17);
    const request = new Promise<Buffer>(resolve => current.stdin.once('data', resolve));
    const frame = host.frame(1, 1, Array.from({ length: 16 }, (_, i) => Number(i % 5 === 0)));
    const bytes = await request;
    (previous.stdout as PassThrough).write(Buffer.alloc(24, 255));
    previous.emit('error', new Error('late renderer error'));
    previous.emit('exit', 1, null);
    const response = Buffer.alloc(24);
    [VULKAN_FRAME_MAGIC, bytes.readUInt32LE(8), 1, 1, 4].forEach((value, i) => response.writeUInt32LE(value, i * 4));
    response.set([12, 34, 56, 255], 20); (current.stdout as PassThrough).write(response);
    assert.deepEqual(Array.from((await frame).pixels), [12, 34, 56, 255]);
    assert.equal(current.killed, false);
    host.stop(); current.emit('exit', 0, null);
    assert.equal(host.fullCacheInfo().gpuFrameTiming,undefined);
  } finally { host.stop(); fs.rmSync(directory, { recursive: true, force: true }); }
});
