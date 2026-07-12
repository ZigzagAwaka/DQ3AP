print("Load Script EventScript_H13_HobbitShrine_1F")

local AP = require("Src/DQ3AP") -- AP

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function HobbitShrine_1F_SUB_0_SCENE_0010_000(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetDispMiniMap(false)
  if GetMapTimeFrame() == MAPTIME_DAYTIME then
    SetSysGlobal(SysGlobal.VD0, 12)
  elseif GetMapTimeFrame() == MAPTIME_EVENING then
    SetSysGlobal(SysGlobal.VD0, 18)
  elseif GetMapTimeFrame() == MAPTIME_NIGHT then
    SetSysGlobal(SysGlobal.VD0, 0)
  end
  ChangeTraceCamera(CAMERA_BLEND_EASE_IN_OUT, 0, 2)
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  MoveParty({
    X = 850,
    Y = 1000,
    Z = 0
  })
  WaitMoveParty()
  CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_010_1")
  CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_010_2")
  Wait(0.1)
  SetHourMapTime(0)
  ChangeMap("MAPLIST_H13R0102", "FromFieldNorth", ORIENTATION_DOWN)
  EventEnd(eventInfo, "")
end

function HobbitShrine_1F_SUB_0_SCENE_0010_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  SetNicolaApertureRate(100, 0)
  SetPlayerLocation({
    X = 850,
    Y = 1000,
    Z = 131
  })
  TurnParty(1, 0)
  WaitFrame(1)
  PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
  SetPartyOpacity(1, 1)
  SetPartyOpacity(2, 1)
  SetPartyOpacity(3, 1)
  SetPartyOpacity(4, 1)
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
  Wait(1)
  CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
  CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_010_18")
  CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_010_19")
  CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_010_20")
  SetFlag(Flag.FD39, false)
  SetFlag(Flag.FE860, true)
  CheckCreateLightHelm()
  SetDispMiniMap(true)
  SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_HOBBITSHRINE_TalkHobbit, true)
  RequestAutoSaveFromEvent()
  EventEnd(eventInfo, "")
end

function HobbitShrine_1F_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_020_1")
  CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_020_2")
  EventEnd(eventInfo, "")
end

function HobbitShrine_1F_SUB_0_ACTOR_0110_030(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_30")
  EventEnd(eventInfo, "")
end

function HobbitShrine_1F_SUB_0_SCENE_0020_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if CheckHeroLiving() == true then
    if GetFlag(Flag.FS1) == false then
      CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
      SetNicolaApertureRate(100, 0)
      SetDispMiniMap(false)
      local party1 = "Party1"
      local party2 = "Party2"
      local party3 = "Party3"
      local party4 = "Party4"
      local Hero, Hobbit, Cat
      if GetMapTimeFrame() == MAPTIME_NIGHT then
        Hobbit = "HobbitShrine_1F_Hobbit_01_L3"
        Cat = "HobbitShrine_1F_Cat_01_L3"
      else
        Hobbit = "HobbitShrine_1F_Hobbit_01_L1"
        Cat = "HobbitShrine_1F_Cat_01_L1"
      end
      RequestPreloadEventScreenShot("EVENTSCREENSHOT_HobbitShrine001")
      RequestPreloadEventScreenShot("EVENTSCREENSHOT_HobbitShrine002")
      SetTagItemId("ITEM_IMPORTANT_BLUE_METAL")
      SpawnPartyCloneDisableAll(true, true, true, true)
      Hero = CheckHeroClone()
      local HeroNumber = CheckHero()
      if HeroNumber == 1 then
        MoveNpc(party1, {
          X = 800,
          Y = 1000,
          Z = 0
        }, 300)
        MoveNpc(party2, {
          X = 600,
          Y = 800,
          Z = 0
        }, 300)
        MoveNpc(party3, {
          X = 500,
          Y = 900,
          Z = 0
        }, 300)
        MoveNpc(party4, {
          X = 600,
          Y = 1100,
          Z = 0
        }, 300)
      elseif HeroNumber == 2 then
        MoveNpc(party2, {
          X = 800,
          Y = 1000,
          Z = 0
        }, 300)
        MoveNpc(party1, {
          X = 600,
          Y = 800,
          Z = 0
        }, 300)
        MoveNpc(party3, {
          X = 500,
          Y = 900,
          Z = 0
        }, 300)
        MoveNpc(party4, {
          X = 600,
          Y = 1100,
          Z = 0
        }, 300)
      elseif HeroNumber == 3 then
        MoveNpc(party3, {
          X = 800,
          Y = 1000,
          Z = 0
        }, 300)
        MoveNpc(party1, {
          X = 600,
          Y = 800,
          Z = 0
        }, 300)
        MoveNpc(party2, {
          X = 500,
          Y = 900,
          Z = 0
        }, 300)
        MoveNpc(party4, {
          X = 600,
          Y = 1100,
          Z = 0
        }, 300)
      elseif HeroNumber == 4 then
        MoveNpc(party4, {
          X = 800,
          Y = 1000,
          Z = 0
        }, 300)
        MoveNpc(party1, {
          X = 600,
          Y = 800,
          Z = 0
        }, 300)
        MoveNpc(party2, {
          X = 500,
          Y = 900,
          Z = 0
        }, 300)
        MoveNpc(party3, {
          X = 600,
          Y = 1100,
          Z = 0
        }, 300)
      end
      ChangeStageCameraToGlobalPoint(500, 1000, 300, CAMERA_BLEND_EASE_IN_OUT, 3, 2, 1800, {
        Yaw = 0,
        Pitch = -25,
        Roll = 0
      })
      WaitMoveNpc(Hero)
      CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_1")
      CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_2")
      SetNpcAnimation(Hero, AnimationType.Act15, 1, EFlipbookPlayTypeAutoResetIdle, false)
      CmdFadeIn(EFadingPriorityTopMost, 0.5)
      Wait(1)
      WaitAnimNpc(Hero)
      DisableNpcCollisionNpcToPlayer(Hobbit, true)
      CmdSetNpcAnimation(Hobbit, AnimationType.Act10, 1, EFlipbookPlayTypeAutoResetIdle, false)
      CmdMoveNpc(Hobbit, {
        X = 1050,
        Y = 1000,
        Z = 0
      }, 150)
      CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_3")
      SetNpcAnimation(Hobbit, AnimationType.Act11, 1, EFlipbookPlayTypeStopEnd, false)
      if GetFlag(Flag.FE208) == true then
        CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_5")
        WaitAnimNpc(Hobbit)
      else
        CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_4")
        WaitAnimNpc(Hobbit)
        if GetFlag(Flag.FE196) == true then
          CmdSpawnMangaIcon(Hobbit, "FIELD_EFX2D_SURPRISE")
          ResetNpcAnimation(Hobbit)
          CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_6")
          CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_7")
          CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_8")
        end
      end
      ResetNpcAnimation(Hobbit)
      CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_9")
      SpawnMangaIcon(Hero, "FIELD_EFX2D_THINK")
      Wait(1.5)
      CloseMangaIconAll(Hero)
      SpawnMangaIcon(Hobbit, "FIELD_EFX2D_SURPRISE")
      CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_10")
      CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_11")
      CmdShowEventScreenShotUI("EVENTSCREENSHOT_HobbitShrine001", EFadingPriorityTopMost, 1)
      CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_12")
      CmdFadeOut(EFadingPriorityUIBackGround, 1)
      CmdCloseEventScreenShotUI(EFadingPriorityTopMost, 0.5)
      CmdShowEventScreenShotUI("EVENTSCREENSHOT_HobbitShrine002", EFadingPriorityTopMost, 0.5)
      CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_13")
      CmdFadeIn(EFadingPriorityUIBackGround, 0)
      CmdCloseEventScreenShotUI(EFadingPriorityTopMost, 1)
      Wait(0.5)
      CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_14")
      CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_15")
      CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_16")
      local result = CmdChoiceMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_17")
      if result == true then
        CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_18")
      else
        CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_19")
        CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_20")
      end
      CmdFadeOut(EFadingPriorityUIBackGround, 0.5)
      EnableCameraLag(false)
      DisableNpcCollisionNpcToPlayer(Hobbit, false)
      ChangeStageCameraToGlobalPoint(1100, 1700, -60, CAMERA_BLEND_LINEAR, 0, 1, 1800, {
        Yaw = 0,
        Pitch = -25,
        Roll = 0
      })
      if result == true then
        SetNpcLocation(Hobbit, {
          X = 800,
          Y = 1740,
          Z = 130
        })
        SetNpcLocation(Hero, {
          X = 680,
          Y = 1825,
          Z = 130
        })
        TurnNpc(Hobbit, NPC_D_UP)
        TurnNpc(Hero, NPC_D_UP)
      else
        SetNpcLocation(Hobbit, {
          X = 800,
          Y = 1740,
          Z = 130
        })
        SetNpcLocation(Hero, {
          X = 825,
          Y = 1825,
          Z = 130
        })
        TurnNpc(Hobbit, NPC_D_UP)
        TurnNpc(Hero, NPC_D_LEFT)
      end
      ChangeNpcOpacity(Cat, 0, 0, false)
      ChangeNpcOpacity(party1, 0, 0, false)
      ChangeNpcOpacity(party2, 0, 0, false)
      ChangeNpcOpacity(party3, 0, 0, false)
      ChangeNpcOpacity(party4, 0, 0, false)
      ChangeNpcOpacity(Hero, 1, 0, false)
      CmdSetNpcAnimation(Hobbit, AnimationType.Act15, 1, EFlipbookPlayTypeStopEnd, false)
      local SE_Fire = PlaySEEvent("EVESE_HOBBITSHRINE_BONFIRE")
      CmdFadeIn(EFadingPriorityUIBackGround, 0.5)
      if result == true then
        PlaySEEvent("EVESE_HOBBITSHRINE_METAL_HIT")
        SetNpcAnimation(Hobbit, AnimationType.Act16, 1, EFlipbookPlayTypeStopEnd, false)
        Wait(1.05)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        Wait(1.54)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        Wait(1.54)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        WaitAnimNpc(Hobbit)
        CmdSetNpcAnimation(Hobbit, AnimationType.Act17, 1, EFlipbookPlayTypeStopEnd, false)
        PlaySEEvent("EVESE_HOBBITSHRINE_METAL_HIT")
        SetNpcAnimation(Hobbit, AnimationType.Act16, 1, EFlipbookPlayTypeStopEnd, false)
        Wait(1.05)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        Wait(1.54)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        Wait(1.54)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        WaitAnimNpc(Hobbit)
      else
        PlaySEEvent("EVESE_HOBBITSHRINE_METAL_HIT")
        SetNpcAnimation(Hobbit, AnimationType.Act16, 1, EFlipbookPlayTypeStopEnd, false)
        Wait(1.05)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        Wait(1.54)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        Wait(1.54)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        WaitAnimNpc(Hobbit)
        SetNpcAnimation(Hobbit, AnimationType.Act17, 1, EFlipbookPlayTypeStopEnd, false)
        TurnNpc(Hero, NPC_D_UP)
        Wait(1)
        TurnNpc(Hero, NPC_D_LEFT)
        SetNpcAnimation(Hero, AnimationType.Act7, 1, EFlipbookPlayTypeAutoResetIdle, false)
        WaitAnimNpc(Hobbit)
        PlaySEEvent("EVESE_HOBBITSHRINE_METAL_HIT")
        SetNpcAnimation(Hobbit, AnimationType.Act16, 1, EFlipbookPlayTypeStopEnd, false)
        Wait(1.04)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        Wait(1.54)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        Wait(1.54)
        SpawnEffectWorld("Ev_H13_Spark_01", {
          X = 870,
          Y = 1756,
          Z = 100
        }, {
          Yaw = 0,
          Pitch = 0,
          Roll = 0
        }, 1)
        WaitAnimNpc(Hobbit)
      end
      SoundFadeOut(SE_Fire, 0.2, true)
      CmdFadeOut(EFadingPriorityUIBackGround, 0.5)
      local SE_Hit = PlaySEEvent("EVESE_HOBBITSHRINE_METAL_HIT")
      CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_21")
      CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_22")
      SoundFadeOut(SE_Hit, 0.2, true)
      Wait(0.2)
      ChangeStageCameraToGlobalPoint(700, 1700, -60, CAMERA_BLEND_LINEAR, 0, 1, 1800, {
        Yaw = 0,
        Pitch = -25,
        Roll = 0
      })
      ResetNpcAnimation(Hobbit)
      SetVisibleActorsTag("Helm", true)
      SetNpcLocation(Hobbit, {
        X = 300,
        Y = 1650,
        Z = 130
      })
      SetNpcLocation(Hero, {
        X = 300,
        Y = 1850,
        Z = 130
      })
      TurnNpc(Hobbit, NPC_D_RIGHT)
      TurnNpc(Hero, NPC_D_LEFT)
      Wait(2)
      PlaySEEvent("EVESE_HOBBITSHRINE_HELMET_COMP")
      SpawnLoopEffectWorld("Ev_H13_HelmOfLight_Twinkle_01", "Twinkle", {
        X = 400,
        Y = 1750,
        Z = 116.5
      }, {
        Yaw = 0,
        Pitch = 0,
        Roll = 0
      }, 1)
      CmdFadeIn(EFadingPriorityUIBackGround, 0.5)
      CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_23")
      CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_24")
      CmdMoveNpc(Hero, {
        X = 300,
        Y = 1750,
        Z = 0
      }, 150)
      TurnNpc(Hero, NPC_D_UP)
      Wait(0.5)
      RequestUnlockAchievementByGetLightHelm()
      SetNpcAnimation(Hero, AnimationType.Act16, 1, EFlipbookPlayTypeAutoResetIdle, false)
      EraseLoopEffectByParamEnd("Twinkle", 0.5)
      Wait(0.5)
      SetVisibleActor("BP_PL_HelmOfLight_01", false)
      ItemGetMessageToLocation("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_25", "ITEM_ARCHIPELAGO"--[["ITEM_EQUIP_HELMET_LIGHT_HELM"]], { -- AP
        X = 400,
        Y = 1750,
        Z = 160
      })
      -- AP
      AP.Log("HobbitShrine_1F_SUB_0_SCENE_0020_010 called (Shrine of the Dwarf - Dwarf giving the Auroral Helm)")
      AP.CheckLocation("HobbitShrine_1F_SUB_0_SCENE_0020_010")
      local ItemId = "ITEM_ARCHIPELAGO"
      if ItemId == "ITEM_ARCHIPELAGO" then
        AddItem(ItemId)
      else
        AddItem("ITEM_EQUIP_HELMET_LIGHT_HELM")
      end
      -- AP end
      RemoveItem("ITEM_EQUIP_HELMET_ORTEGAS_HELM")
      RemoveItem("ITEM_IMPORTANT_BLUE_METAL")
      WaitAnimNpc(Hero)
      TurnNpc(Hero, NPC_D_LEFT)
      if GetFlag(Flag.FE208) == true then
        CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_26")
      else
        CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_27")
        CmdMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_28")
      end
      CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_030_29")
      CmdFadeOut(EFadingPriorityUIBackGround, 0.5)
      SetVisibleActorsTag("Helm", false)
      SetNpcLocation(Hobbit, {
        X = 1140,
        Y = 1000,
        Z = 131
      })
      SetNpcLocation(Hero, {
        X = 850,
        Y = 1000,
        Z = 131
      })
      TurnNpc(Hobbit, NPC_D_LOW)
      TurnNpc(Hero, NPC_D_UP)
      RevivalPartyMember(0, 1)
      HealPartyMemberStatusEffect(0)
      HealPartyMemberHP(0, 999)
      HealPartyMemberMP(0, 999)
      WaitFrame(1)
      ChangeNpcOpacity(Cat, 1, 0, false)
      ChangeNpcOpacity(party1, 1, 0, false)
      ChangeNpcOpacity(party2, 1, 0, false)
      ChangeNpcOpacity(party3, 1, 0, false)
      ChangeNpcOpacity(party4, 1, 0, false)
      DestroyPartyClone()
      SetPlayerLocation({
        X = 800,
        Y = 1000,
        Z = 131
      })
      WaitFrame(1)
      TurnParty(1, 0)
      PartyMemberAlignment(ALIGNMENT_STRAIGHT, ALIGNMENT_MOVE_WARP)
      SetDispMiniMap(true)
      CmdChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
      CmdFadeIn(EFadingPriorityUIBackGround, 0.5)
      EnableCameraLag(true)
      SetFlag(Flag.FE849, true)
      SetFlag(Flag.FS0, true)
      RequestAutoSaveFromEvent()
    else
      DisableEventFastForwardUI()
      print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
      CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
    end
  else
    DisableEventFastForwardUI()
    print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
    CmdFadeInOnInitialFadeInPostMapTransition(EFadingPriorityTopMost, 0.5, GetCurrentMapId())
    SetFlag(Flag.FS1, true)
  end
  EventEnd(eventInfo, "")
end

function HobbitShrine_1F_SUB_0_ACTOR_0110_040(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  if GetFlag(Flag.FS0) == true then
    CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_040_1")
  else
    CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0110_040_2")
  end
  EventEnd(eventInfo, "")
end

function HobbitShrine_1F_SUB_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  result = CmdChoiceMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0210_010_1")
  if result == true then
    CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0210_010_2")
  else
    CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0210_010_3")
  end
  EventEnd(eventInfo, "", false)
end

function HobbitShrine_1F_SUB_0_ACTOR_0310_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_HobbitShrine_1F_SUB_0_ACTOR_0310_010_1")
  EventEnd(eventInfo, "", false)
end
