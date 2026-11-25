/** Native presentation can complete faster than the display's RAF clock.
 * Schedule the next editor/render update after completion, with no concurrent
 * GPU requests. Idle/busy work still yields to RAF rather than spinning. */
export class ViewportFrameLoop {
 private active=false;private highRate=false;private raf?:number;private queued=false;
 private channel=new MessageChannel();
 constructor(private update:()=>void,private waiting:()=>boolean,private visible:()=>boolean=()=>true){this.channel.port1.onmessage=()=>{if(this.queued){this.queued=false;this.step();}};}
 start(){this.active=true;this.scheduleRaf();}
 setHighRate(enabled:boolean){this.highRate=enabled;}
 private scheduleRaf(){if(this.active&&this.raf===undefined&&!this.queued)this.raf=requestAnimationFrame(()=>{this.raf=undefined;this.step();});}
 private step(){if(!this.active)return;if(!this.visible()){this.scheduleRaf();return;}this.update();if(!this.highRate||!this.waiting())this.scheduleRaf();}
 complete(){if(!this.active||!this.highRate||this.queued)return;if(!this.visible()){this.scheduleRaf();return;}if(this.raf!==undefined){cancelAnimationFrame(this.raf);this.raf=undefined;}this.queued=true;this.channel.port2.postMessage(0);}
 stop(){this.active=false;if(this.raf!==undefined)cancelAnimationFrame(this.raf);this.raf=undefined;this.queued=false;this.channel.port1.close();this.channel.port2.close();}
}
