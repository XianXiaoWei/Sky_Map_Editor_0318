import { contextBridge, ipcRenderer } from 'electron';
import { editorMethods as methods } from '../core/editor-methods';
const api: Record<string, unknown> = {};
for (const method of methods) api[method] = async (...args: unknown[]) => { const result = await ipcRenderer.invoke('sky:' + method, ...args); if (!result.ok) throw new Error(result.error); return result.value; };
api.onClose = (callback: () => void) => { ipcRenderer.on('request-close', callback); };
api.openAuthorProfile = async (id:string) => { const result=await ipcRenderer.invoke('sky:openAuthorProfile',id);if(!result.ok)throw new Error(result.error); };
contextBridge.exposeInMainWorld('sky', api);
if(process.argv.includes('--sky-desktop-native-surface')||process.argv.includes('--sky-desktop-surface-test'))contextBridge.exposeInMainWorld('SkyDesktopHost',{
  updateViewport:async(x:number,y:number,width:number,height:number,ratio:number)=>{
    const result=await ipcRenderer.invoke('sky:vulkanSurfaceBounds',{x:Math.round(x*ratio),y:Math.round(y*ratio),width:Math.round(width*ratio),height:Math.round(height*ratio),visible:width>0&&height>0});if(!result.ok)throw new Error(result.error);
  }
});
