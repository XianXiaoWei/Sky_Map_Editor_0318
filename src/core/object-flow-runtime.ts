import type {FloatClump} from './object-numeric-runtime';
const count=(c:FloatClump)=>{const n=c.count();if(!Number.isInteger(n)||n<0||n>65535)throw new Error('Original IfEnabled uint16 iteration requires count <= 65535');return n;};
/** The original OR condition queries every object, including after a match.
 * Empty input does not match. checkOnce still starts; a match plus checkOnce
 * calls Start twice. Original Get/SetEnabled metadata services are explicit.
 */
export function executeIfEnabled(services:{objects():FloatClump;events():FloatClump;getEnabled(object:unknown):boolean;setEnabled(object:unknown,enabled:boolean):void;startEvent():void;triggerOnDisabled():boolean;checkOnce():boolean;}):void {
 let objects=services.objects(),matched=false;
 for(let i=0;i<count(objects);i++){
  const enabled=services.getEnabled(objects.member(i));
  if(!matched)matched=enabled!==services.triggerOnDisabled();
  objects=services.objects();
 }
 if(matched){
  let events=services.events();
  for(let i=0;i<count(events);i++){services.setEnabled(events.member(i),true);events=services.events();}
  services.startEvent();
 }
 if(services.checkOnce())services.startEvent();
}
