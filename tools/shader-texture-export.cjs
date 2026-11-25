const {app,nativeImage}=require('electron');
const fs=require('node:fs'),path=require('node:path');
app.whenReady().then(()=>{
 const root=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data',out=process.argv.at(-1),result={};
 for(const name of ['CliffSh','Noise3Ch','GrassNorTex0','GrassNorTex1','GrassMask']){
  const image=nativeImage.createFromPath(path.join(root,'Images/Bin',name+'.png'));if(image.isEmpty())throw new Error('Cannot decode '+name);
  const {width,height}=image.getSize(),data=image.toBitmap();for(let i=0;i<data.length;i+=4){const blue=data[i];data[i]=data[i+2];data[i+2]=blue;}
  const file=path.join(out,name+'.rgba');fs.writeFileSync(file,data);result[name]={width,height,file};
 }
 fs.writeFileSync(path.join(out,'textures.json'),JSON.stringify(result));app.quit();
}).catch(e=>{console.error(e);app.exit(1);});
