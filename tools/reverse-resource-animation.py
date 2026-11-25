#!/usr/bin/env python3
"""SHA-gated evidence for embedded animation reading and pose sampling."""
import hashlib
import json
import pathlib
import sys
from native import Native

root = pathlib.Path(__file__).resolve().parent.parent
native = Native(sys.argv[1])
functions = {
    'Mesh.Load': 0x1004559e0,
    'AnimationPack.Read': 0x1000e5db0,
    'AnimationPack.ReadTracks': 0x1000e4a20,
    'AnimationClip.Read': 0x1000e4c40,
    'AnimationClip.BuildBoneIndices': 0x1000e46e0,
    'AnimationSample.BuildWeights': 0x1000e42d0,
    'AnimationClip.Sample': 0x1000e5020,
    'AnimationPack.Sample': 0x1000e6900,
    'AnimationPack.SampleFrame': 0x1000e6820,
    'AnimationPack.Finalize': 0x1000e62a0,
    'Transform.constructor': 0x1007f21f0,
    'Transform.SetParent': 0x1007f22c0,
    'Transform.MarkDirty': 0x1007f2740,
    'Transform.UpdateWorldMatrices': 0x1007f2c20,
    'Transform.GetWorldMatrix': 0x1007f26e0,
    'Matrix.Multiply': 0x100076df0,
    'Matrix.Inverse': 0x100076940,
    'Mesh.SkinPositions': 0x100457f50,
    'Mesh.SkinPositionConsumer': 0x100457f70,
    'Mesh.SkinPositionsNormals': 0x100458540,
    'Mesh.SkinPositionNormalConsumer': 0x100458570,
    'Mesh.SkinFourInfluences': 0x100458bd0,
    'AnimationRequest.UpdateClock': 0x100097df0,
    'AnimationList.Read': 0x1000dd370,
    'AnimationList.ReadName': 0x1000ddc10,
    'AnimationList.FindFile': 0x1000dd230,
    'AnimationList.GetMetadataByFile': 0x1000dd350,
    'AnimationPack.ClipForRange': 0x1000e49e0,
    'AnimationPack.HasRange': 0x1000e69e0,
    'AnimationPack.LoopSigns': 0x1000e6580,
    'Animation.FindNamed': 0x100095690,
    'Animation.PlayNamed': 0x1000959d0,
    'Animation.PlayRange': 0x100095c70,
    'Animation.UpdatePrimary': 0x100098be0,
    'Animation.UpdateSecondary': 0x100099680,
    'Animation.BlendSecondaryPose': 0x10009ad60,
    'Animation.InitializeMasks': 0x100094550,
    'Animation.InitializeSkeleton': 0x100094900,
    'Animation.SortBoneIndices': 0x10009eb40,
    'Animation.SortThreeBones': 0x10009f220,
    'Animation.SortFourBones': 0x10009f380,
    'Animation.SortFiveBones': 0x10009f4a0,
    'Animation.SortBonesIncomplete': 0x10009f600,
    'Animation.constructor': 0x1000941f0,
    'Animation.LoadPack': 0x1000942e0,
    'Animation.Load': 0x100095170,
    'Animation.Update': 0x100098b90,
    'Animation.RegisterPack': 0x100094430,
    'Animation.Default': 0x100096120,
    'Animation.Current': 0x10009d520,
    'Animation.SetSpeed': 0x100097c80,
    'Animation.FlushMatricesAndEvents': 0x10009a980,
    'Animation.UpdateAdditive': 0x100099ea0,
    'Animation.PlaySequence': 0x1000967b0,
    'Animation.PlaySequenceByIndex': 0x1000968e0,
    'Animation.MakeSpace': 0x100096b60,
    'Animation.FadeSequence': 0x100096d50,
    'AnimationPack.BuildMirrorMap': 0x1000e6a40,
    'AnimationPack.MirrorRotation': 0x1000e5ac0,
    'PlayAnimation.constructor': 0x1005311f0,
    'PlayAnimation.Update': 0x1005313d0,
}
records = {}
for name, address in functions.items():
    start, end = native.bounds(address)
    assert start == address
    file = root / 'evidence' / ('resource-animation-' + name + '.asm')
    code_end = {'AnimationRequest.UpdateClock': 0x100098134,
                'Animation.SortBoneIndices': 0x10009f200,
                'Animation.SortBonesIncomplete': 0x10009f82c}.get(name)
    file.write_text(native.annotated(address, code_end))
    records[name] = {'address': hex(address), 'end': hex(end), 'bytes': end - start,
                     'codeSha256': hashlib.sha256(native.read(start, end - start)).hexdigest(),
                     'evidence': str(file.relative_to(root))}
report = {
    'executableSha256': native.digest,
    'functions': records,
    'poseLayout': {'bytes': 48, 'scale': 0, 'quaternion': 16, 'position': 32,
                   'consumer': '0x100099595..0x1000995ae'},
    'keyArrays': {'scale': 'Pack+0xa0, flags 1/8', 'rotation': 'Pack+0x98, flags 2/16',
                  'position': 'Pack+0xa8, flags 4/32'},
    'nextDependencies': {
        'Animation.SequenceRegistryLoading': 'actual registry at global 0x101dcff30',
        'Animation.ProcessRequestEffects': '0x10009b960',
        'Animation.PackGroupRegistryLoading': 'actual registry at global 0x101dd2af8',
        'Model.constructor': '0x100467330',
        'BirdV2.Load': '0x1001a1840', 'BirdV2.Update': '0x1001a2260',
        'Crab.Load': '0x10025b5d0', 'Crab.Update': '0x10025bc10',
        'DarkCreature.Load': '0x10026c670',
        'CandleBarn.OnLevelLoad': '0x1001e9320',
        'FlowerBarn.GenerateOnLevelLoad': '0x10034f1c0',
    },
    'scope': 'Resource/list reading, named/ranged/default requests, current lookup, speed writes, pack registration, normal and mirrored sampling, loop signs, primary/nonhuman secondary/additive updates, constructor and palette/effect flush/pool compaction, PlayAnimation.Update, skeleton initialization/human masks/Transform links/duplicate-name sort, nonempty sequence timing/capacity/fade, BuildMirrorMap/Finalize/mirror rotation, Load/LoadPack with original ResourceRef bodies, numeric skeleton/palette adapter and both packed skin consumers independently checked. RegisterPack executes restored skeleton and finalization from explicit owner services; LoadPack registers observed embedded and external packs. Registry arrays and resource-manager/type/virtual callbacks remain explicit owner inputs. Mirrored sampling uses generated maps and the original reverse indices and unchanged scale indices; the request adapter reads original clock records. Complete Update wrapper, live secondary mask selection and Transform lazy world-cache writes are independently compared in resource-animation-update-oracle.json; five saved fish request chains are compared through action completion in fish-group-animation-update-oracle.json. Original embedded default pose reaches editor model geometry/export; dynamic requests are not yet attached to creature/LevelMesh owners. SIMD reciprocal and scalar additive powf remain explicit arithmetic services; QEMU tests do not claim Intel/AMD approximation parity. Actual Model/LevelMesh/creature owners and Model constructor, animation pack-group and sequence registry loading, sound/emitter consumers, full event graph and creature AI remain pending. Shared verified kernels do not count as complete creature classes.'
}
(root / 'docs' / 'resource-animation-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({'functions': len(records), 'poseLayout': report['poseLayout']}))
