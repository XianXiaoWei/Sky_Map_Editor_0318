export type ViewportQuality='auto'|'basic'|'fast'|'full';
export type ViewportResolutionMode='smooth'|'balanced'|'native';
/** Frame cost changes raster resolution only. Simulation clock and object
 * updates stay independent. Hysteresis avoids target reallocations each frame. */
export class ViewportPerformancePolicy {
  quality:ViewportQuality='auto';
  resolutionMode:ViewportResolutionMode='smooth';
  private viewportDimension?:number;
  private software=false;
  private dimension=960;
  private cost=0;
  private samples=0;
  private lastChange=-Infinity;
  private basic=false;
  private budget=30;
  private nativeSurface=false;
  private desktopNative=false;
  private gt1030=false;
  private explicitBudget?:number;
  setNativeSurface(enabled:boolean,desktop=false){this.nativeSurface=enabled;this.desktopNative=enabled&&desktop;this.updateBudget();this.reset();}
  setFrameBudget(milliseconds:number){if(!Number.isFinite(milliseconds)||milliseconds<1||milliseconds>100)throw new Error('帧预算无效');this.explicitBudget=milliseconds;this.updateBudget();this.reset();}
  setDevice(type?:number,name=''){this.software=type===4;this.gt1030=!this.software&&/\bGT\s*1030\b/i.test(name);this.updateBudget();this.reset();}
  setQuality(quality:ViewportQuality){if(!['auto','basic','fast','full'].includes(quality))throw new Error('无效画质');this.quality=quality;this.updateBudget();this.reset();}
  setResolutionMode(mode:ViewportResolutionMode){if(!['smooth','balanced','native'].includes(mode))throw new Error('无效清晰度');this.resolutionMode=mode;this.updateBudget();this.reset();}
  /** Actual display pixels, including DPI. Keep this separate from effect quality. */
  setViewportDimension(dimension:number){
    if(!Number.isFinite(dimension)||dimension<=0)return;
    const bounded=Math.min(4096,Math.max(1,Math.round(dimension)));
    if(this.viewportDimension===bounded)return;
    this.viewportDimension=bounded;this.reset();
  }
  private updateBudget(){this.budget=this.explicitBudget??(this.gt1030||this.quality==='full'&&!this.nativeSurface?1000/60:this.nativeSurface?1000/(this.desktopNative?240:60):30);}
  private reset(){this.dimension=this.gt1030&&this.quality==='full'?960:this.nativeSurface?(this.quality==='full'?(this.software?640:this.desktopNative?1920:2560):this.quality==='auto'?(this.desktopNative?1920:1440):2560):this.quality==='full'?(this.software?480:1280):(this.software?480:960);if(this.viewportDimension!==undefined&&this.resolutionMode!=='smooth')this.dimension=this.viewportDimension;this.basic=this.quality==='basic'||this.quality==='auto'&&this.software&&!this.nativeSurface;this.cost=0;this.samples=0;this.lastChange=-Infinity;}
  get maximumDimension(){return this.dimension;}
  get path():'basic'|'fast'|'full'{return this.quality==='full'?'full':this.basic?'basic':'fast';}
  get animationInterval(){return this.nativeSurface?0:this.software?1000/30:0;}
  get targetFrameBudget(){return this.budget;}
  observe(milliseconds:number,now:number,upload=false){
    if(this.resolutionMode==='native')return false;
    if(upload||!Number.isFinite(milliseconds)||milliseconds<=0)return false;
    this.cost=this.samples?this.cost*.75+milliseconds*.25:milliseconds;this.samples++;
    const cooldown=(this.quality==='full'||this.nativeSurface&&this.quality==='auto')&&this.cost>this.budget*1.5?500:2000;
    if(now-this.lastChange<cooldown||this.samples<3)return false;
    const previous=this.dimension;
    if(this.resolutionMode==='smooth'&&this.quality==='auto'&&!this.basic&&!this.nativeSurface&&this.cost>(this.budget<30?this.budget*3:150)){this.basic=true;this.lastChange=now;this.samples=0;this.cost=0;return true;}
    // Full effects remain selected at every resolution. Software Vulkan uses
    // its existing full-preview ceiling even when it owns a native surface.
    const highRate=this.explicitBudget!==undefined&&this.explicitBudget<=1000/120;
    const minimum=this.resolutionMode==='balanced'&&this.viewportDimension!==undefined?Math.max(Math.ceil(this.viewportDimension*.67),Math.min(this.viewportDimension,this.software?128:384)):this.quality==='full'?(this.software?128:this.gt1030||!this.nativeSurface||highRate?384:1280):this.nativeSurface?(highRate||this.quality==='auto'&&!this.desktopNative?640:1280):128;
    const maximum=this.resolutionMode==='balanced'&&this.viewportDimension!==undefined?this.viewportDimension:this.quality==='full'?(this.software?640:this.gt1030?1600:this.nativeSurface?2560:1920):this.nativeSurface?2560:this.software?480:960;
    if(this.cost>this.budget*1.5&&this.dimension>minimum)this.dimension=Math.max(minimum,Math.floor(this.dimension*Math.max(this.nativeSurface&&this.quality!=='auto'&&this.quality!=='full' ? .85 : .5,Math.min(.9,Math.sqrt(this.budget/this.cost)))/16)*16);
    else if(this.cost<this.budget*.6&&this.samples>=30&&this.dimension<maximum)this.dimension=Math.min(maximum,this.dimension+(this.nativeSurface?128:64));
    if(previous!==this.dimension){this.lastChange=now;this.samples=0;this.cost=0;return true;}return false;
  }
}
