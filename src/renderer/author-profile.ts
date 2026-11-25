import {AUTHOR_NAME,AUTHOR_PROFILES} from '../core/author-profile';

export function installAuthorProfile(){
 const opener=document.getElementById('author') as HTMLButtonElement,dialog=document.getElementById('author-dialog') as HTMLDialogElement,content=document.getElementById('author-content')!,zoom=document.getElementById('author-appreciation')!,message=document.getElementById('author-message')!;
 const text=<K extends keyof HTMLElementTagNameMap>(tag:K,value:string,className?:string)=>{const el=document.createElement(tag);el.textContent=value;if(className)el.className=className;return el;};
 const intro=document.createElement('div');intro.className='author-intro';intro.append(text('div','✧','author-monogram'),text('h3',AUTHOR_NAME),text('p','Sky 地图编辑器作者','muted'));content.append(intro);
 const links=document.createElement('div');links.className='author-links';
 for(const profile of AUTHOR_PROFILES){
  const card=document.createElement('section');card.className='author-card';card.dataset.platform=profile.id;card.append(text('h4',profile.platform),text('p',profile.name,'muted'));
  const link=text('a','打开主页 ↗','author-link');link.href=profile.url;link.target='_blank';link.rel='noopener noreferrer';link.setAttribute('aria-label','打开'+profile.platform+'主页');
  link.addEventListener('click',event=>{
   const host=window as unknown as {sky?:{openAuthorProfile?:(id:string)=>Promise<void>}};
   if(host.sky?.openAuthorProfile){event.preventDefault();void host.sky.openAuthorProfile(profile.id).catch(()=>{message.textContent='暂时无法打开主页，可以复制链接后打开。';});}
  });
  const copy=text('button','复制链接');copy.type='button';copy.setAttribute('aria-label','复制'+profile.platform+'链接');
  copy.addEventListener('click',()=>{void copyLink(profile.url).then(()=>{message.textContent=profile.platform+'链接已复制';}).catch(()=>{message.textContent='复制失败，请选中下方链接复制。';});});
  const actions=document.createElement('div');actions.className='author-card-actions';actions.append(link,copy);card.append(actions,text('p',profile.url,'author-url'));links.append(card);
 }
 content.append(links);
 const support=document.createElement('section');support.className='author-support';
 const words=document.createElement('div');words.append(text('h4','支持作者'),text('p','喜欢这个工具的话，欢迎赞赏支持。','muted'),text('p','点击赞赏码查看大图','muted'));
 const preview=document.createElement('button');preview.type='button';preview.className='author-qr-preview';preview.setAttribute('aria-label','放大作者赞赏码');const img=document.createElement('img');img.src='author-appreciation.png';img.alt='开心小威的赞赏码';img.width=1040;img.height=1040;preview.append(img);support.append(words,preview);content.append(support);
 const back=text('button','← 返回作者介绍');back.type='button';const full=document.createElement('img');full.src=img.src;full.alt=img.alt;full.width=1040;full.height=1040;zoom.append(back,full);
 const reset=()=>{content.hidden=false;zoom.hidden=true;message.textContent='';dialog.classList.remove('author-zoom');};
 preview.onclick=()=>{content.hidden=true;zoom.hidden=false;dialog.classList.add('author-zoom');dialog.scrollTop=0;back.focus();};back.onclick=()=>{reset();preview.focus();};
 opener.onclick=()=>{reset();dialog.showModal();window.dispatchEvent(new Event('sky-suspend'));};document.getElementById('close-author')!.onclick=()=>dialog.close();dialog.addEventListener('close',reset);
}

async function copyLink(url:string){
 try{if(navigator.clipboard?.writeText){await navigator.clipboard.writeText(url);return;}}catch{}
 const buffer=document.createElement('textarea');buffer.className='author-copy-buffer';buffer.value=url;buffer.readOnly=true;const focus=document.activeElement as HTMLElement|null;
 // WebView versions without Clipboard API retain the user-click copy path.
 document.getElementById('author-dialog')!.append(buffer);buffer.select();buffer.setSelectionRange(0,url.length);
 try{if(!document.execCommand('copy'))throw new Error('Clipboard unavailable');}finally{buffer.remove();focus?.focus();}
}
