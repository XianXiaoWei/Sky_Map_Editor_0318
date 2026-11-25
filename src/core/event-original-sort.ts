/** Pointer-specialized libc++ sort used by Sky's EventBarn (0x100330980,
 * 0x1003315d0). Equal keys must preserve the original algorithm's permutation.
 * Algorithm reference: llvm-mirror/libcxx release_50/include/algorithm,
 * __sort3/4/5, __insertion_sort_3/incomplete and __sort; native parity is
 * checked separately, including pointer identities and assertion behavior.
 * libc++ copyright/license: event-original-sort-LICENSE.txt.
 */
export function sortOriginalEventPointers<T>(a:T[],less:(a:T,b:T)=>boolean):void {
 const swap=(x:number,y:number)=>{const t=a[x];a[x]=a[y];a[y]=t;};
 const lt=(x:number,y:number)=>less(a[x],a[y]);
 function sort3(x:number,y:number,z:number):number {
  if(!lt(y,x)){if(!lt(z,y))return 0;swap(y,z);if(lt(y,x)){swap(x,y);return 2;}return 1;}
  if(lt(z,y)){swap(x,z);return 1;}swap(x,y);if(lt(z,y)){swap(y,z);return 2;}return 1;
 }
 function small(indices:number[]):number {
  let n=sort3(indices[0],indices[1],indices[2]);
  for(let j=3;j<indices.length;j++)for(let k=j;k>0&&lt(indices[k],indices[k-1]);k--){swap(indices[k],indices[k-1]);n++;}
  return n;
 }
 function insertion(first:number,last:number,incomplete:boolean):boolean {
  const len=last-first;if(len<=1)return true;
  if(len===2){if(lt(last-1,first))swap(first,last-1);return true;}
  if(len<=5){small(Array.from({length:len},(_,i)=>first+i));return true;}
  sort3(first,first+1,first+2);let count=0;
  for(let i=first+3;i<last;i++)if(lt(i,i-1)){
   const t=a[i];let j=i,k=i-1;
   do{a[j]=a[k];j=k;}while(j!==first&&less(t,a[--k]));a[j]=t;
   if(incomplete&&++count===8)return i+1===last;
  }
  return true;
 }
 function sort(first:number,last:number):void {
  restart:while(true){
   const len=last-first;if(len<=30){insertion(first,last,false);return;}
   let m=first+Math.floor(len/2);const lm1=last-1;
   const delta=Math.floor(Math.floor(len/2)/2);
   let swaps=len>=1000?small([first,first+delta,m,m+delta,lm1]):sort3(first,m,lm1);
   let i=first,j=lm1;
   if(!lt(i,m))while(true){
    if(i===--j){
     ++i;j=last;
     if(!lt(first,--j))while(true){
      if(i===j)return;
      if(lt(first,i)){swap(i,j);swaps++;i++;break;}i++;
     }
     if(i===j)return;
     while(true){while(!lt(first,i))i++;while(lt(first,--j)){}if(i>=j)break;swap(i,j);swaps++;i++;}
     first=i;continue restart;
    }
    if(lt(j,m)){swap(i,j);swaps++;break;}
   }
   ++i;
   if(i<j)while(true){while(lt(i,m))i++;while(!lt(--j,m)){}if(i>j)break;swap(i,j);swaps++;if(m===i)m=j;i++;}
   if(i!==m&&lt(m,i)){swap(i,m);swaps++;}
   if(swaps===0){const fs=insertion(first,i,true);if(insertion(i+1,last,true)){if(fs)return;last=i;continue;}if(fs){first=++i;continue;}}
   if(i-first<last-i){sort(first,i);first=++i;}else{sort(i+1,last);last=i;}
  }
 }
 sort(0,a.length);
}
