/** Use the ordinary opaque editor window until Win32 transparent composition
 * has been verified on the user's device. Both modes use the same Vulkan graph. */
export function useWin32NativePresentation(platform:string,environment:Record<string,string|undefined>,args:string[]=[]){
 return platform==='win32'&&environment.SKY_WINDOWS_CANVAS!=='1'&&!args.includes('--sky-canvas')&&(environment.SKY_WINDOWS_NATIVE==='1'||args.includes('--sky-native-surface'));
}
