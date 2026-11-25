/** Original BeamoBarn numeric selection 0x100196ae4..bdd. Each crossed
 * boundary tests the corresponding saved lodEnables lane. No fade is used. */
export function selectOriginalBeamoDistanceLod(count:number,distances:readonly number[],enables:readonly number[],distance:number,enabled=true){
 if(!Number.isInteger(count)||count<0||count>4)throw new Error('原 Beamo LOD 数无效');
 let index=0;if(enabled)for(let i=0;i<count-1;i++)if(Math.fround(distance)>Math.fround(distances[i])&&Math.fround(enables[i])!==0)index=i+1;
 return index;
}
