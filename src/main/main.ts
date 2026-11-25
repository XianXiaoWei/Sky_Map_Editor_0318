import { app, BaseWindow,BrowserWindow, dialog, ipcMain, shell } from 'electron';
import {AUTHOR_PROFILES} from '../core/author-profile';
import path from 'node:path';
import fs from 'node:fs';
import { createEditorRuntime } from './editor-runtime';
import {useWin32NativePresentation} from '../core/desktop-presentation';
let runtime: ReturnType<typeof createEditorRuntime> | undefined;
app.whenReady().then(() => {
  let allowClose = false;
  const nativeWindows=useWin32NativePresentation(process.platform,process.env,process.argv);
  const renderLog=path.join(app.getPath('userData'),'render-diagnostics.log');
  const log=(message:string)=>{try{fs.mkdirSync(path.dirname(renderLog),{recursive:true});if(fs.existsSync(renderLog)&&fs.statSync(renderLog).size>1024*1024)fs.renameSync(renderLog,renderLog+'.previous');fs.appendFileSync(renderLog,`${new Date().toISOString()} ${message}\n`);}catch{}};
  log(`version=${app.getVersion()} platform=${process.platform} presentation=${nativeWindows?'win32-native':'canvas'} full-effects=Vulkan`);
  const surfaceTest=process.platform==='linux'&&process.env.SKY_DESKTOP_SURFACE_TEST==='1';
  const frame=nativeWindows?new BaseWindow({width:1500,height:940,minWidth:1000,minHeight:680,title:'Sky 地图编辑器',show:false,autoHideMenuBar:true}):undefined;
  const win = new BrowserWindow({ width: 1500, height: 940, minWidth: nativeWindows?undefined:1000, minHeight: nativeWindows?undefined:680, backgroundColor: nativeWindows?'#00000000':'#0c121b', title: 'Sky 地图编辑器', autoHideMenuBar: true,...frame?{frame:false,transparent:true,hasShadow:false,parent:frame,show:false}:{}, webPreferences: { preload: path.join(__dirname, 'preload.cjs'), contextIsolation: true, nodeIntegration: false, sandbox: true,additionalArguments:surfaceTest?['--sky-desktop-surface-test']:nativeWindows?['--sky-desktop-native-surface']:[] } });
  win.webContents.on('render-process-gone',(_event,details)=>log(`renderer-exit ${JSON.stringify(details)}`));
  win.webContents.on('console-message',(_event,level,message)=>{if(level>=3)log(`renderer ${message}`);});
  if(frame){
    const sync=()=>{if(!frame.isDestroyed()&&!win.isDestroyed())win.setBounds(frame.getContentBounds());};
    frame.on('resize',sync);frame.on('move',sync);frame.on('minimize',()=>win.hide());frame.on('restore',()=>{sync();win.show();});
    frame.on('closed',()=>{if(!win.isDestroyed())win.destroy();});win.on('close',event=>{event.preventDefault();frame.close();});
    sync();frame.show();win.show();
  }
  runtime = createEditorRuntime({
    userData: app.getPath('userData'), version: app.getVersion(),
    nativeExecutable: path.join(app.isPackaged ? path.join(process.resourcesPath, 'native') : path.join(__dirname, 'native'), process.platform === 'win32' ? 'sky-vulkan.exe' : surfaceTest?'sky-vulkan-surface-test':'sky-vulkan'),
    nativeEnvironment:frame?{SKY_WIN32_PARENT:'0x'+frame.getNativeWindowHandle().readBigUInt64LE().toString(16)}:surfaceTest?{SKY_XCB_SURFACE_TEST:'1'}:undefined,
    beamoTable: path.resolve(__dirname, '../docs/beamo-rsqrt-capability.bin'), classCatalog: path.join(__dirname, 'classes.json'),
    bundledShaders: path.join(app.isPackaged ? process.resourcesPath : __dirname, 'vulkan-shaders'),
    chooseData: async () => { const result = await dialog.showOpenDialog(win, { title: '选择 Sky 的 Data 目录', properties: ['openDirectory'] }); return result.canceled ? null : result.filePaths[0]; },
    close: () => { allowClose = true; (frame??win).close(); }
  });
  win.loadFile(path.join(__dirname, 'index.html'));
  win.webContents.setWindowOpenHandler(() => ({ action: 'deny' })); win.webContents.on('will-navigate', e => e.preventDefault());
  ipcMain.handle('sky:openAuthorProfile',async(event,id:unknown)=>{
    if(event.sender!==win.webContents||event.senderFrame!==win.webContents.mainFrame)throw new Error('IPC 来源无效');
    const profile=AUTHOR_PROFILES.find(profile=>profile.id===id);
    if(!profile)return {ok:false,error:'作者主页不存在'};
    try{await shell.openExternal(profile.url);return {ok:true};}catch{return {ok:false,error:'无法打开作者主页'};}
  });
  (frame??win).on('close', e => { const dirty = runtime!.dirty(); if (!allowClose && (dirty.objects || dirty.meshes)) { e.preventDefault(); win.webContents.send('request-close'); } });
  for (const [name, handler] of Object.entries(runtime.handlers)) ipcMain.handle('sky:' + name, async (event, ...args) => {
    if (event.sender !== win.webContents || event.senderFrame !== win.webContents.mainFrame) throw new Error('IPC 来源无效');
    try { const value=await handler(...args);if(name==='vulkanInfo')log(`device ${JSON.stringify(value)}`);return { ok: true, value }; } catch (error) { const message=error instanceof Error ? error.message : String(error);log(`${name} ${error instanceof Error?error.stack??message:message}`);return { ok: false, error:message }; }
  });
});
app.on('window-all-closed', () => app.quit());
app.on('before-quit', () => runtime?.stop());
