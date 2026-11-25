/** Scene registration 0x10005a5e0..0x10005a730; probe flush uses the
 * recovered probeUniforms layout. The viewport's atmosphere probe remains
 * an editor adapter until original scene ray/intersection inputs are wired. */
export const MODEL_PROBE_GLOBALS:Readonly<Record<string,string>>=Object.freeze({
 u_probeCenter:'vec3',u_averageProbeColor:'vec3',
 u_probeShR0:'vec4',u_probeShR1:'vec4',u_probeShG0:'vec4',u_probeShG1:'vec4',
 u_probeShB0:'vec4',u_probeShB1:'vec4',u_probeShRGB2:'vec3',
});
