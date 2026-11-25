import test from 'node:test';import assert from 'node:assert/strict';
import fixture from './fixtures/material-dynamics-native.json';
import {gameScaledDelta,gameShaderTime,materialWindScroll,GAME_DELTA_MIN,GAME_DELTA_MAX,initialMaterialDynamics,stepMaterialDynamics} from '../src/core/material-dynamics';
test('Shader time and three wind scroll layers match 322 original machine-code cases bit for bit',()=>{
 for(const c of fixture.cases){const delta=gameScaledDelta(c.delta,c.timeScale,c.debugEnabled?c.debugScale:1),values=[gameShaderTime(c.time,delta),delta,...materialWindScroll(c.scrolls,c.wind,delta,c.scrollScale).flat()],bytes=Buffer.alloc(56);values.forEach((v,i)=>bytes.writeFloatLE(v,i*4));assert.equal(bytes.toString('hex'),c.nativeHex);}
});
test('Original time limit, 12-hour wrap, float accumulation and wind wrapping preserve known boundaries',()=>{
 assert.equal(gameScaledDelta(0,0),GAME_DELTA_MIN);assert.equal(gameScaledDelta(10,1),GAME_DELTA_MAX);
 assert.equal(gameShaderTime(43200,0),43200);assert.equal(gameShaderTime(43200,1),1);
 const state=stepMaterialDynamics(initialMaterialDynamics(),{delta:1/60,timeScale:1,wind:[0,0,0,0],scrollScale:1});assert.ok(state.scrolls[1][0]>.99);assert.ok(state.scrolls[2][2]>0);
 assert.throws(()=>gameScaledDelta(NaN,1));assert.throws(()=>materialWindScroll([],[],0,1));
});
