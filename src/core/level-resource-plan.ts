import type { ResourceManifestEntry } from './resource-manifest';
export interface LevelResourcePlan {
  level: string; objects: { declarationLine: number; source: string; compiledSource: string; sources: string[] | null; sourcesCount: number | null };
  baked: { declarationLine: number; source: string; lodToLoad: number | null };
}
/** Connects the two resource declarations for one level. Original
 * LevelObjects::ReadSource appends '.bin' to source; LevelData's source is
 * already its baked file. Source layers describe build inputs, not separate
 * runtime TGCL files to load alongside the compiled combined object file. */
export function describeLevelResourcePlan(level: string, entries: readonly ResourceManifestEntry[]): LevelResourcePlan {
  const get = (type: string) => {
    const candidates = entries.filter(entry => entry.directive === 'resource' && entry.type === type && entry.name === level);
    if (candidates.length !== 1) throw new Error(`${level}: expected one ${type} resource, found ${candidates.length}`);
    if (typeof candidates[0].parameters.source !== 'string') throw new Error(`${level}: ${type}.source is not a literal string`);
    return candidates[0];
  };
  const objects = get('LevelObjects'), baked = get('LevelData'), layers = objects.parameters.sources;
  if (objects.parameters.level !== undefined && objects.parameters.level !== level) throw new Error(`${level}: LevelObjects.level differs from its resource name`);
  if (layers !== undefined && (!Array.isArray(layers) || layers.some(value => typeof value !== 'string'))) throw new Error(`${level}: LevelObjects.sources is not a literal string array`);
  const sources = layers === undefined ? null : layers as string[];
  const sourcesCount = typeof objects.parameters.sourcesCount === 'number' ? objects.parameters.sourcesCount : null;
  if (sources && sourcesCount !== null && sources.length !== sourcesCount) throw new Error(`${level}: sourcesCount differs from sources.length`);
  return { level,
    objects: { declarationLine: objects.line, source: objects.parameters.source as string, compiledSource: objects.parameters.source + '.bin', sources, sourcesCount },
    baked: { declarationLine: baked.line, source: baked.parameters.source as string, lodToLoad: typeof baked.parameters.lodToLoad === 'number' ? baked.parameters.lodToLoad : null },
  };
}
