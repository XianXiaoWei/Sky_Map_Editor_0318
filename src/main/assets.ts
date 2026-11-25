import fs from 'node:fs';
import { readVolumeTexture, cloudNoiseTexture } from '../core/volu';
import { assetPath } from '../core/storage';
import { readResourceDeclarations, readShaderDefinitions, shaderVariables, type ResourceDeclaration, type ShaderDefinition, type ShaderProgram } from '../core/materials';
import { readResourceManifest, type ResourceManifestEntry } from '../core/resource-manifest';
import { readResourceAnimationList, type ResourceAnimationList } from '../core/resource-animation-list';

export class AssetCatalog {
  shaders = new Map<string, ShaderDefinition>(); images = new Map<string, ResourceDeclaration>();
  manifests = new Map<string, ResourceManifestEntry[]>();
  private programs = new Map<string, ShaderProgram>();
  private noise?: ReturnType<typeof cloudNoiseTexture>;
  private animations?: ResourceAnimationList;
  private imageInformation=new Map<string,{name:string;declaration:ResourceDeclaration|undefined;exists:boolean}>();
  constructor(public root: string, level?: string) {
    const read = (file: string) => { try { return fs.readFileSync(assetPath(root, file), 'utf8'); } catch (e) { if ((e as NodeJS.ErrnoException).code === 'ENOENT') return ''; throw e; } };
    for (const source of ['Resources/Boot.lua', 'Resources/Persistent.lua', ...(level ? [`Levels/${level}/Resources.lua`] : [])]) {
      const text = read(source); this.manifests.set(source, readResourceManifest(text));
      for (const definition of readShaderDefinitions(text, source)) this.shaders.set(definition.name, definition);
      for (const declaration of readResourceDeclarations(text)) if (declaration.type === 'Image') this.images.set(declaration.name, declaration);
    }
    for (const source of ['Resources/ImageDefs.lua', 'Resources/SoundDefs.lua']) {
      const text = read(source); this.manifests.set(source, readResourceManifest(text));
      if (source === 'Resources/ImageDefs.lua') for (const declaration of readResourceDeclarations(text)) if (declaration.type === 'Image' && !this.images.has(declaration.name)) this.images.set(declaration.name, declaration);
    }
  }
  /** Static declaration lookup by resource type and name. A reference never
   * replaces a definition. This does not mark the resource as loaded. */
  resourceDefinition(type: string, name: string): { origin: string; entry: ResourceManifestEntry } | null {
    let definition: { origin: string; entry: ResourceManifestEntry } | null = null;
    for (const [origin, entries] of this.manifests) for (const entry of entries) if (entry.type === type && entry.name === name && entry.directive !== 'resourceref') {
      if (!definition || entry.directive === 'resource' || definition.entry.directive !== 'resource') definition = { origin, entry };
    }
    return definition;
  }
  resourceReferences(): { origin: string; entry: ResourceManifestEntry; definition: ReturnType<AssetCatalog['resourceDefinition']> }[] {
    return [...this.manifests].flatMap(([origin, entries]) => entries.filter(entry => entry.directive === 'resourceref').map(entry => ({ origin, entry, definition: this.resourceDefinition(entry.type, entry.name) })));
  }
  animationList() {
    return this.animations ??= readResourceAnimationList(fs.readFileSync(assetPath(this.root, 'Meshes/Bin/AnimationList.dat')));
  }
  /** Resolve exported Mesh variants from the saved resource declaration.
   * Exact binary identifiers keep priority; preprocessing suffixes refer to
   * the same source, rather than substituting an unrelated model. */
  meshFile(name:string){
    if(!/^[\w .+()-]+$/.test(name))throw new Error('资源名称无效');
    const exact=`Meshes/Bin/${name}.mesh`;
    try{const file=assetPath(this.root,exact);if(fs.existsSync(file))return file;}catch(error){if((error as NodeJS.ErrnoException).code!=='ENOENT')throw error;}
    const fields=this.resourceDefinition('Mesh',name)?.entry.parameters;
    if(fields){
      const suffix=(fields.stripAnimation===true?'_StripAnim':'')+(fields.computeOcclusions===true?'_CompOcc':'')+(fields.computeEdges===true?'_CompEdges':'');
      if(suffix){const file=assetPath(this.root,`Meshes/Bin/${name}${suffix}.mesh`);if(fs.existsSync(file))return file;}
    }
    return assetPath(this.root,exact);
  }
  program(name: string) {
    if (!this.programs.has(name)) {
      const definition = this.shaders.get(name); if (!definition) throw new Error(`资源配置没有声明 shader：${name}`);
      if (definition.backend === 'metal') throw new Error(`${name} 使用原 Metal 程序 ${definition.nativeSource}；需要恢复算法并重构为 Vulkan 着色器`);
      const vertexSource = fs.readFileSync(assetPath(this.root, `Shaders/Bin/${definition.vertex}`), 'utf8');
      const fragmentSource = fs.readFileSync(assetPath(this.root, `Shaders/Bin/${definition.fragment}`), 'utf8');
      this.programs.set(name, { definition, vertexSource, fragmentSource, variables: [...shaderVariables(vertexSource, 'vertex'), ...shaderVariables(fragmentSource, 'fragment')] });
    }
    return this.programs.get(name)!;
  }
  image(name: string) {
    if (!/^[\w .+()-]+$/.test(name)) throw new Error('纹理名称无效');
    const cached=this.imageInformation.get(name);if(cached)return cached;
    let exists = false;
    try { exists = fs.existsSync(this.imageFile(name)); } catch (e) { if ((e as NodeJS.ErrnoException).code !== 'ENOENT') throw e; }
    const result={name,declaration:this.images.get(name),exists};this.imageInformation.set(name,result);return result;
  }
  /** Image resource names are identifiers. The original Image definition's
   * source selects the file (including its case); references do not rename it. */
  imageFile(name: string) {
    if (!/^[\w .+()-]+$/.test(name)) throw new Error('纹理名称无效');
    const source=this.images.get(name)?.fields.source??`${name}.png`;
    if(typeof source!=='string'||!source||source.startsWith('/')||source.startsWith('\\')||source.includes('\\')||source.split('/').includes('..'))throw new Error('纹理 source 路径无效');
    return assetPath(this.root,`Images/Bin/${source}`);
  }
  cloudNoise() {
    // Noise slot 17 at +0xe8 is CloudFluffy.vol; CloudBarn consumes this
    // slot, normalizes/transposes it and uploads CloudNoise3D as R8.
    return this.noise ??= cloudNoiseTexture(readVolumeTexture(fs.readFileSync(assetPath(this.root, 'Tex3D/CloudFluffy.vol'))));
  }
}
