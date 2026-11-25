import {executeFloatAdd,type FloatAddState} from './object-numeric-runtime';
import {resumePlaySound2D,updatePlaySound2D,type PlaySound2DState,type PlaySound2DServices} from './sound-event-runtime';
import type {OriginalEventSlot} from './event-barn-runtime';
/** Explicit recovered virtual-body adapter. The caller resolves real class
 * identity, references, defaults and sound services; this is not ObjectFactory.
 * It runs inside EventBarn's callback, so Start is consumed by the same frame.
 */
export type OriginalDerivedEventDriver=
 {kind:'FloatAdd';state:FloatAddState;startEvent():void}|
 {kind:'PlaySound2D';state:PlaySound2DState;services:PlaySound2DServices};
export function runOriginalDerivedEventSlot(slot:OriginalEventSlot,driver:OriginalDerivedEventDriver):void {
 if(driver.kind==='FloatAdd'){if(slot===0x48)executeFloatAdd(driver.state,driver.startEvent);}
 else if(slot===0x48)updatePlaySound2D(driver.state,driver.services);
 else if(slot===0x38)resumePlaySound2D(driver.state,driver.services.startEvent);
}
