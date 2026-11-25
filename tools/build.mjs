import { build } from 'esbuild';
import { mkdir, copyFile } from 'node:fs/promises';
import { execFileSync } from 'node:child_process';
execFileSync('python3', ['tools/build-vulkan.py',...(process.argv.includes('--windows')?['--windows']:[])], { stdio: 'inherit' });
await mkdir('dist', { recursive: true });
await Promise.all([
  build({ entryPoints: ['src/main/main.ts'], outfile: 'dist/main.cjs', bundle: true, platform: 'node', format: 'cjs', external: ['electron'], sourcemap: true }),
  build({ entryPoints: ['src/main/preload.ts'], outfile: 'dist/preload.cjs', bundle: true, platform: 'node', format: 'cjs', external: ['electron'] }),
  build({ entryPoints: ['src/renderer/app.ts'], outfile: 'dist/app.js', bundle: true, platform: 'browser', format: 'esm', sourcemap: true })
]);
await Promise.all([copyFile('src/renderer/index.html', 'dist/index.html'), copyFile('src/renderer/style.css', 'dist/style.css'), copyFile('src/renderer/author-appreciation.png','dist/author-appreciation.png'), copyFile('docs/classes.json', 'dist/classes.json')]);
console.log('Built dist/');
