import path from 'node:path';
import fs from 'node:fs/promises';
import os from 'node:os';
import {execFileSync} from 'node:child_process';
const temporary=await fs.mkdtemp(path.join(os.tmpdir(),'sky-effects-'));
try{
 execFileSync(path.resolve('node_modules/electron/dist/electron'),['--no-sandbox','--disable-gpu','--user-data-dir='+path.join(temporary,'profile'),'tools/shader-texture-export.cjs',temporary],{stdio:'inherit',timeout:45000});
 execFileSync(path.resolve('node_modules/.bin/tsx'),['tools/shader-effect-inputs.ts',path.join(temporary,'textures.json')],{stdio:'inherit',timeout:120000});
}finally{await fs.rm(temporary,{recursive:true,force:true});}
