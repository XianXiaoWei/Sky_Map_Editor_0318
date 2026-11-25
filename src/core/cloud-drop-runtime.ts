/** Whole normal CloudBarn sphere registration 0x100416140. This is the
 * native 512-entry, 48-byte drop queue; later world sampling and GPU upload
 * remain separate consumers. NaN luminance rejects the input explicitly. */
export const CLOUD_DROP_BYTES=0x6020;
const f=Math.fround,mul=(a:number,b:number)=>f(f(a)*f(b)),add=(a:number,b:number)=>f(f(a)+f(b));
export function addOriginalCloudDrop(storage:Uint8Array,tint:Uint8Array,position:Uint8Array,radius:number,intensity:number,sharpness:number){
 if(storage.length<CLOUD_DROP_BYTES||tint.length!==16||position.length!==16)throw new Error('原 Cloud drop 存储不完整');
 const v=new DataView(storage.buffer,storage.byteOffset,storage.byteLength),t=new DataView(tint.buffer,tint.byteOffset,16),count=v.getUint32(0x6010,true),minimum=2**-126;
 if(count>511||minimum>=f(radius)||minimum>=f(intensity))return false;
 const luma=add(mul(t.getFloat32(8,true),.0722000002861023),add(mul(t.getFloat32(0,true),.2125999927520752),mul(t.getFloat32(4,true),.7152000069618225)));
 if(Number.isNaN(luma)||minimum>=Math.max(minimum,luma))return false;
 const at=16+count*48;v.setUint32(0x6010,count+1,true);v.setUint32(at+40,0,true);
 storage.set(position,at);v.setFloat32(at+12,f(radius),true);storage.set(tint,at+16);
 v.setFloat32(at+32,f(sharpness),true);v.setFloat32(at+36,f(intensity),true);v.setUint16(at+44,0,true);v.setUint8(at+46,0);
 return true;
}
/** Whole ObjectBarn.AddDropOcclusion 0x1004d3940. Only type 2 forwards;
 * the original signed -0.5 intensity scale must remain intact. */
export function routeOriginalCloudDrop(storage:Uint8Array,type:number,tint:Uint8Array,position:Uint8Array,radius:number,intensity:number,sharpness:number){
 return type===2&&addOriginalCloudDrop(storage,tint,position,radius,mul(intensity,-.5),sharpness);
}
