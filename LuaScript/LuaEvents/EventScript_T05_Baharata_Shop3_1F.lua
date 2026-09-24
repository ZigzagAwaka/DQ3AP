print("Load Script EventScript_T05_Baharata_Shop3_1F")

function EventTemplate(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  EventEnd(eventInfo, "")
end

function Baharata_Shop3_1F_SUB_0_ACTOR_0110_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Baharata_Shop3_1F_SUB_0_ACTOR_0110_010_1")
  CmdEventClosingMessage("NPC_Talk_Baharata_Shop3_1F_SUB_0_ACTOR_0110_010_2")
  EventEnd(eventInfo, "")
end

function Baharata_Shop3_1F_SUB_0_ACTOR_0110_020(BeginOverlap, table, ...)
  eventInfo = EventStart(table, true)
  targetActorId = eventInfo[1]
  CmdEventClosingMessage("NPC_Talk_Baharata_Shop3_1F_SUB_0_ACTOR_0110_020_1")
  EventEnd(eventInfo, "")
end

function Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010(BeginOverlap, table, ...)
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  local Gupta
  local MapTime = GetMapTimeFrame()
  if MapTime == MAPTIME_NIGHT then
    Gupta = "Baharata_Shop3_1F_Gupta_01_L3"
  else
    Gupta = "Baharata_Shop3_1F_Gupta_01_L1"
  end
  local PlayerPOS = GetPartyMemberLocation(1)
  print("X : " .. tostring(PlayerPOS.X) .. [[ Y : ]] .. tostring(PlayerPOS.Y) .. [[ Z : ]] .. tostring(PlayerPOS.Z))
  if GetFlag(Flag.FE744) == true then
    CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_7")
    CmdEventClosingMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_8")
  else
    SetNicolaApertureRate(100, 0)
    SetDispMiniMap(false)
    CmdTurnNpc(Gupta, NPC_D_TO_PLAYER)
    CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_1")
    CmdSpawnMangaIcon(Gupta, "FIELD_EFX2D_SURPRISE")
    CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_2")
    CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_3")
    local result = CmdChoiceMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_4")
    if result == true then
      CmdEventClosingMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_9")
      CmdMoveNpc(Gupta, {
        X = 560,
        Y = 400,
        Z = 0
      }, 400)
      PlaySEEvent("SE_EVENT_SEARCH")
      Wait(2)
      SpawnMangaIcon(Gupta, "FIELD_EFX2D_IMPATIENCE")
      SetNpcAnimation(Gupta, AnimationType.Walk, 3, EFlipbookPlayTypeLoop, false)
      PlaySEEvent("SE_EVENT_SEARCH")
      Wait(0.5)
      ResetNpcAnimation(Gupta)
      Wait(1.5)
      CmdMoveNpc(Gupta, {
        X = 560,
        Y = PlayerPOS.Y,
        Z = 0
      }, 200)
      TurnParty(1, 2)
      CmdTurnNpc(Gupta, NPC_D_UP)
      CmdEventClosingMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_10")
      Wait(0.5)
      CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_11")
      CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_12")
      CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_13")
      CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_14")
      CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_15")
      CmdEventClosingMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_16")
      SetFlag(Flag.FE744, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BAHARATA_TalkGuptaAfterRescue, true)
      RequestAutoSaveFromEvent()
    else
      CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_7")
      CmdEventClosingMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010_8")
    end
    SetDispMiniMap(true)
  end
  EventEnd(eventInfo, "", true)
end

function Baharata_Shop3_1F_MAIN_0_ACTOR_0210_020(BeginOverlap, table, ...)
  -- AP: force the spawning of Alltrades Abbey trader NPC to happen if not already done before
  if not GetFlag(Flag.FE744) then
    Baharata_Shop3_1F_MAIN_0_ACTOR_0210_010(BeginOverlap, table, ...)
    return
  end
  -- AP end
  eventInfo = EventStart(table, false)
  targetActorId = eventInfo[1]
  CmdMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_020_1")
  CmdEventClosingMessage("NPC_Talk_Baharata_Shop3_1F_MAIN_0_ACTOR_0210_020_4")
  EventEnd(eventInfo, "")
end
