import type { ModelBakeMemory } from './model-baked-runtime';
import { updateOriginalDarkCreatureLookPhase, type DarkCreatureLookServices } from './dark-creature-look-runtime';
import { updateOriginalDarkCreatureSpotlightPhase, type DarkCreatureSpotlightServices } from './dark-creature-spotlight-runtime';

/** Consecutive original outer Update eye/spotlight phase
 * 0x10026e7da..0x10026f41e, after body motion and before interactions/audio.
 * Uses the same head snapshot and live creature/resource storage throughout.
 * Full outer Update and real scene ownership must be completed separately. */
export function updateOriginalDarkCreatureVisualPhase(m: ModelBakeMemory, creature: bigint, motionMatrix: Uint8Array, delta: Uint8Array, absoluteTimeBits: number, owners: { world: bigint; avatars: bigint; birds: bigint; environment: bigint }, s: DarkCreatureLookServices & DarkCreatureSpotlightServices): void {
  const head = updateOriginalDarkCreatureLookPhase(m, creature, motionMatrix, s);
  updateOriginalDarkCreatureSpotlightPhase(m, creature, head, delta, absoluteTimeBits, owners, s);
}
