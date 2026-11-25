export function installMobileUI() {
  const $=(id:string)=>document.getElementById(id)!;
  document.documentElement.classList.add('android');
  const header=document.querySelector('header')!,toolbar=document.querySelector('.viewport-toolbar')!;
  const controls=document.createElement('div');controls.className='mobile-header-controls';
  const left=document.createElement('button'),right=document.createElement('button');left.id='mobile-list';left.textContent='列表';right.id='mobile-properties';right.textContent='属性';
  left.setAttribute('aria-controls','left');right.setAttribute('aria-controls','right');left.setAttribute('aria-expanded','false');right.setAttribute('aria-expanded','false');
  const backdrop=document.createElement('button');backdrop.id='drawer-backdrop';backdrop.hidden=true;backdrop.setAttribute('aria-label','收起面板');document.body.append(backdrop);
  const tools=document.createElement('section');tools.id='mobile-tools';tools.hidden=true;tools.setAttribute('aria-label','触屏工具与显示');
  const heading=document.createElement('div');heading.className='panel-heading';heading.textContent='工具与显示';tools.append(heading);document.body.append(tools);
  const closeDrawers=()=>{document.body.classList.remove('left-open','right-open','tools-open');tools.hidden=true;backdrop.hidden=true;left.setAttribute('aria-expanded','false');right.setAttribute('aria-expanded','false');window.dispatchEvent(new Event('sky-suspend'));};
  const toggle=(kind:'left'|'right'|'tools')=>{const open=document.body.classList.contains(kind+'-open');closeDrawers();if(!open){document.body.classList.add(kind+'-open');backdrop.hidden=false;if(kind==='tools')tools.hidden=false;else(kind==='left'?left:right).setAttribute('aria-expanded','true');}};
  left.onclick=()=>toggle('left');right.onclick=()=>toggle('right');backdrop.onclick=closeDrawers;
  controls.append(left,right);header.prepend(controls);
  for(const id of ['left','right']){const close=document.createElement('button');close.textContent='×';close.setAttribute('aria-label','收起'+(id==='left'?'列表':'属性'));close.onclick=closeDrawers;$(id).querySelector('.panel-heading')!.append(close);}
  const more=document.createElement('button');more.id='mobile-more';more.textContent='工具';more.onclick=()=>toggle('tools');toolbar.append(more);
  for(const id of ['wire','helper-frames','selection-outline','grid','physics-ball','physics-ball-reset','physics-ball-follow','physics-ball-fly','mesh-display','material-animation','bake-channel','viewport-quality'])tools.append($(id));
  const modes=document.createElement('select');modes.id='mobile-mode';modes.setAttribute('aria-label','编辑模式');
  for(const [id,label] of [['mode-bin','对象'],['mode-mesh','网格'],['mode-avatar','角色']]){const option=document.createElement('option');option.value=id;option.textContent=label;modes.append(option);}
  modes.onchange=()=>$(modes.value).click();toolbar.prepend(modes);
  new MutationObserver(()=>{const active=document.querySelector('header nav button.active');if(active)modes.value=active.id;modes.disabled=document.body.getAttribute('aria-busy')==='true';}).observe(document.body,{attributes:true,attributeFilter:['aria-busy','class'],subtree:true});
  const edit=document.createElement('button');edit.id='mobile-edit';edit.textContent='导航';edit.setAttribute('aria-pressed','false');edit.onclick=()=>{const editing=document.body.classList.toggle('touch-editing');edit.textContent=editing?'编辑':'导航';edit.setAttribute('aria-pressed',String(editing));window.dispatchEvent(new Event('sky-suspend'));};toolbar.append(edit);
  const multi=document.createElement('button');multi.id='mobile-multiselect';multi.textContent='多选';multi.setAttribute('aria-pressed','false');multi.onclick=()=>{const selected=document.body.classList.toggle('touch-multiselect');multi.setAttribute('aria-pressed',String(selected));};tools.append(multi);
  const add=document.createElement('div');add.className='mobile-add';
  for(const button of document.querySelectorAll<HTMLButtonElement>('#context-menu [data-add]')){const proxy=document.createElement('button');proxy.textContent=button.textContent;proxy.onclick=()=>{closeDrawers();button.click();};add.append(proxy);}tools.append(add);
  tools.append($('resources'),$('settings'));
  const exportButton=document.createElement('button');exportButton.id='mobile-export';exportButton.textContent='导出已保存的地图';exportButton.onclick=async()=>{try{const info=await (window as any).sky.prepareExport();(window as any).AndroidHost?.exportEdits(info.name);}catch(error){$('toast').textContent=String((error as Error).message);$('toast').hidden=false;}};tools.append(exportButton);
  const settings=$('settings-dialog');settings.querySelector('h2')!.textContent='内置 Data 工作目录';settings.querySelector('p')!.textContent='Data 已包含在 APK 的 assets/Data 中。修改保存在应用工作副本，可从工具面板导出已保存的地图。';
  ($('data-path') as HTMLInputElement).readOnly=true;$('browse').hidden=true;$('apply-settings').hidden=true;
  document.querySelector('.viewport-help')!.textContent='点按选择 · 拖动看向 · 双指平移 / 缩放 · 编辑模式拖动轴或绘制';
  for(const id of ['translate','rotate','scale','focus','frame','undo','redo'])$(id).removeAttribute('title');
  $('empty').querySelector('p')!.textContent='正在准备内置 Data，选择地图开始编辑。';
  window.addEventListener('sky-android-back',()=>{const dialog=document.querySelector<HTMLDialogElement>('dialog[open]');if(dialog){if(dialog.dispatchEvent(new Event('cancel',{cancelable:true})))dialog.close();return;}if(!backdrop.hidden){closeDrawers();return;}window.dispatchEvent(new Event('sky-request-close'));});
  return {closeDrawers};
}
