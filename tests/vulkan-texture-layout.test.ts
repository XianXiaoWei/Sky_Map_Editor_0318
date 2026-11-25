import test from 'node:test';
import assert from 'node:assert/strict';
import { vulkanTextureDataBytes } from '../src/core/vulkan-protocol';

test('Vulkan texture mip layouts preserve cube faces, NPOT dimensions and volume depth', () => {
  assert.equal(vulkanTextureDataBytes([4,4,6], 3, 4, 3), 6 * (16 + 4 + 1) * 16);
  assert.equal(vulkanTextureDataBytes([5,3,1], 1, 2, 3), (15 + 2 + 1) * 4);
  assert.equal(vulkanTextureDataBytes([4,4,4], 2, 1, 3), 64 + 8 + 1);
  assert.equal(vulkanTextureDataBytes([32,16,1], 1, 11), 32 * 16 * 4);
  assert.throws(() => vulkanTextureDataBytes([4,2,6], 3, 4, 3), /无效/);
  assert.throws(() => vulkanTextureDataBytes([4,4,5], 3, 4, 3), /无效/);
  assert.throws(() => vulkanTextureDataBytes([4,4,6], 3, 4, 4), /无效/);
  assert.throws(() => vulkanTextureDataBytes([4,4,2], 1, 4), /无效/);
});
