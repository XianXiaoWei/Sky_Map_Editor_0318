import test from 'node:test';
import assert from 'node:assert/strict';
import {useWin32NativePresentation} from '../src/core/desktop-presentation';
import {ViewportPerformancePolicy} from '../src/core/viewport-performance';

test('Windows opens with a visible canvas, and explicit recovery overrides native presentation',()=>{
 assert.equal(useWin32NativePresentation('win32',{}),false);
 assert.equal(useWin32NativePresentation('win32',{SKY_WINDOWS_NATIVE:'1'}),true);
 assert.equal(useWin32NativePresentation('win32',{},['--sky-native-surface']),true);
 assert.equal(useWin32NativePresentation('win32',{SKY_WINDOWS_NATIVE:'1',SKY_WINDOWS_CANVAS:'1'}),false);
 assert.equal(useWin32NativePresentation('win32',{SKY_WINDOWS_NATIVE:'1'},['--sky-canvas']),false);
 assert.equal(useWin32NativePresentation('linux',{SKY_WINDOWS_NATIVE:'1'}),false);
});
test('Canvas presentation preserves full materials while allowing lower resolution on slow hardware',()=>{
 const policy=new ViewportPerformancePolicy();policy.setDevice(2);policy.setNativeSurface(false);policy.setQuality('full');
 for(let i=0;i<100;i++)policy.observe(500,i*3000);
 assert.equal(policy.path,'full');assert.equal(policy.maximumDimension,384);
});
