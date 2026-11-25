import { constructOriginalOnRegion } from './on-region-runtime';
import { constructOriginalPlayAnimation } from './play-animation-runtime';
import { constructOriginalDelay } from './delay-event-runtime';
import { constructOriginalEnable } from './logic-event-runtime';
import { constructOriginalMoveObjectAlongRail, ORIGINAL_MOVE_OBJECT_ALONG_RAIL_SIZE } from './move-object-along-rail-runtime';
// This list prepares storage. Runtime readiness is checked separately;
// MoveObjectAlongRail.Update has not yet been restored.
export const restoredSceneEventClasses = ['OnRegion', 'PlayAnimation', 'Delay', 'Enable', 'MoveObjectAlongRail'] as const;
export type SceneEventClass = typeof restoredSceneEventClasses[number];
export const isSceneEventClass = (name: string): name is SceneEventClass => (restoredSceneEventClasses as readonly string[]).includes(name);
export const sceneEventStorageBytes: Record<SceneEventClass, number> = { OnRegion: 0x70, PlayAnimation: 0x88, Delay: 80, Enable: 72, MoveObjectAlongRail: ORIGINAL_MOVE_OBJECT_ALONG_RAIL_SIZE };
export function constructPreparedSceneEvent(storage: Uint8Array, kind: SceneEventClass): void {
  const metadata = { eventClassId: 1, eventVptr: 0x100c14ea0n };
  ({ OnRegion: constructOriginalOnRegion, PlayAnimation: constructOriginalPlayAnimation, Delay: constructOriginalDelay, Enable: constructOriginalEnable, MoveObjectAlongRail: constructOriginalMoveObjectAlongRail })[kind](storage, 1, metadata);
}
