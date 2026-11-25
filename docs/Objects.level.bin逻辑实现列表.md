# Objects.level.bin 逻辑实现列表

以游戏可观察逻辑、状态、依赖输出和事件顺序为标准；不要求代码、对象内存、分配器或虚表 1:1。字段装载、单个内核和编辑器预览不等于整类行为完成。

33 张地图，283 个声明类，280 个有顶层对象，共 49,824 个对象。完整行为验收：0。以下“部分实现”保留既有成果，不表示全部未开始。

用户要求涵盖水、蜡烛及其他地图物品；所有类型均在下表，保存引用只覆盖部分依赖，运行时资源和全局服务需逐类核对。

1. Windows 原材质 Vulkan 直接呈现与原 Scene/Model/Visibility/RenderList 方法，优先解决卡顿与换图；完成本批后继续 Objects.level.bin。
2. 沿模型资源/LOD/Visibility/RenderList 与环境共享依赖继续，再闭合 Emitter → MoteParams/Mote → SpawnMotes。
3. 蜡烛、收集、机关、植物和水：按实际类型职责及依赖接入。
4. 持续闭合模型、资源、物理、环境与角色的共享依赖。

行为验收检查：保存字段与缺省值、状态与更新、依赖与输出、事件顺序、停止与切图、真实场景验收。

| 类 | 职责 | 实例 | 状态 | 保存引用依赖 |
|---|---|---:|---|---|
| [AccountAddCurrency](Objects类清单/AccountAddCurrency.md) | 账户货币增加与反馈 | 1 | 待实现 | 待核对运行时依赖 |
| [AchievementShrine](Objects类清单/AchievementShrine.md) | 成就机关、奖励与相机反馈 | 1 | 待实现 | Clump ×10、CameraKeyFrame ×5、LevelMesh ×4、Marker ×2 |
| [AddFloatToStatUsingName](Objects类清单/AddFloatToStatUsingName.md) | 命名统计值增加浮点输入 | 21 | 待实现 | 待核对运行时依赖 |
| [AddPoi](Objects类清单/AddPoi.md) | 标记定义的关注点与权重 | 1 | 待实现 | Clump ×1 |
| [AgeGate](Objects类清单/AgeGate.md) | 年龄验证与完成事件 | 1 | 待实现 | Clump ×1 |
| [AncestorEngine](Objects类清单/AncestorEngine.md) | 充能机关、区域与激活计时 | 51 | 待实现 | Clump ×205、Float ×73 |
| [AncestorRace](Objects类清单/AncestorRace.md) | 先祖竞赛、队伍区域与目标 | 2 | 待实现 | Marker ×6、AncestorRaceGoal ×1 |
| [AncestorRaceGoal](Objects类清单/AncestorRaceGoal.md) | 竞赛终点、队伍得分与完成事件 | 1 | 待实现 | Clump ×13、Marker ×1 |
| [AncientSpirit](Objects类清单/AncientSpirit.md) | 先祖交互、动画、收集与剧情 | 42 | 待实现 | Marker ×158、Clump ×105、CameraKeyFrame ×99、Collectible ×42、Npc ×42、LevelMesh ×40、Timeline ×25 |
| [AttachBeacon](Objects类清单/AttachBeacon.md) | 空间信标、颜色与强度过渡 | 14 | 待实现 | Marker ×14 |
| [AttachGuideRail](Objects类清单/AttachGuideRail.md) | 附加轨道引导与运动限制 | 20 | 待实现 | Rail ×20 |
| [AvatarAirtimeEffectFloat](Objects类清单/AvatarAirtimeEffectFloat.md) | 玩家滞空效果的浮点输出 | 3 | 待实现 | Float ×3、Marker ×2 |
| [AvatarBreakHandHold](Objects类清单/AvatarBreakHandHold.md) | 玩家牵手关系解除 | 2 | 待实现 | 待核对运行时依赖 |
| [AvatarChargeEnergy](Objects类清单/AvatarChargeEnergy.md) | 按速率与时长补充玩家能量 | 22 | 待实现 | 待核对运行时依赖 |
| [AvatarForceEnableFlightMode](Objects类清单/AvatarForceEnableFlightMode.md) | 强制启用飞行模式 | 1 | 待实现 | 待核对运行时依赖 |
| [AvatarGrindToPos](Objects类清单/AvatarGrindToPos.md) | 玩家轨道式定位与停止 | 46 | 待实现 | Clump ×57、Npc ×7 |
| [AvatarHijack](Objects类清单/AvatarHijack.md) | 玩家控制接管与恢复 | 8 | 待实现 | 待核对运行时依赖 |
| [AvatarSetCandleState](Objects类清单/AvatarSetCandleState.md) | 玩家蜡烛状态 | 4 | 待实现 | 待核对运行时依赖 |
| [AvatarSetEnergy](Objects类清单/AvatarSetEnergy.md) | 玩家能量设定或增量 | 7 | 待实现 | 待核对运行时依赖 |
| [AvatarSetEnergyCapacity](Objects类清单/AvatarSetEnergyCapacity.md) | 玩家能量容量与时间过渡 | 8 | 待实现 | 待核对运行时依赖 |
| [AvatarSetInnerGlow](Objects类清单/AvatarSetInnerGlow.md) | 玩家内发光强度与过渡 | 6 | 待实现 | 待核对运行时依赖 |
| [AvatarSetPos](Objects类清单/AvatarSetPos.md) | 玩家定位、相对标记与出生入口 | 59 | 部分实现 | Marker ×59 |
| [AvatarSetStance](Objects类清单/AvatarSetStance.md) | 站立、坐下、睡眠与朝向姿态 | 11 | 待实现 | Marker ×1 |
| [AvatarSetZeroG](Objects类清单/AvatarSetZeroG.md) | 玩家零重力与能量状态 | 1 | 待实现 | 待核对运行时依赖 |
| [AwakenDarkCreatures](Objects类清单/AwakenDarkCreatures.md) | 唤醒暗生物集合 | 9 | 部分实现 | Clump ×9 |
| [Beamo](Objects类清单/Beamo.md) | 密度模型、LOD、材质与烘焙参数 | 6598 | 部分实现 | 待核对运行时依赖 |
| [BeamoDecal](Objects类清单/BeamoDecal.md) | 模型贴花、距离与材质绑定 | 552 | 部分实现 | 待核对运行时依赖 |
| [BenchChat](Objects类清单/BenchChat.md) | 长椅座位与聊天频道 | 18 | 待实现 | Clump ×18 |
| [BirdFlock](Objects类清单/BirdFlock.md) | 鸟群发射、轨道、距离与预填充 | 58 | 部分实现 | Rail ×57、Float ×2 |
| [BirdV2](Objects类清单/BirdV2.md) | 鸟类实例与 AI 参数 | 184 | 部分实现 | BirdV2AiParams ×184、BirdV2Params ×184 |
| [BirdV2AiParams](Objects类清单/BirdV2AiParams.md) | 鸟类追踪、群体、目标与到达参数 | 33 | 部分实现 | Clump ×45 |
| [BirdV2Params](Objects类清单/BirdV2Params.md) | 鸟类运动、引导与效果参数 | 46 | 部分实现 | Clump ×48、LevelMesh ×46、Marker ×35 |
| [BirdV2ParamSwap](Objects类清单/BirdV2ParamSwap.md) | 替换鸟类实例参数 | 15 | 部分实现 | BirdV2 ×15、BirdV2Params ×15 |
| [Blaze](Objects类清单/Blaze.md) | 燃烧对象、网格和灰烬参数 | 17 | 部分实现 | Clump ×15 |
| [BoomCone](Objects类清单/BoomCone.md) | 锥形冲量、时长与继承速度 | 2 | 待实现 | 待核对运行时依赖 |
| [Boundary](Objects类清单/Boundary.md) | 轨道定义的场景边界 | 34 | 待实现 | Clump ×34 |
| [Branch](Objects类清单/Branch.md) | 事件分支与触发规则 | 3 | 待实现 | Clump ×3 |
| [Buddy](Objects类清单/Buddy.md) | 伙伴实例 | 1 | 部分实现 | BuddyParams ×1 |
| [BuddyParams](Objects类清单/BuddyParams.md) | 伙伴发现、休息与动画状态参数 | 1 | 部分实现 | LevelMesh ×1 |
| [CameraGuide](Objects类清单/CameraGuide.md) | 空间摄像机引导与画面构图 | 395 | 待实现 | Clump ×351 |
| [CameraKeyFrame](Objects类清单/CameraKeyFrame.md) | 镜头关键帧、视场角与运动参数 | 987 | 部分实现 | 待核对运行时依赖 |
| [CandleGate](Objects类清单/CandleGate.md) | 蜡烛放置与门控事件 | 23 | 待实现 | Clump ×42 |
| [CandleObject](Objects类清单/CandleObject.md) | 蜡烛实例、寿命、点燃与蜡量 | 1077 | 部分实现 | 待核对运行时依赖 |
| [CarryAncestorQuestPrefab](Objects类清单/CarryAncestorQuestPrefab.md) | 先祖携带任务预制体 | 10 | 待实现 | Clump ×22 |
| [CarryCreatureQuestPrefab](Objects类清单/CarryCreatureQuestPrefab.md) | 生物携带任务预制体 | 3 | 待实现 | Clump ×4 |
| [ChangeLevelWithFade](Objects类清单/ChangeLevelWithFade.md) | 带淡入淡出的地图切换 | 28 | 待实现 | 待核对运行时依赖 |
| [Checkpoint](Objects类清单/Checkpoint.md) | 检查点记录与恢复区域 | 126 | 待实现 | Marker ×126 |
| [CheckpointRestore](Objects类清单/CheckpointRestore.md) | 恢复检查点与重载控制 | 24 | 待实现 | 待核对运行时依赖 |
| [CheckpointState](Objects类清单/CheckpointState.md) | 恢复时启用的对象集合 | 17 | 待实现 | Clump ×17 |
| [ClockBell](Objects类清单/ClockBell.md) | 钟与网格控制 | 1 | 待实现 | LevelMesh ×1 |
| [ClockTower](Objects类清单/ClockTower.md) | 钟塔与钟组控制 | 1 | 待实现 | ClockBell ×7 |
| [CloseOutfitShop](Objects类清单/CloseOutfitShop.md) | 关闭装扮商店 | 1 | 待实现 | 待核对运行时依赖 |
| [CloudBob](Objects类清单/CloudBob.md) | 云对象运动及缓冲偏移 | 2 | 部分实现 | Marker ×2 |
| [CloudCard](Objects类清单/CloudCard.md) | 云卡模型、烘焙与透明度 | 356 | 部分实现 | 待核对运行时依赖 |
| [Clump](Objects类清单/Clump.md) | 对象引用容器 | 9627 | 部分实现 | TerrainBlob ×9949、LevelMesh ×5797、Marker ×5690、Beamo ×3693、Enable ×1707、CameraKeyFrame ×1340、CandleObject ×1211、SnapToCam ×1017、Clump ×936、Emitter ×678、SetMeshShaderParam ×545、Timeline ×433、Flame ×422、SoundEmitter ×401、TerrainBlobPrefab ×382、TransformObject ×336、Delay ×333、BeamoDecal ×260、MoveObjectAlongRail ×246、PlayAnimation ×231、CameraGuide ×223、CloudCard ×199、Rail ×192、Parent ×181、FlowerPatch ×171、Checkpoint ×158、BirdV2 ×152、DialogHint ×145、PlaySound2D ×139、SpawnMotes ×138、Float ×131、PointLight ×129、MoteParams ×116、SetInputState ×115、Npc ×111、OnFloat ×110、OnRegion ×101、StarFragment ×98、PlayMusic ×94、ShowHUDTimed ×91、OnFlame ×90、DropOcclusion ×83、LevelMaterial ×79、Npc_PlayAnim ×78、AncestorEngine ×75、DoShout ×68、SetMusicVolume ×67、AncientSpirit ×64、AvatarSetPos ×52、NetFlag ×52、Mote ×50、SetFlame ×50、IfEnabled ×48、PlayAvatarAnimSeq ×48、EnvNode ×47、MeditationArea ×47、AvatarGrindToPos ×45、Collectible ×45、Blaze ×43、IfInRegion ×42、Wind ×42、LensFlair ×40、OnUnlocked ×38、BirdFlock ×37、TutorialNode ×36、OnTapPlayAnim ×35、FloatAdd ×34、AvatarChargeEnergy ×33、PlaySound3D ×32、CollectibleDisplay ×31、SetTutorialMode ×28、SwapMoteParams ×28、Npc_Teleport ×27、CheckpointRestore ×26、CandleGate ×25、EventSeries ×25、Unlock ×25、AttachGuideRail ×24、DisplayText ×24、KillBox ×24、SetAvatarRender ×24、SetMixChannelLowpassFreq ×24、SetMixChannelVolume ×24、AddFloatToStatUsingName ×23、SetRender ×22、Critter_Shout ×21、SetAvatarMinYSpeed ×20、Survey ×20、ChangeLevelWithFade ×19、Npc_SetScale ×19、BirdV2ParamSwap ×18、AvatarHijack ×17、BenchChat ×17、OutfitSelect ×17、Water ×17、DarkCreature ×16、LevelLink ×16、SetCameraKeyFrameShake ×16、StrobeObject ×16、AttachBeacon ×15、SetCameraShake ×15、SetRainParams ×15、SoulTrap ×15、AvatarSetStance ×14、Boundary ×14、MakeMagnetize ×14、OnAvatarEnergy ×14、FadeSound ×13、FloatMult ×13、AvatarSetInnerGlow ×12、AwakenDarkCreatures ×12、AvatarSetEnergyCapacity ×11、DarkstoneRainRegion ×11、FogVolumeSphere ×11、HasReachedLevel ×11、StarFragmentsConverge ×11、FireWorkShow ×10、SoulDeposit ×10、AvatarSetEnergy ×9、FireTriggerAtRandom ×9、SetForce ×9、SetSoundParameter ×9、SpinMotes ×9、Tweener ×9、DisplayTitleCard ×8、EnableCollision ×8、IsLatestCheckpoint ×8、MakeFloaty ×7、Npc_Turn ×7、OnAvatarOnGround ×7、OnCollected ×7、Replay ×7、SetGlide ×7、TerrainBlobGroup ×7、BirdV2Params ×6、CollectCollectible ×6、NotOnRegion ×6、Npc_GetAttention ×6、OnBubbleButton ×6、CloudBob ×5、Npc_HandHold ×5、ResumeEnable ×5、RotateObject ×5、SetWind ×5、StormKeyUnlock ×5、WorldQuestTable ×5、AvatarSetCandleState ×4、DeathMarch ×4、DetachFromBirdGuides ×4、DisableDpad ×4、FloatSplit ×4、NetSetMatchmakingDisabled ×4、OnDemoMode ×4、RedeemReward ×4、Replay_PlayAnim ×4、SendAnalyticsEvent ×4、SetBirdGuidesEnabled ×4、SetFlightParams ×4、SetFloat ×4、StopGrinding ×4、UIInterestMask ×4、BirdV2AiParams ×3、Branch ×3、Critter_OnRegion ×3、MatchHint ×3、Npc_OnHandHold ×3、OnShout ×3、ReleaseBirds ×3、SetDarkCreaturesNetworked ×3、SetEnvDefault ×3、Star ×3、StarFallShower ×3、AchievementShrine ×2、AddPoi ×2、AncestorRace ×2、AvatarBreakHandHold ×2、AvatarForceEnableFlightMode ×2、BoomCone ×2、CarryAncestorQuestPrefab ×2、CheckpointState ×2、DailyQuestsGiver ×2、DebugLogline ×2、DisableStep ×2、DistributeSpiritCollectibles ×2、FeatureFlag ×2、IfTweakVar ×2、LevelParameters ×2、Npc_Chat ×2、Npc_DisableGiftGiving ×2、Npc_WalkTo ×2、OnBetaMode ×2、OnConfirmMenu ×2、OnEventSeries ×2、OnForgeGift ×2、OnOutfitShopPurchase ×2、OpenConstellationTable ×2、ResumeGate ×2、SetDroppableCountFloat ×2、SetGlobalEventParameter ×2、SetShopTableTutorial ×2、ShowMOTD ×2、StarFragmentParams ×2、StreamLevelLink ×2、AccountAddCurrency ×1、AgeGate ×1、AncestorRaceGoal ×1、AvatarSetZeroG ×1、Buddy ×1、CloseOutfitShop ×1、DisableCliffJump ×1、DisableJump ×1、DisableRise ×1、DistributeRaceCollectibles ×1、ExitRace ×1、FragmentCollectActivity ×1、FriendDisplayLord ×1、InviteDisplayLord ×1、IsOutfitInRegion ×1、LockAllCollectible ×1、NetDisconnect ×1、Npc_BreakHandHold ×1、Npc_DisableRelationshipMenu ×1、Npc_GiveCandle ×1、Npc_OnNicknamed ×1、Npc_OnRecieveGift ×1、Npc_Prompt ×1、Npc_Reflect ×1、Npc_TakeOutFlame ×1、OnAccountReady ×1、OnButtonClick ×1、OnJoinPreviousGame ×1、OnLatestVersion ×1、OnLevelStart ×1、OnMoteCarry ×1、OnMusicOutro ×1、OnOfferGift ×1、OnUnlockOutfit ×1、Pickup ×1、RefreshGiftMessages ×1、Replay_HandHold ×1、ReserveCurrency ×1、ResetAllStormKeyProgress ×1、ReverbRegion ×1、ScoreRaceCollectibles ×1、SetEmitterFlowRail ×1、SpiritSoulsDisplayLord ×1、TitleGate ×1、WorldQuest ×1 |
| [CollectCollectible](Objects类清单/CollectCollectible.md) | 触发收集指定收集物 | 6 | 待实现 | Collectible ×6 |
| [Collectible](Objects类清单/Collectible.md) | 收集物类型、名称与空间 | 53 | 待实现 | 待核对运行时依赖 |
| [CollectibleDisplay](Objects类清单/CollectibleDisplay.md) | 按地图收集状态显示对象 | 9 | 待实现 | Clump ×9 |
| [Crab](Objects类清单/Crab.md) | 螃蟹实例 | 140 | 部分实现 | CrabParams ×140 |
| [CrabParams](Objects类清单/CrabParams.md) | 螃蟹追逐、逃跑与状态参数 | 7 | 部分实现 | LevelMesh ×7 |
| [Critter_OnRegion](Objects类清单/Critter_OnRegion.md) | 生物集合进入区域条件 | 4 | 部分实现 | Clump ×12 |
| [Critter_Shout](Objects类清单/Critter_Shout.md) | 生物集合喊叫音效与视觉 | 15 | 部分实现 | Clump ×15 |
| [DailyQuestsGiver](Objects类清单/DailyQuestsGiver.md) | 每日任务 NPC 与区域 | 1 | 待实现 | Marker ×1、Npc ×1 |
| [DarkCreature](Objects类清单/DarkCreature.md) | 暗生物实例 | 13 | 部分实现 | DarkCreatureParams ×13 |
| [DarkCreatureParams](Objects类清单/DarkCreatureParams.md) | 暗生物巡逻轨道与计时参数 | 13 | 部分实现 | Rail ×26 |
| [DarkstoneRainRegion](Objects类清单/DarkstoneRainRegion.md) | 区域降落物、收集物与能量消耗 | 11 | 部分实现 | Marker ×10 |
| [DeathMarch](Objects类清单/DeathMarch.md) | 剧情区域、时间轴与场景对象调度 | 2 | 待实现 | Clump ×13、Marker ×11、Timeline ×4、EnvNode ×2、Wind ×2、MoveObjectAlongRail ×1 |
| [DebugLogline](Objects类清单/DebugLogline.md) | 日志文本事件 | 2 | 待实现 | 待核对运行时依赖 |
| [Delay](Objects类清单/Delay.md) | 时间、帧或节拍延迟事件 | 284 | 部分实现 | Clump ×284 |
| [DetachFromBirdGuides](Objects类清单/DetachFromBirdGuides.md) | 解除鸟类引导 | 4 | 部分实现 | BirdV2 ×4 |
| [DialogHint](Objects类清单/DialogHint.md) | 区域提示、文本、优先级与串联 | 102 | 待实现 | Clump ×113、DialogHint ×34 |
| [DisableCliffJump](Objects类清单/DisableCliffJump.md) | 悬崖跳跃限制 | 2 | 待实现 | 待核对运行时依赖 |
| [DisableDpad](Objects类清单/DisableDpad.md) | 方向输入限制 | 2 | 待实现 | 待核对运行时依赖 |
| [DisableJump](Objects类清单/DisableJump.md) | 跳跃限制 | 1 | 待实现 | 待核对运行时依赖 |
| [DisableRise](Objects类清单/DisableRise.md) | 上升动作限制 | 1 | 待实现 | 待核对运行时依赖 |
| [DisableStep](Objects类清单/DisableStep.md) | 步行动作限制 | 2 | 待实现 | 待核对运行时依赖 |
| [DisplayText](Objects类清单/DisplayText.md) | 文字、颜色、位置与淡入淡出 | 30 | 待实现 | Float ×1 |
| [DisplayTitleCard](Objects类清单/DisplayTitleCard.md) | 标题卡主副标题与显示规则 | 10 | 待实现 | 待核对运行时依赖 |
| [DistributeRaceCollectibles](Objects类清单/DistributeRaceCollectibles.md) | 队伍竞赛收集物分配 | 1 | 待实现 | Marker ×2、Clump ×1 |
| [DistributeSpiritCollectibles](Objects类清单/DistributeSpiritCollectibles.md) | 灵魂收集物分配与完成事件 | 1 | 待实现 | Clump ×5 |
| [DoShout](Objects类清单/DoShout.md) | 在指定位置发起喊叫效果 | 59 | 待实现 | Clump ×59 |
| [DropOcclusion](Objects类清单/DropOcclusion.md) | 遮挡对象、强度和淡入淡出 | 64 | 部分实现 | Clump ×64、Float ×3 |
| [DropUnlock](Objects类清单/DropUnlock.md) | 命名掉落解锁 | 6 | 待实现 | 待核对运行时依赖 |
| [Emitter](Objects类清单/Emitter.md) | 粒子发射、附着、吸引与受力 | 351 | 实现中 | Marker ×10 |
| [Enable](Objects类清单/Enable.md) | 对象集合启用、禁用及事件终止 | 1287 | 部分实现 | Clump ×1287 |
| [EnableCollision](Objects类清单/EnableCollision.md) | 碰撞几何开关 | 4 | 待实现 | Clump ×4 |
| [EnvNode](Objects类清单/EnvNode.md) | 空间环境参数与混合 | 134 | 部分实现 | 待核对运行时依赖 |
| [EventSeries](Objects类清单/EventSeries.md) | 事件序列状态与重置计时 | 11 | 待实现 | 待核对运行时依赖 |
| [ExitRace](Objects类清单/ExitRace.md) | 退出竞赛 | 1 | 待实现 | 待核对运行时依赖 |
| [FadeSound](Objects类清单/FadeSound.md) | 声音集合音量过渡与停止 | 10 | 待实现 | Clump ×10 |
| [FeatureFlag](Objects类清单/FeatureFlag.md) | 命名功能旗标与存在性分支 | 3 | 待实现 | Clump ×4 |
| [FireTriggerAtRandom](Objects类清单/FireTriggerAtRandom.md) | 随机间隔及事件选择 | 9 | 待实现 | Clump ×9 |
| [FireWorkShow](Objects类清单/FireWorkShow.md) | 烟花源标记与演出 | 6 | 部分实现 | Marker ×6 |
| [Flame](Objects类清单/Flame.md) | 火焰实例、点燃、按钮与熄灭 | 290 | 部分实现 | 待核对运行时依赖 |
| [Float](Objects类清单/Float.md) | 浮点值对象 | 184 | 部分实现 | 待核对运行时依赖 |
| [FloatAdd](Objects类清单/FloatAdd.md) | 增量、限制范围及逐帧输出 | 31 | 部分实现 | Float ×45 |
| [FloatDistanceFade](Objects类清单/FloatDistanceFade.md) | 按位置或摄像机距离映射浮点值 | 2 | 待实现 | Float ×2、Marker ×2 |
| [FloatMult](Objects类清单/FloatMult.md) | 两项浮点输入相乘 | 14 | 部分实现 | Float ×42 |
| [FloatSplit](Objects类清单/FloatSplit.md) | 按连续区间映射输入到多个浮点输出 | 2 | 部分实现 | Clump ×2、Float ×2 |
| [FlowerPatch](Objects类清单/FlowerPatch.md) | 花草密度、尺寸、噪声与材质 | 582 | 部分实现 | 待核对运行时依赖 |
| [FogVolumeSphere](Objects类清单/FogVolumeSphere.md) | 球形体积雾与可见性参数 | 78 | 部分实现 | PointLight ×28 |
| [ForwardAcceleration](Objects类清单/ForwardAcceleration.md) | 区域方向与地面空中加速度 | 3 | 待实现 | Clump ×3 |
| [FragmentCollectActivity](Objects类清单/FragmentCollectActivity.md) | 碎片数量与收集活动 | 15 | 待实现 | Clump ×15 |
| [FriendDisplayLord](Objects类清单/FriendDisplayLord.md) | 好友位置、蜡烛与场景显示 | 1 | 待实现 | Clump ×12、Marker ×12、LevelMesh ×1 |
| [HasReachedLevel](Objects类清单/HasReachedLevel.md) | 已到达地图条件事件 | 11 | 待实现 | Clump ×11 |
| [IfEnabled](Objects类清单/IfEnabled.md) | 对象集合启用状态条件 | 36 | 部分实现 | Clump ×72 |
| [IfInRegion](Objects类清单/IfInRegion.md) | 区域内或区域外条件触发 | 30 | 待实现 | Clump ×60 |
| [IfTweakVar](Objects类清单/IfTweakVar.md) | 原调试变量条件分支 | 2 | 待实现 | Clump ×4 |
| [InviteDisplayLord](Objects类清单/InviteDisplayLord.md) | 邀请状态及场景显示控制 | 1 | 待实现 | Clump ×1、FriendDisplayLord ×1、InviteDisplayRig ×1 |
| [InviteDisplayRig](Objects类清单/InviteDisplayRig.md) | 邀请空位、待确认与已确认视图 | 1 | 待实现 | Clump ×3、Marker ×1 |
| [IsLatestCheckpoint](Objects类清单/IsLatestCheckpoint.md) | 检查最新检查点与事件 | 8 | 待实现 | Clump ×8 |
| [IsOutfitInRegion](Objects类清单/IsOutfitInRegion.md) | 区域内装扮与玩家条件 | 1 | 待实现 | Clump ×2 |
| [KillBox](Objects类清单/KillBox.md) | 空间死亡区域 | 146 | 待实现 | 待核对运行时依赖 |
| [LensFlair](Objects类清单/LensFlair.md) | 镜头光效颜色、强度与样式 | 44 | 部分实现 | 待核对运行时依赖 |
| [LevelLink](Objects类清单/LevelLink.md) | 地图连接、锚点与加载事件 | 64 | 待实现 | Marker ×71、Clump ×15、Beamo ×5、LevelMesh ×5 |
| [LevelMaterial](Objects类清单/LevelMaterial.md) | 原材质、shader、参数与物理材质绑定 | 309 | 部分实现 | 待核对运行时依赖 |
| [LevelMesh](Objects类清单/LevelMesh.md) | 场景模型、资源、烘焙及几何生成参数 | 4133 | 部分实现 | 待核对运行时依赖 |
| [LevelMeshShaderParam](Objects类清单/LevelMeshShaderParam.md) | 模型 shader 参数声明 | 0 | 仅声明待核实 | 待核对运行时依赖 |
| [LevelParameters](Objects类清单/LevelParameters.md) | 地图与烘焙生成全局参数 | 33 | 待实现 | Clump ×8 |
| [LevelShaderParam](Objects类清单/LevelShaderParam.md) | shader 参数声明 | 0 | 仅声明待核实 | 待核对运行时依赖 |
| [LockAllCollectible](Objects类清单/LockAllCollectible.md) | 锁定收集物状态 | 1 | 待实现 | 待核对运行时依赖 |
| [MakeFloaty](Objects类清单/MakeFloaty.md) | 对象浮动、旋转与错峰动画 | 10 | 待实现 | Clump ×10、Marker ×7 |
| [MakeMagnetize](Objects类清单/MakeMagnetize.md) | 标记区域吸附与反重力 | 21 | 待实现 | Clump ×21 |
| [Marker](Objects类清单/Marker.md) | 位置、旋转、缩放与启用的空间标记 | 6538 | 部分实现 | 待核对运行时依赖 |
| [MatchHint](Objects类清单/MatchHint.md) | 匹配人数、距离与拆分规则 | 20 | 待实现 | 待核对运行时依赖 |
| [MeditationArea](Objects类清单/MeditationArea.md) | 冥想区域、目标、相机与确认 | 45 | 待实现 | Clump ×42、CameraKeyFrame ×17、LevelMesh ×7、Float ×4、Marker ×3、Beamo ×2 |
| [Mote](Objects类清单/Mote.md) | 光点实例与初始状态 | 50 | 实现中 | MoteParams ×50 |
| [MoteParams](Objects类清单/MoteParams.md) | 光点运动、携带、死亡与轨道参数 | 117 | 实现中 | Marker ×149、Clump ×21 |
| [MoveObjectAlongRail](Objects类清单/MoveObjectAlongRail.md) | 对象沿轨道运动 | 232 | 部分实现 | Clump ×286、Rail ×232、Float ×10 |
| [NetDisconnect](Objects类清单/NetDisconnect.md) | 网络断开事件 | 1 | 待实现 | 待核对运行时依赖 |
| [NetFlag](Objects类清单/NetFlag.md) | 网络标志声明，实际行为待恢复 | 34 | 待实现 | 待核对运行时依赖 |
| [NetSetMatchmakingDisabled](Objects类清单/NetSetMatchmakingDisabled.md) | 网络匹配开关 | 6 | 待实现 | 待核对运行时依赖 |
| [NotOnRegion](Objects类清单/NotOnRegion.md) | 区域外事件触发 | 16 | 待实现 | Clump ×32 |
| [Npc](Objects类清单/Npc.md) | NPC 模型、动画、装扮与玩家状态 | 67 | 待实现 | 待核对运行时依赖 |
| [Npc_BreakHandHold](Objects类清单/Npc_BreakHandHold.md) | NPC 解除牵手 | 1 | 待实现 | Npc ×1 |
| [Npc_Chat](Objects类清单/Npc_Chat.md) | NPC 聊天消息 | 2 | 待实现 | Npc ×2 |
| [Npc_DisableGiftGiving](Objects类清单/Npc_DisableGiftGiving.md) | NPC 赠礼功能限制 | 1 | 待实现 | Npc ×1 |
| [Npc_DisableRelationshipMenu](Objects类清单/Npc_DisableRelationshipMenu.md) | NPC 关系菜单限制 | 1 | 待实现 | Npc ×1 |
| [Npc_GetAttention](Objects类清单/Npc_GetAttention.md) | NPC 请求关注 | 2 | 待实现 | Npc ×2 |
| [Npc_GiveCandle](Objects类清单/Npc_GiveCandle.md) | NPC 赠送蜡烛与接受事件 | 1 | 待实现 | Clump ×1、Npc ×1 |
| [Npc_HandHold](Objects类清单/Npc_HandHold.md) | NPC 发起牵手 | 6 | 待实现 | Npc ×6 |
| [Npc_Hug](Objects类清单/Npc_Hug.md) | NPC 发起拥抱 | 1 | 待实现 | Npc ×1 |
| [Npc_OnHandHold](Objects类清单/Npc_OnHandHold.md) | NPC 牵手事件 | 3 | 待实现 | Clump ×6 |
| [Npc_OnHug](Objects类清单/Npc_OnHug.md) | NPC 拥抱事件 | 1 | 待实现 | Clump ×2 |
| [Npc_OnNicknamed](Objects类清单/Npc_OnNicknamed.md) | NPC 命名事件 | 1 | 待实现 | Clump ×1、Npc ×1 |
| [Npc_OnRecieveGift](Objects类清单/Npc_OnRecieveGift.md) | NPC 收礼事件 | 1 | 待实现 | Clump ×1、Npc ×1 |
| [Npc_PlayAnim](Objects类清单/Npc_PlayAnim.md) | NPC 动画播放与速度 | 54 | 待实现 | Npc ×54 |
| [Npc_Prompt](Objects类清单/Npc_Prompt.md) | NPC 交互图标与激活事件 | 1 | 待实现 | Clump ×1、Npc ×1 |
| [Npc_Reflect](Objects类清单/Npc_Reflect.md) | NPC 状态向本地玩家的映射 | 2 | 待实现 | Clump ×2 |
| [Npc_SetScale](Objects类清单/Npc_SetScale.md) | NPC 身高、缩放与时间过渡 | 9 | 待实现 | Npc ×9 |
| [Npc_TakeOutFlame](Objects类清单/Npc_TakeOutFlame.md) | NPC 取出或收起火焰 | 1 | 待实现 | Npc ×1 |
| [Npc_Teleport](Objects类清单/Npc_Teleport.md) | NPC 定位 | 13 | 待实现 | Marker ×13、Npc ×13 |
| [Npc_Turn](Objects类清单/Npc_Turn.md) | NPC 朝向过渡与完成事件 | 7 | 待实现 | Clump ×10、Marker ×7 |
| [Npc_WalkTo](Objects类清单/Npc_WalkTo.md) | NPC 移动目标与完成事件 | 2 | 待实现 | Clump ×2、Marker ×2、Npc ×2 |
| [OnAccountReady](Objects类清单/OnAccountReady.md) | 账户就绪、超时与回调 | 1 | 待实现 | Clump ×1 |
| [OnAvatarEnergy](Objects类清单/OnAvatarEnergy.md) | 玩家能量与区域条件事件 | 10 | 待实现 | Clump ×20 |
| [OnAvatarOnGround](Objects类清单/OnAvatarOnGround.md) | 玩家落地、速度与区域条件事件 | 9 | 待实现 | Clump ×17 |
| [OnBetaMode](Objects类清单/OnBetaMode.md) | 测试版模式条件事件 | 2 | 待实现 | Clump ×2 |
| [OnBlaze](Objects类清单/OnBlaze.md) | 燃烧状态与激活事件 | 5 | 部分实现 | Blaze ×5、Clump ×5 |
| [OnBoomDestroy](Objects类清单/OnBoomDestroy.md) | 冲量破坏阈值、动画与网格反馈 | 1 | 部分实现 | Clump ×1 |
| [OnBubbleButton](Objects类清单/OnBubbleButton.md) | 世界气泡按钮距离、图标与点击事件 | 4 | 待实现 | Clump ×4、Marker ×3、Emitter ×1 |
| [OnButtonClick](Objects类清单/OnButtonClick.md) | 按钮点击事件 | 1 | 待实现 | Clump ×1 |
| [OnChangeAnd](Objects类清单/OnChangeAnd.md) | 集合状态与 AND 条件变化 | 1 | 待实现 | Clump ×2 |
| [OnCollected](Objects类清单/OnCollected.md) | 收集与使用状态条件事件 | 7 | 待实现 | Clump ×8、Collectible ×7 |
| [OnConfirmMenu](Objects类清单/OnConfirmMenu.md) | 确认菜单、图标与确认取消事件 | 1 | 待实现 | Clump ×1 |
| [OnDemoMode](Objects类清单/OnDemoMode.md) | 演示模式条件事件 | 10 | 待实现 | Clump ×10 |
| [OnEventSeries](Objects类清单/OnEventSeries.md) | 序列数量与触发规则 | 4 | 待实现 | Clump ×8 |
| [OnFlame](Objects类清单/OnFlame.md) | 火焰集合、消耗、点燃与熄灭事件 | 154 | 部分实现 | Clump ×308 |
| [OnFloat](Objects类清单/OnFloat.md) | 浮点条件组合与事件 | 94 | 部分实现 | Clump ×115、Float ×98 |
| [OnForgeGift](Objects类清单/OnForgeGift.md) | 赠礼条件后启用对象 | 2 | 待实现 | Clump ×2 |
| [OnGameReady](Objects类清单/OnGameReady.md) | 游戏就绪事件 | 1 | 待实现 | Clump ×1 |
| [OnJoinPreviousGame](Objects类清单/OnJoinPreviousGame.md) | 重返上一游戏与失败事件 | 1 | 待实现 | Clump ×1 |
| [OnLatestVersion](Objects类清单/OnLatestVersion.md) | 最新版本条件事件 | 1 | 待实现 | Clump ×1 |
| [OnLevelStart](Objects类清单/OnLevelStart.md) | 地图启动事件 | 21 | 待实现 | Clump ×21 |
| [OnLevelUp](Objects类清单/OnLevelUp.md) | 等级变化事件 | 5 | 待实现 | Clump ×5 |
| [OnMoteCarry](Objects类清单/OnMoteCarry.md) | 光点携带开始或结束事件 | 1 | 待实现 | Clump ×1、MoteParams ×1 |
| [OnMusicOutro](Objects类清单/OnMusicOutro.md) | 音乐尾段事件 | 1 | 待实现 | Clump ×1 |
| [OnOfferGift](Objects类清单/OnOfferGift.md) | 赠礼发起事件 | 1 | 待实现 | Clump ×1 |
| [OnOutfitShopPurchase](Objects类清单/OnOutfitShopPurchase.md) | 装扮购买事件 | 2 | 待实现 | Clump ×2、OutfitSelect ×1 |
| [OnRegion](Objects类清单/OnRegion.md) | 进入离开、逐帧和人数条件区域触发 | 381 | 部分实现 | Clump ×763 |
| [OnShout](Objects类清单/OnShout.md) | 指定标记区域内喊叫事件 | 6 | 待实现 | Clump ×12 |
| [OnTapCount](Objects类清单/OnTapCount.md) | 区域内点击次数事件 | 1 | 待实现 | Clump ×1 |
| [OnTapPlayAnim](Objects类清单/OnTapPlayAnim.md) | 点击动作动画、延迟与进度事件 | 26 | 待实现 | Clump ×52、Float ×2 |
| [OnUnlocked](Objects类清单/OnUnlocked.md) | 解锁、未确认与未解锁事件 | 37 | 待实现 | Clump ×59 |
| [OnUnlockOutfit](Objects类清单/OnUnlockOutfit.md) | 装扮解锁后启用对象 | 1 | 待实现 | Clump ×1 |
| [OpenConstellationTable](Objects类清单/OpenConstellationTable.md) | 星座桌菜单与关闭事件 | 2 | 待实现 | Clump ×1 |
| [OutfitSelect](Objects类清单/OutfitSelect.md) | 衣柜、区域、商店与购买事件 | 12 | 待实现 | Marker ×12、Clump ×6 |
| [Parent](Objects类清单/Parent.md) | 对象父子跟随与关节挂接 | 270 | 部分实现 | Clump ×270、LevelMesh ×127、Marker ×104、BirdV2 ×10、Flame ×5、DarkCreature ×3、Npc ×2、Buddy ×1 |
| [PauseCameraConfig](Objects类清单/PauseCameraConfig.md) | 摄像机配置保持、淡入和暂停 | 6 | 待实现 | Clump ×6 |
| [Pickup](Objects类清单/Pickup.md) | 拾取物、货币与拾取反馈 | 1 | 待实现 | CandleObject ×1、Clump ×1 |
| [PlatformingRegion](Objects类清单/PlatformingRegion.md) | 平台运动区域 | 7 | 待实现 | 待核对运行时依赖 |
| [PlayAnimation](Objects类清单/PlayAnimation.md) | 对象动画序列、速度与状态 | 187 | 部分实现 | Clump ×187 |
| [PlayAvatarAnimSeq](Objects类清单/PlayAvatarAnimSeq.md) | 本地或远端玩家动画序列 | 42 | 待实现 | 待核对运行时依赖 |
| [PlayMusic](Objects类清单/PlayMusic.md) | 音乐切换、音量与淡入淡出 | 92 | 待实现 | 待核对运行时依赖 |
| [PlaySound2D](Objects类清单/PlaySound2D.md) | 二维声音播放 | 109 | 部分实现 | 待核对运行时依赖 |
| [PlaySound3D](Objects类清单/PlaySound3D.md) | 空间声音播放 | 27 | 待实现 | Marker ×27 |
| [PointLight](Objects类清单/PointLight.md) | 点光源空间实例 | 521 | 部分实现 | 待核对运行时依赖 |
| [Rail](Objects类清单/Rail.md) | 轨道曲线、循环与更新 | 402 | 部分实现 | Marker ×3213 |
| [RainCurtainParams](Objects类清单/RainCurtainParams.md) | 雨幕标记、雨滴密度和尺寸 | 6 | 部分实现 | Clump ×6 |
| [RedeemReward](Objects类清单/RedeemReward.md) | 奖励兑换结果事件 | 4 | 待实现 | Clump ×4 |
| [RefreshGiftMessages](Objects类清单/RefreshGiftMessages.md) | 刷新赠礼消息 | 1 | 待实现 | 待核对运行时依赖 |
| [ReleaseBirds](Objects类清单/ReleaseBirds.md) | 释放鸟类集合 | 3 | 部分实现 | Clump ×3 |
| [Replay](Objects类清单/Replay.md) | 玩家回放及 NPC 显示控制 | 6 | 待实现 | 待核对运行时依赖 |
| [Replay_HandHold](Objects类清单/Replay_HandHold.md) | 回放玩家与 NPC 牵手 | 1 | 待实现 | Npc ×1 |
| [Replay_PlayAnim](Objects类清单/Replay_PlayAnim.md) | 回放玩家动画 | 4 | 待实现 | 待核对运行时依赖 |
| [ReserveCurrency](Objects类清单/ReserveCurrency.md) | 预留指定货币数量 | 1 | 待实现 | 待核对运行时依赖 |
| [ResetAllStormKeyProgress](Objects类清单/ResetAllStormKeyProgress.md) | 风暴钥匙进度重置 | 1 | 待实现 | 待核对运行时依赖 |
| [ResumeEnable](Objects类清单/ResumeEnable.md) | 恢复时启用对象 | 5 | 部分实现 | Clump ×5 |
| [ResumeGate](Objects类清单/ResumeGate.md) | 恢复流程门控 | 1 | 待实现 | 待核对运行时依赖 |
| [ReverbRegion](Objects类清单/ReverbRegion.md) | 区域混响与参数过渡 | 33 | 待实现 | Clump ×33 |
| [RiseWhenStoodOn](Objects类清单/RiseWhenStoodOn.md) | 站立交互引发网格升起 | 4 | 待实现 | Clump ×4 |
| [RotateObject](Objects类清单/RotateObject.md) | 对象旋转范围与速度控制 | 8 | 待实现 | Clump ×8、Float ×2 |
| [ScheduledEvent](Objects类清单/ScheduledEvent.md) | 命名计划事件与对象集合 | 28 | 待实现 | Clump ×13、SoulTrap ×8、AncestorEngine ×5、ClockTower ×1、Marker ×1 |
| [ScoreRaceCollectibles](Objects类清单/ScoreRaceCollectibles.md) | 竞赛收集物计分 | 1 | 待实现 | AncestorRaceGoal ×1、Clump ×1 |
| [SendAnalyticsEvent](Objects类清单/SendAnalyticsEvent.md) | 命名统计事件 | 3 | 待实现 | 待核对运行时依赖 |
| [SetAvatarMinYSpeed](Objects类清单/SetAvatarMinYSpeed.md) | 玩家最小竖直速度与起飞 | 13 | 待实现 | 待核对运行时依赖 |
| [SetAvatarRender](Objects类清单/SetAvatarRender.md) | 本地与远端玩家绘制开关 | 13 | 待实现 | 待核对运行时依赖 |
| [SetBirdGuidesEnabled](Objects类清单/SetBirdGuidesEnabled.md) | 鸟类引导开关 | 4 | 部分实现 | Clump ×4 |
| [SetBlockUpdraftWind](Objects类清单/SetBlockUpdraftWind.md) | 上升风场作用限制 | 1 | 待实现 | 待核对运行时依赖 |
| [SetCameraKeyFrameShake](Objects类清单/SetCameraKeyFrameShake.md) | 关键帧震动参数与过渡 | 10 | 部分实现 | Clump ×10 |
| [SetCameraShake](Objects类清单/SetCameraShake.md) | 摄像机震动强度与时长 | 10 | 部分实现 | 待核对运行时依赖 |
| [SetDarkCreaturesNetworked](Objects类清单/SetDarkCreaturesNetworked.md) | 暗生物网络同步配置 | 3 | 部分实现 | Clump ×3 |
| [SetDroppableCountFloat](Objects类清单/SetDroppableCountFloat.md) | 可掉落数量到浮点输出 | 2 | 待实现 | Float ×2 |
| [SetEmitterFlowRail](Objects类清单/SetEmitterFlowRail.md) | 发射器沿轨道流向设置 | 2 | 部分实现 | Clump ×2、Rail ×2 |
| [SetEnvDefault](Objects类清单/SetEnvDefault.md) | 设置默认环境参数 | 29 | 部分实现 | 待核对运行时依赖 |
| [SetEnvHull](Objects类清单/SetEnvHull.md) | 设置区域环境参数 | 4 | 部分实现 | Clump ×4 |
| [SetFlame](Objects类清单/SetFlame.md) | 火焰集合点燃状态与计时 | 43 | 部分实现 | Clump ×43 |
| [SetFlightParams](Objects类清单/SetFlightParams.md) | 飞行巡航角与升力配置 | 4 | 待实现 | 待核对运行时依赖 |
| [SetFloat](Objects类清单/SetFloat.md) | 浮点目标值与时间过渡 | 4 | 部分实现 | Float ×4 |
| [SetForce](Objects类清单/SetForce.md) | 标记区域内受力与速度限制 | 3 | 待实现 | Clump ×3 |
| [SetGlide](Objects类清单/SetGlide.md) | 滑翔与飞行能力开关 | 7 | 待实现 | 待核对运行时依赖 |
| [SetGlobalEventParameter](Objects类清单/SetGlobalEventParameter.md) | 全局事件参数设置 | 2 | 待实现 | 待核对运行时依赖 |
| [SetInputState](Objects类清单/SetInputState.md) | 玩家与摄像机输入开关 | 38 | 待实现 | 待核对运行时依赖 |
| [SetMeshShaderParam](Objects类清单/SetMeshShaderParam.md) | 模型 uniform 值与过渡 | 359 | 待实现 | Clump ×359、Float ×19 |
| [SetMixChannelLowpassFreq](Objects类清单/SetMixChannelLowpassFreq.md) | 混音通道低通频率过渡 | 23 | 待实现 | 待核对运行时依赖 |
| [SetMixChannelVolume](Objects类清单/SetMixChannelVolume.md) | 混音通道音量过渡 | 23 | 待实现 | 待核对运行时依赖 |
| [SetMusicVolume](Objects类清单/SetMusicVolume.md) | 音乐音量过渡 | 52 | 待实现 | 待核对运行时依赖 |
| [SetOceanRender](Objects类清单/SetOceanRender.md) | 海洋绘制开关 | 15 | 部分实现 | 待核对运行时依赖 |
| [SetRainParams](Objects类清单/SetRainParams.md) | 降雨强度、速度与过渡 | 13 | 部分实现 | 待核对运行时依赖 |
| [SetRender](Objects类清单/SetRender.md) | 模型绘制开关 | 10 | 待实现 | Clump ×10 |
| [SetShopTableTutorial](Objects类清单/SetShopTableTutorial.md) | 任务桌商店教程配置 | 2 | 待实现 | WorldQuestTable ×2 |
| [SetSoundParameter](Objects类清单/SetSoundParameter.md) | 全局、音乐或发射器声音参数 | 11 | 待实现 | Clump ×7、Float ×5 |
| [SetTutorialMode](Objects类清单/SetTutorialMode.md) | 教程状态设置 | 24 | 待实现 | 待核对运行时依赖 |
| [SetWind](Objects类清单/SetWind.md) | 全局或区域风场设置 | 4 | 部分实现 | 待核对运行时依赖 |
| [ShowHUDTimed](Objects类清单/ShowHUDTimed.md) | HUD 纹理、图层、时长与过渡 | 73 | 待实现 | 待核对运行时依赖 |
| [ShowMOTD](Objects类清单/ShowMOTD.md) | 公告显示与关闭事件 | 1 | 待实现 | Clump ×1 |
| [SnapToCam](Objects类清单/SnapToCam.md) | 摄像机切换、注视与过渡 | 732 | 待实现 | Clump ×1464、Marker ×97、Rail ×4 |
| [SoulDeposit](Objects类清单/SoulDeposit.md) | 灵魂提交类型、摄像机与事件 | 9 | 待实现 | Clump ×9、LensFlair ×9、Marker ×9 |
| [SoulTrap](Objects类清单/SoulTrap.md) | 灵魂捕获物、几何与销毁事件 | 49 | 部分实现 | Clump ×58、Collectible ×6 |
| [SoundEmitter](Objects类清单/SoundEmitter.md) | 声音实例、距离、方向与自动播放 | 371 | 待实现 | Clump ×202、Marker ×35、LevelMesh ×6、Rail ×5 |
| [SpawnMotes](Objects类清单/SpawnMotes.md) | 发射光点数量、速度与时长 | 76 | 实现中 | MoteParams ×76 |
| [SpinMotes](Objects类清单/SpinMotes.md) | 区域光点旋转、捕获与死亡 | 4 | 待实现 | Marker ×8 |
| [SpiritSoulsDisplayLord](Objects类清单/SpiritSoulsDisplayLord.md) | 灵魂进度、标记与显示事件 | 1 | 待实现 | Clump ×6、LevelMesh ×1 |
| [Star](Objects类清单/Star.md) | 星体收集、解锁与能量容量 | 1 | 待实现 | LevelMesh ×1 |
| [StarFallShower](Objects类清单/StarFallShower.md) | 流星发射、颜色、轨道与范围 | 3 | 部分实现 | Clump ×3、Rail ×3 |
| [StarFragment](Objects类清单/StarFragment.md) | 星体碎片实例与收集事件 | 86 | 待实现 | StarFragmentParams ×38、Clump ×4、SoulTrap ×3、CameraGuide ×1、Emitter ×1 |
| [StarFragmentParams](Objects类清单/StarFragmentParams.md) | 碎片飞行、跟随、携带与人数条件 | 17 | 待实现 | Marker ×17 |
| [StarFragmentsConverge](Objects类清单/StarFragmentsConverge.md) | 碎片汇聚、传送与完成事件 | 9 | 待实现 | Clump ×12、LevelMesh ×9、WorldQuest ×9、CameraKeyFrame ×7 |
| [StopGrinding](Objects类清单/StopGrinding.md) | 停止轨道运动并关联动画 | 2 | 待实现 | 待核对运行时依赖 |
| [StormKeyUnlock](Objects类清单/StormKeyUnlock.md) | 风暴钥匙解锁结果 | 5 | 待实现 | OnLevelUp ×5、Timeline ×4、Clump ×1 |
| [StreamLevelLink](Objects类清单/StreamLevelLink.md) | 带轨道、门槛和场景引导的地图连接 | 1 | 待实现 | Rail ×2、BirdFlock ×1、Clump ×1、LevelLink ×1、Marker ×1、MeditationArea ×1 |
| [StrobeObject](Objects类清单/StrobeObject.md) | 对象闪烁、时长与结束状态 | 12 | 待实现 | Clump ×22 |
| [Survey](Objects类清单/Survey.md) | 问卷入口 | 34 | 待实现 | 待核对运行时依赖 |
| [SwapMoteParams](Objects类清单/SwapMoteParams.md) | 光点参数在区域与阶段间切换 | 14 | 待实现 | Clump ×14、MoteParams ×14 |
| [TerrainBlob](Objects类清单/TerrainBlob.md) | 地形密度形状、噪声与侵蚀参数 | 7174 | 部分实现 | Rail ×54 |
| [TerrainBlobGroup](Objects类清单/TerrainBlobGroup.md) | 地形对象集合、网格生成与细分配置 | 109 | 待实现 | Clump ×134 |
| [TerrainBlobPrefab](Objects类清单/TerrainBlobPrefab.md) | 地形预制资源、变换与生成顺序 | 316 | 待实现 | 待核对运行时依赖 |
| [Timeline](Objects类清单/Timeline.md) | 时间轴对象和时间节点调度 | 293 | 部分实现 | Enable ×970、SnapToCam ×671、Clump ×304、SetMeshShaderParam ×241、TransformObject ×159、PlayAnimation ×153、PlaySound2D ×75、SoundEmitter ×74、ShowHUDTimed ×69、PlayMusic ×54、DoShout ×52、Checkpoint ×44、Npc_PlayAnim ×43、MoveObjectAlongRail ×40、PlayAvatarAnimSeq ×36、DialogHint ×32、SetInputState ×30、SetFlame ×27、AvatarGrindToPos ×26、PlaySound3D ×23、Critter_Shout ×21、Delay ×21、NetFlag ×21、OnFloat ×20、AvatarSetPos ×19、DisplayText ×18、BirdV2ParamSwap ×15、SetMixChannelVolume ×15、IfEnabled ×13、SetAvatarRender ×13、Unlock ×13、Npc_Teleport ×12、AttachGuideRail ×10、AvatarSetStance ×10、Parent ×10、SetCameraKeyFrameShake ×10、Npc_SetScale ×9、SetRender ×9、AvatarHijack ×8、AvatarSetEnergyCapacity ×8、IfInRegion ×8、TutorialNode ×7、AvatarSetInnerGlow ×6、AwakenDarkCreatures ×6、OutfitSelect ×6、SetMusicVolume ×6、SpinMotes ×6、FadeSound ×5、SetCameraShake ×5、SetRainParams ×5、SetSoundParameter ×5、AvatarSetEnergy ×4、DisplayTitleCard ×4、EnableCollision ×4、EventSeries ×4、FireTriggerAtRandom ×4、OnUnlocked ×4、Replay_PlayAnim ×4、AvatarSetCandleState ×3、CollectCollectible ×3、FloatAdd ×3、Replay ×3、SetDarkCreaturesNetworked ×3、SetTutorialMode ×3、StrobeObject ×3、Wind ×3、AvatarChargeEnergy ×2、ChangeLevelWithFade ×2、DisableDpad ×2、DisableStep ×2、DistributeSpiritCollectibles ×2、DropOcclusion ×2、FireWorkShow ×2、IfTweakVar ×2、Npc_Chat ×2、Npc_Turn ×2、OnRegion ×2、OnShout ×2、Rail ×2、SetFloat ×2、StarFallShower ×2、AncestorEngine ×1、AncientSpirit ×1、Collectible ×1、DebugLogline ×1、DisableJump ×1、DistributeRaceCollectibles ×1、ExitRace ×1、LevelMesh ×1、LockAllCollectible ×1、MakeFloaty ×1、NetSetMatchmakingDisabled ×1、NotOnRegion ×1、Npc_GetAttention ×1、Npc_Prompt ×1、Npc_Reflect ×1、Npc_TakeOutFlame ×1、OnAvatarOnGround ×1、OnBetaMode ×1、OnBubbleButton ×1、OnCollected ×1、OnDemoMode ×1、Replay_HandHold ×1、ResetAllStormKeyProgress ×1、ScoreRaceCollectibles ×1、SetAvatarMinYSpeed ×1、SetWind ×1、StormKeyUnlock ×1、Survey ×1、SwapMoteParams ×1 |
| [TimelineNode](Objects类清单/TimelineNode.md) | 时间轴时间与目标对象声明 | 0 | 仅声明待核实 | 待核对运行时依赖 |
| [TitleGate](Objects类清单/TitleGate.md) | 标题流程门控 | 1 | 待实现 | 待核对运行时依赖 |
| [TrackAvatarOnRail](Objects类清单/TrackAvatarOnRail.md) | 按玩家位置跟踪轨道对象 | 7 | 待实现 | Clump ×8、Rail ×7 |
| [TransformObject](Objects类清单/TransformObject.md) | 对象变换目标、过渡与完成事件 | 317 | 部分实现 | Clump ×344、Marker ×216、LevelMesh ×91、Float ×45、Timeline ×3 |
| [Turret](Objects类清单/Turret.md) | 机关眼部、光束与转动参数 | 1 | 待实现 | Clump ×1、Marker ×1 |
| [TutorialNode](Objects类清单/TutorialNode.md) | 教程步骤、目标、拖动与行走事件 | 25 | 待实现 | Marker ×24、Clump ×4 |
| [Tweener](Objects类清单/Tweener.md) | 属性与变换补间控制 | 6 | 待实现 | Clump ×6 |
| [UIInterestMask](Objects类清单/UIInterestMask.md) | 界面关注区域标记 | 2 | 待实现 | Marker ×2 |
| [Unlock](Objects类清单/Unlock.md) | 命名解锁与确认事件 | 27 | 待实现 | Clump ×1 |
| [Water](Objects类清单/Water.md) | 水面空间与阴影配置 | 38 | 部分实现 | 待核对运行时依赖 |
| [Waypoint](Objects类清单/Waypoint.md) | 导航点与范围 | 9 | 待实现 | 待核对运行时依赖 |
| [Wind](Objects类清单/Wind.md) | 区域、轨道与附加标记的风场 | 120 | 部分实现 | Rail ×26、Clump ×4 |
| [WorldQuest](Objects类清单/WorldQuest.md) | 世界任务、活动、加入与奖励状态 | 15 | 待实现 | Clump ×23、FragmentCollectActivity ×15、MeditationArea ×15 |
| [WorldQuestTable](Objects类清单/WorldQuestTable.md) | 任务桌、菜单与地图连接 | 23 | 待实现 | Clump ×19、Marker ×19 |
| [WorldQuestWorldAreaGateEffect](Objects类清单/WorldQuestWorldAreaGateEffect.md) | 世界任务区域门效果 | 1 | 待实现 | LevelLink ×1 |

逐类现有证据、缺口和六项行为验收状态见同名 JSON。Emitter/SpawnMotes 新发射代码尚未完成独立核验及场景接入；不计为已实现行为。
