print("Load Script Nicola_EventCommandLibrary")

-- AP



-- AP end

function ExitFloorEvent(NextMapId)
  local len = string.len(GetCurrentMapId())
  local TownPrefixId = string.sub(GetCurrentMapId(), len - 15, len - 5)
  local currentMapId = GetCurrentMapId()
  print(currentMapId .. " \227\129\139\227\130\137 " .. NextMapId .. " \227\129\171\231\167\187\229\139\149\227\129\153\227\130\139\233\154\155\227\129\174\227\131\149\227\131\173\227\130\162\231\181\130\228\186\134\227\130\164\227\131\153\227\131\179\227\131\136")
  print(TownPrefixId .. " \231\148\186\227\129\174\230\142\165\233\160\173ID")
  if currentMapId == "MAPLIST_FIELD1" and GetFlag(Flag.FE810) == true then
    SetFlag(Flag.FE810, false)
    return
  end
  if TownPrefixId == "MAPLIST_T15" then
    if NextMapId == "MAPLIST_FIELD1" then
      print("\229\164\150\227\129\160\227\130\136")
      if GetFlag(Flag.FE128) == true then
        SetFlag(Flag.FE130, true)
      else
        SetFlag(Flag.FE810, true)
      end
      CheckBurg()
      return
    end
    if NextMapId == "MAPLIST_T15F0601" or NextMapId == "MAPLIST_T15R6101" or NextMapId == "MAPLIST_T15R6102" or NextMapId == "MAPLIST_T15R6201" or NextMapId == "MAPLIST_T15R6301" or NextMapId == "MAPLIST_T15R6401" or NextMapId == "MAPLIST_T15R6501" or NextMapId == "MAPLIST_T15R6601" or NextMapId == "MAPLIST_T15R6602" then
      print("\227\131\144\227\131\188\227\130\175\227\129\160\227\130\136")
      return
    else
      print("\227\131\144\227\131\188\227\130\175\227\129\152\227\130\131\227\129\170\227\129\132\227\130\136")
      if GetFlag(Flag.FE128) == true then
        CheckBurg()
        return
      end
    end
  end
  if NextMapId == "MAPLIST_D20F0101" then
    SetFlag(Flag.FE105, true)
    return
  end
  if currentMapId == "MAPLIST_T06R0701" and NextMapId == "MAPLIST_FIELD1" then
    SetFlag(Flag.FE807, true)
    return
  end
  if (TownPrefixId == "MAPLIST_C01" or TownPrefixId == "MAPLIST_C02" or TownPrefixId == "MAPLIST_C03" or TownPrefixId == "MAPLIST_C04" or TownPrefixId == "MAPLIST_C05" or TownPrefixId == "MAPLIST_C06" or TownPrefixId == "MAPLIST_C07" or TownPrefixId == "MAPLIST_C08" or TownPrefixId == "MAPLIST_T01" or TownPrefixId == "MAPLIST_T02" or TownPrefixId == "MAPLIST_T03" or TownPrefixId == "MAPLIST_T03" or TownPrefixId == "MAPLIST_T04" or TownPrefixId == "MAPLIST_T05" or TownPrefixId == "MAPLIST_T06" or TownPrefixId == "MAPLIST_T07" or TownPrefixId == "MAPLIST_T11" or TownPrefixId == "MAPLIST_T12" or TownPrefixId == "MAPLIST_T13" or TownPrefixId == "MAPLIST_T14" or TownPrefixId == "MAPLIST_T16") and NextMapId == "MAPLIST_FIELD1" then
    SetFlag(Flag.FE810, false)
    CheckBurgField()
  end
  if currentMapId == "MAPLIST_C08R0105" and NextMapId == "MAPLIST_C08R0107" then
    SetFlag(Flag.FD33, false)
    return
  end
  if currentMapId == "MAPLIST_C08R0107" and NextMapId == "MAPLIST_C08F0101" then
    SetFlag(Flag.FE185, true)
    return
  end
  if currentMapId == "MAPLIST_C10R1001" and NextMapId == "MAPLIST_FIELD2" and GetFlag(Flag.FE91) == true then
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_HEROCAVE_GoOut, true)
    return
  end
  if currentMapId == "MAPLIST_D06F0101" and NextMapId == "MAPLIST_D06R0601" or currentMapId == "MAPLIST_D06R0601" and NextMapId == "MAPLIST_D06F0101" then
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_PYRAMID_ArriveB1F, true)
    return
  end
  if currentMapId == "MAPLIST_H07R0101" then
    if GetFlag(Flag.FE219) == false then
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_NORUDCAVE_TalkWithLetter, false)
    end
    return
  end
  if currentMapId == "MAPLIST_D07R0201" then
    if GetFlag(Flag.FE223) == false then
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BAHARATAEASTCAVE_OpenPrison, false)
    end
    return
  end
end

function Burg_Remind_1()
  if GetFlag(Flag.FE810) == true then
    SetFlag(Flag.FE810, false)
  else
    if GetFlag(Flag.FE917) == false then
      CmdEventClosingMessage("NPC_Talk_Common_Field_MAIN_0_SCENE_0010_010_1")
    end
    SetFlag(Flag.FE811, true)
  end
end

function Burg_Remind_2()
  if GetFlag(Flag.FE810) == true then
    SetFlag(Flag.FE810, false)
  else
    if GetFlag(Flag.FE918) == false then
      CmdEventClosingMessage("NPC_Talk_Common_Field_MAIN_0_SCENE_0010_010_1")
    end
    SetFlag(Flag.FE812, true)
  end
end

function Burg_Remind_3()
  if GetFlag(Flag.FE810) == true then
    SetFlag(Flag.FE810, false)
  else
    if GetFlag(Flag.FE919) == false then
      CmdEventClosingMessage("NPC_Talk_Common_Field_MAIN_0_SCENE_0010_010_1")
    end
    SetFlag(Flag.FE813, true)
  end
end

function Burg_Remind_4()
  if GetFlag(Flag.FE810) == true then
    SetFlag(Flag.FE810, false)
  else
    if GetFlag(Flag.FE920) == false then
      CmdEventClosingMessage("NPC_Talk_Common_Field_MAIN_0_SCENE_0010_010_1")
    end
    SetFlag(Flag.FE814, true)
  end
end

function Burg_Remind_5()
  if GetFlag(Flag.FE810) == true then
    SetFlag(Flag.FE810, false)
  else
    if GetFlag(Flag.FE921) == false then
    end
    SetFlag(Flag.FE815, true)
  end
end

function PlayLocationCamera(table, BlackOut)
  local EndFadeIn
  if BlackOut == nil then
    EndFadeIn = true
  else
    EndFadeIn = BlackOut
  end
  SetPartyOpacity(1, 0)
  SetPartyOpacity(2, 0)
  SetPartyOpacity(3, 0)
  SetPartyOpacity(4, 0)
  local mapTimeFrame = GetMapTimeFrame()
  local sequenceIndex = 0
  if mapTimeFrame == MAPTIME_NIGHT then
    sequenceIndex = 1
  elseif mapTimeFrame == MAPTIME_EVENING then
    sequenceIndex = 2
  end
  CmdPlayEventSequencePrevChangeMap(sequenceIndex, GetCurrentMapId(), EFadingPriorityTopMost, 0.5, EFadingPriorityTopMost, false)
  ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 1)
  SetPartyOpacity(1, 1)
  SetPartyOpacity(2, 1)
  SetPartyOpacity(3, 1)
  SetPartyOpacity(4, 1)
  if EndFadeIn == true then
    WaitFrame(1)
    DisableEventFastForwardUI()
    print("\227\130\185\227\130\173\227\131\131\227\131\151\233\157\158\232\161\168\231\164\186")
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
  else
    WaitFrame(1)
  end
end

function CmdPlayOpenAnimSearchObj(ActorName)
  PlayOpenAnimSearchObj(ActorName)
  _retry(SYS_WaitPlayAnimSearchObj, ActorName)
end

function CmdPlayCloseAnimSearchObj(ActorName)
  PlayCloseAnimSearchObj(ActorName)
  _retry(SYS_WaitPlayAnimSearchObj, ActorName)
end

function WaitPlayAnimSearchObj(ActorName)
  _retry(SYS_WaitPlayAnimSearchObj, ActorName)
end

function CmdLoadItemIcon(ItemId)
  LoadItemIcon(ItemId)
  _retry(SYS_WaitLoadItemIcon)
end

function CmdPlayItemGet(ActorName, TreasureId)
  PlayItemGet(ActorName, TreasureId)
  _retry(SYS_WaitPlayItemGet)
end

function CmdPlayItemGetNoWait(ActorName, TreasureId)
  PlayItemGet(ActorName, TreasureId)
end

function CmdPlayItemGetToLocation(Location, ItemId)
  PlayItemGetToLocation(Location, ItemId)
  _retry(SYS_WaitPlayItemGet)
end

function CmdPlayItemGetToActor(TargetId, Offset, ItemId)
  PlayItemGetToActor(TargetId, Offset, ItemId)
  _retry(SYS_WaitPlayItemGet)
end

function WaitPlayItemGet()
  _retry(SYS_WaitPlayItemGet)
end

function CloseDoor(DoorName, DoorSE)
  PlayCloseAnimSearchObj(DoorName)
  if DoorSE == "" then
  else
    PlaySEEvent(DoorSE)
  end
end

function NpcActionCommandRotate(TargetActorId, OneLapSecond, LapCount, IsRightRotate)
  local loopCount = LapCount * 4
  local interval = OneLapSecond / 4
  local rotAngle = 0
  if IsRightRotate then
    rotAngle = 90
  else
    rotAngle = -90
  end
  for i = 1, loopCount do
    SleepNpc(TargetActorId, interval)
    TurnNpcRelative(TargetActorId, rotAngle)
  end
end

function NpcActionCommandJumpRotate(TargetActorId, OneLapSecond, LapCount, IsRightRotate)
  local loopCount = LapCount * 4
  local interval = OneLapSecond / 4
  local rotAngle = 0
  if IsRightRotate then
    rotAngle = 90
  else
    rotAngle = -90
  end
  for i = 1, loopCount do
    if i % 4 == 1 then
      JumpNpc(TargetActorId, 100, OneLapSecond, true)
    end
    SleepNpc(TargetActorId, interval)
    TurnNpcRelative(TargetActorId, rotAngle)
  end
end

function CheckHero()
  local HeroNumber = 0
  local i
  for i = 1, 4 do
    if GetPartyMemberJob(i) == UNIT_JOB_HERO then
      HeroNumber = i
    end
  end
  return HeroNumber
end

function CheckPartyMemberNum()
  local PartyMemberNum = GetPartyMemberNum()
  return PartyMemberNum
end

function CheckLivingMemberNum()
  local LivingMemberNum = 0
  local i
  for i = 1, 4 do
    if 1 <= GetPartyMemberStatus(i, UNIT_STATUS_HP) then
      LivingMemberNum = LivingMemberNum + 1
    end
  end
  return LivingMemberNum
end

function CheckHeroSolo()
  local checkResult = false
  local HeroNumber = CheckHero()
  if HeroNumber == 0 then
  elseif CheckPartyMemberNum() == 1 then
    checkResult = true
  end
  return checkResult
end

function CheckHeroSubsistence()
  local checkResult = false
  local HeroNumber = CheckHero()
  if GetPartyMemberStatus(HeroNumber, UNIT_STATUS_HP) >= 1 then
    checkResult = true
  end
  return checkResult
end

function CheckHeroLiving()
  local checkResult = false
  local HeroNumber = CheckHero()
  if HeroNumber == 0 then
  elseif GetPartyMemberStatus(HeroNumber, UNIT_STATUS_HP) >= 1 then
    checkResult = true
  end
  return checkResult
end

function CheckHeroDying()
  local checkResult = false
  local HeroNumber = CheckHero()
  if HeroNumber == 0 then
  elseif 0 >= GetPartyMemberStatus(HeroNumber, UNIT_STATUS_HP) then
    checkResult = true
  end
  return checkResult
end

function CheckHeroGender()
  local checkResult = false
  if GetHeroGender() == UNIT_GENDER_MALE then
    checkResult = true
  end
  return checkResult
end

function CheckPartyMemberGender()
  local checkResult = false
  local i
  for i = 1, 4 do
    if GetPartyMemberGender(i) == UNIT_GENDER_MALE then
      checkResult = true
      break
    end
  end
  return checkResult
end

function CheckMaleLiving()
  local checkResult = false
  local i
  for i = 1, 4 do
    if GetPartyMemberGender(i) == UNIT_GENDER_MALE and 1 <= GetPartyMemberStatus(i, UNIT_STATUS_HP) then
      checkResult = true
      break
    end
  end
  return checkResult
end

function CheckLeaderGender()
  local checkResult = false
  local HeroNumber = CheckHero()
  local i
  print("hoge")
  print(HeroNumber)
  if HeroNumber == 0 then
    for i = 1, 4 do
      if GetPartyMemberGender(i) == UNIT_GENDER_MALE then
        checkResult = true
        break
      end
    end
  elseif 1 <= GetPartyMemberStatus(HeroNumber, UNIT_STATUS_HP) then
    if GetPartyMemberGender(HeroNumber) == UNIT_GENDER_MALE then
      checkResult = true
    end
  else
    for i = 1, 4 do
      if 1 <= GetPartyMemberStatus(i, UNIT_STATUS_HP) and GetPartyMemberGender(i) == UNIT_GENDER_MALE then
        checkResult = true
        break
      end
    end
  end
  return checkResult
end

function CheckMemberNothing()
  local checkResult = false
  local HP = 0
  local HeroNumber = CheckHero()
  local PartyMemberNum = CheckPartyMemberNum()
  if PartyMemberNum <= 1 then
    if 1 <= HeroNumber then
      checkResult = true
    end
  else
    local i
    for i = 1, PartyMemberNum do
      if GetPartyMemberJob(i) ~= UNIT_JOB_HERO then
        HP = HP + GetPartyMemberStatus(i, UNIT_STATUS_HP)
      end
    end
    if HP <= 0 then
      checkResult = true
    end
  end
  return checkResult
end

function CheckLeaderGender2()
  local checkResult = false
  local HeroNumber = CheckHero()
  if HeroNumber == 0 then
    local i
    for i = 1, 4 do
      if 1 <= GetPartyMemberStatus(i, UNIT_STATUS_HP) and GetPartyMemberGender(i) == UNIT_GENDER_MALE then
        checkResult = true
        break
      end
    end
  elseif GetPartyMemberGender(HeroNumber) == UNIT_GENDER_MALE then
    checkResult = true
  end
  return checkResult
end

function CheckHeroineLiving()
  local checkResult = false
  local HeroNumber = CheckHero()
  if HeroNumber == 0 then
  elseif GetPartyMemberStatus(HeroNumber, UNIT_STATUS_HP) >= 1 then
  elseif GetPartyMemberGender(HeroNumber) == UNIT_GENDER_FEMALE then
    checkResult = true
  end
  return checkResult
end

function CheckMaleMemberOrHeroLiving()
  local checkResult = false
  local i
  for i = 1, 4 do
    if GetPartyMemberGender(i) == UNIT_GENDER_MALE then
      checkResult = true
      break
    end
  end
  local HeroNumber = CheckHero()
  if HeroNumber == 0 then
  elseif 1 <= GetPartyMemberStatus(HeroNumber, UNIT_STATUS_HP) then
    checkResult = true
  end
  return checkResult
end

function CheckHeroAbsent()
  local checkResult = false
  local HeroNumber = CheckHero()
  if HeroNumber == 0 then
    checkResult = true
  end
  return checkResult
end

function CheckTanyaRescueRequest()
  local checkResult = false
  if GetFlag(Flag.FD13) == false and GetFlag(Flag.FE137) == true then
    checkResult = true
  end
  return checkResult
end

function CheckRomariaInnEvent()
  local checkResult = false
  if GetFlag(Flag.FE169) == true and GetFlag(Flag.FD23) == false and GetFlag(Flag.FD20) == true then
    checkResult = true
  end
  return checkResult
end

function CheckAfterRomariaKingEvent()
  local checkResult = false
  if GetFlag(Flag.FE170) == true and GetFlag(Flag.FE169) == false then
    checkResult = true
  end
  return checkResult
end

function CheckPossessingKingCrown()
  return IsHaveItem("ITEM_EQUIP_HELMET_KINGS_CROWN")
end

function CheckGetOrtegaHelmet()
  local checkResult = false
  if GetFlag(Flag.FE67) == true and GetFlag(Flag.FD12) == false then
    checkResult = true
  end
  return checkResult
end

function CheckBasementBecomesDaylight()
  local checkResult = false
  if GetFlag(Flag.FE91) == true and GetFlag(Flag.FE104) == false then
    checkResult = true
  end
  return checkResult
end

function CheckDevilClawMarkB3F()
  local checkResult = false
  if GetFlag(Flag.FE91) == true and GetFlag(Flag.FE164) == false then
    checkResult = true
  end
  return checkResult
end

function CheckHiddenDungeonOpened()
  local checkResult = false
  if GetFlag(Flag.FE98) == true and GetFlag(Flag.FE164) == true then
    checkResult = true
  end
  return checkResult
end

function CheckOrtegaTalk()
  local checkResult = false
  if GetFlag(Flag.FE165) == true and GetFlag(Flag.FD35) == false then
    checkResult = true
  end
  return checkResult
end

function CheckOrtegaBeforeDie()
  local checkResult = false
  if GetFlag(Flag.FE208) == false and GetFlag(Flag.FE236) == false then
    checkResult = true
  end
  return checkResult
end

function CheckNoonAfterDefeatingBaramosAndBeforeZomaAppears()
  local checkResult = false
  if GetMapTimeFrame() == MAPTIME_DAYTIME and GetFlag(Flag.FE164) == false and GetFlag(Flag.FE90) == true then
    checkResult = true
  end
  return checkResult
end

function CheckWakeyDust()
  local checkResult = false
  if GetFlag(Flag.FE34) == true and GetFlag(Flag.FE133) == true and GetFlag(Flag.FD12) == false then
    checkResult = true
  end
  return checkResult
end

function CheckOrbCount()
  local orbCount = 0
  if GetFlag(Flag.FE73) == true then
    orbCount = orbCount + 1
  end
  if GetFlag(Flag.FE74) == true then
    orbCount = orbCount + 1
  end
  if GetFlag(Flag.FE75) == true then
    orbCount = orbCount + 1
  end
  if GetFlag(Flag.FE76) == true then
    orbCount = orbCount + 1
  end
  if GetFlag(Flag.FE77) == true then
    orbCount = orbCount + 1
  end
  if GetFlag(Flag.FE78) == true then
    orbCount = orbCount + 1
  end
  return orbCount
end

function CheckGopEnum_MAIN_MULTI_GetAllOrb()
  if CheckOrbCount() >= 6 then
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_MULTI_GetAllOrb, true)
    SetFlag(Flag.FE879, true)
  end
end

function CheckBurg()
  if GetFlag(Flag.FE117) == true then
    return
  end
  if GetFlag(Flag.FE116) == true then
    CheckDevBurg6()
    return
  end
  if GetFlag(Flag.FE115) == true then
    CheckDevBurg5()
    return
  end
  if GetFlag(Flag.FE114) == true then
    CheckDevBurg4()
    return
  end
  if GetFlag(Flag.FE113) == true then
    CheckDevBurg3()
    return
  end
  if GetFlag(Flag.FE112) == true then
    CheckDevBurg2()
    return
  end
  CheckDevBurg1()
  return
end

function CheckBurgField()
  if GetFlag(Flag.FE117) == true then
    return
  end
  if GetFlag(Flag.FE116) == true then
    if GetFlag(Flag.FE128) == true then
      SetFlag(Flag.FE117, true)
    end
    return
  end
  if GetFlag(Flag.FE115) == true then
    if GetFlag(Flag.FE127) == true and GetFlag(Flag.FE35) == true then
      SetFlag(Flag.FE116, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_6_ChangeFrom5, true)
    end
    return
  end
  if GetFlag(Flag.FE114) == true then
    if GetFlag(Flag.FE125) == true and CheckOrbCount() >= 3 then
      SetFlag(Flag.FE115, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_5_ChangeFrom4, true)
    end
    return
  end
  if GetFlag(Flag.FE113) == true then
    if GetFlag(Flag.FE124) == true and GetFlag(Flag.FE194) == true then
      SetFlag(Flag.FE114, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_4_ChangeFrom3, true)
    end
    return
  end
  if GetFlag(Flag.FE112) == true then
    if GetFlag(Flag.FE123) == true and GetFlag(Flag.FE56) == true and GetFlag(Flag.FE151) == true then
      SetFlag(Flag.FE113, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_3_ChangeFrom2, true)
    end
    return
  end
  if GetFlag(Flag.FE118) == true then
    SetFlag(Flag.FE111, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_1_MerchantNearPond, true)
    SetFlag(Flag.FE112, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_2_ChangeFrom1, true)
  end
  return
end

function CheckDevBurg1()
  if GetFlag(Flag.FE118) == true then
    SetFlag(Flag.FE111, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_1_MerchantNearPond, true)
    if GetFlag(Flag.FE810) == false then
      SetFlag(Flag.FE112, true)
      SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_2_ChangeFrom1, true)
      if GetFlag(Flag.FE811) == false then
        Burg_Remind_1()
      end
    end
  end
end

function CheckDevBurg2()
  if GetFlag(Flag.FE123) == true and GetFlag(Flag.FE56) == true and GetFlag(Flag.FE151) == true and GetFlag(Flag.FE810) == false then
    SetFlag(Flag.FE113, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_3_ChangeFrom2, true)
    if GetFlag(Flag.FE812) == false then
      Burg_Remind_2()
    end
  end
end

function CheckDevBurg3()
  if GetFlag(Flag.FE124) == true and GetFlag(Flag.FE194) == true and GetFlag(Flag.FE810) == false then
    SetFlag(Flag.FE114, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_4_ChangeFrom3, true)
    if GetFlag(Flag.FE813) == false then
      Burg_Remind_3()
    end
  end
end

function CheckDevBurg4()
  if GetFlag(Flag.FE125) == true and CheckOrbCount() >= 3 and GetFlag(Flag.FE810) == false then
    SetFlag(Flag.FE115, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_5_ChangeFrom4, true)
    if GetFlag(Flag.FE814) == false then
      Burg_Remind_4()
    end
  end
end

function CheckDevBurg5()
  if GetFlag(Flag.FE127) == true and GetFlag(Flag.FE35) == true and GetFlag(Flag.FE810) == false then
    SetFlag(Flag.FE116, true)
    SetFlagGopEnumProgress(FlagGOPEnumProgress.MAIN_BURG_6_ChangeFrom5, true)
    if GetFlag(Flag.FE815) == false then
      Burg_Remind_5()
    end
  end
end

function CheckDevBurg6()
  if GetFlag(Flag.FE128) == true and GetFlag(Flag.FE810) == false then
    SetFlag(Flag.FE117, true)
  end
end

function CheckBurgMayor()
  local MayorNumber = 0
  local partyNum
  for partyNum = 1, 4 do
    if IsBurgMember(partyNum) == true then
      MayorNumber = partyNum
      break
    end
  end
  return MayorNumber
end

function CheckBurgMayorLiving()
  local checkResult = false
  local MayorNumber = CheckBurgMayor()
  if MayorNumber == 0 then
  elseif GetPartyMemberStatus(MayorNumber, UNIT_STATUS_HP) >= 1 then
    checkResult = true
  end
  return checkResult
end

function CheckTransform()
  local checkResult = false
  if CheckFadingJenny() == false and CheckModRod() == true then
    checkResult = true
  end
  return checkResult
end

function CheckFadingJenny()
  return IsValidSkillInvisible()
end

function CheckModRod()
  return IsValidSkillTransform()
end

function CheckModRodNonHuman()
  local checkResult = false
  if CheckModRod() == true and CheckTransformNonHuman() == true then
    checkResult = true
  end
  return checkResult
end

function CheckTransformNonHuman()
  local checkResult = false
  if GetPartyTransformType() == TRANSFORM_TYPE_MONSTER then
    checkResult = true
  end
  if GetPartyTransformType() == TRANSFORM_TYPE_SLIME then
    checkResult = true
  end
  return checkResult
end

function CheckTransformMonster()
  local checkResult = false
  if GetPartyTransformType() == TRANSFORM_TYPE_MONSTER then
    checkResult = true
  end
  return checkResult
end

function CheckTransformSlime()
  local checkResult = false
  if GetPartyTransformType() == TRANSFORM_TYPE_SLIME then
    checkResult = true
  end
  return checkResult
end

function CheckTransformHobbit()
  local checkResult = false
  if GetPartyTransformType() == TRANSFORM_TYPE_HOBBIT then
    checkResult = true
  end
  return checkResult
end

function CheckTransformHuman()
  local checkResult = false
  if CheckTransformNonHuman() == true then
    checkResult = true
  end
  return checkResult
end

function CheckHeroClone()
  local Clone
  local HeroNumber = CheckHero()
  if HeroNumber == 1 then
    Clone = "Party1"
  elseif HeroNumber == 2 then
    Clone = "Party2"
  elseif HeroNumber == 3 then
    Clone = "Party3"
  elseif HeroNumber == 4 then
    Clone = "Party4"
  end
  return Clone
end

function CheckCreateLightHelm()
  if GetFlag(Flag.FE67) == true and GetFlag(Flag.FE859) == true and GetFlag(Flag.FE860) == true then
    SetFlag(Flag.FE861, true)
  end
end

function CheckCompTrial()
  if GetFlag(Flag.FE712) == true and GetFlag(Flag.FE716) == true and GetFlag(Flag.FE720) == true and GetFlag(Flag.FE721) == true and GetFlag(Flag.FE722) == true then
    SetFlag(Flag.FE723, true)
  end
end

function MonsterScoutScript(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, targetActorId, MonsterLocation)
  local scoutResult = GetScoutMonsterVigilanceResult(MonsterScoutId)
  if scoutResult == EMBRScoutResultFailed then
    return
  end
  if scoutResult == EMBRScoutResultSuccess then
    print("\230\136\144\229\138\159\227\129\151\227\129\166\227\130\139\230\153\130")
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    SetNicolaEnableDOF(false)
    ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance)
    if MonsterLocation ~= nil then
      SetNpcLocation(ActorId, MonsterLocation)
    end
    SetPartyOpacity(2, 0)
    SetPartyOpacity(3, 0)
    SetPartyOpacity(4, 0)
    TurnParty(PlayerLook.Chara, PlayerLook.Turn)
    if PlayerLocation ~= nil then
      SetPlayerLocation(PlayerLocation)
    end
    Wait(1)
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    AddScoutMonster(MonsterScoutId)
    SetTagWordMonsterSpeciesFromScoutId(MonsterScoutId)
    CmdMessage(TextTable.Success1)
    CloseMessage()
    CmdMessage(TextTable.Success2)
    CloseMessage()
    CmdMessage(TextTable.Success3)
    CloseMessage()
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    PlaySEEvent("EVESE_MBR_STAIRWAY")
    DestroyMBRMonster(ActorId)
    SetPartyOpacity(2, 1)
    SetPartyOpacity(3, 1)
    SetPartyOpacity(4, 1)
    PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WARP)
    ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
    SetNicolaEnableDOF(true)
    Wait(0.5)
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    CmdCallMBRScoutSuccessUI(MonsterScoutId)
  elseif scoutResult == EMBRScoutResultSuccessDisguiseHuman then
    print("\229\140\150\227\129\145\227\129\166\227\129\132\227\129\166\230\136\144\229\138\159\227\129\151\227\129\166\227\130\139\230\153\130")
    CmdMessage(TextTable.Disguise)
    CloseMessage()
    CmdMessage(TextTable.RaMirror1)
    Wait(0.5)
    CloseMessage()
    Wait(1)
    PlaySEEvent("EVESE_SAMANOSA_RA_MIRROR")
    CmdFadeOut(EFadingPriorityWhiteTopMost, 0.5)
    SetNicolaEnableDOF(false)
    ChangeActorDisguiseHumanToMonster(ActorId)
    ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance)
    if MonsterLocation ~= nil then
      SetNpcLocation(ActorId, MonsterLocation)
    end
    SetPartyOpacity(2, 0)
    SetPartyOpacity(3, 0)
    SetPartyOpacity(4, 0)
    TurnParty(PlayerLook.Chara, PlayerLook.Turn)
    if PlayerLocation ~= nil then
      SetPlayerLocation(PlayerLocation)
    end
    Wait(0.5)
    CmdFadeIn(EFadingPriorityWhiteTopMost, 0.5)
    AddScoutMonster(MonsterScoutId)
    SetTagWordMonsterSpeciesFromScoutId(MonsterScoutId)
    CmdMessage(TextTable.RaMirror2)
    CloseMessage()
    CmdMessage(TextTable.Success1)
    CloseMessage()
    CmdMessage(TextTable.Success2)
    CloseMessage()
    CmdMessage(TextTable.Success3)
    CloseMessage()
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    PlaySEEvent("EVESE_MBR_STAIRWAY")
    DestroyMBRMonster(ActorId)
    Wait(1)
    SetPartyOpacity(2, 1)
    SetPartyOpacity(3, 1)
    SetPartyOpacity(4, 1)
    PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WARP)
    ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
    SetNicolaEnableDOF(true)
    Wait(1)
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    CmdCallMBRScoutSuccessUI(MonsterScoutId)
  elseif scoutResult == EMBRScoutResultFailedDisguiseHuman then
    print("\228\186\186\227\129\171\229\140\150\227\129\145\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\227\130\185\227\130\171\227\130\166\227\131\136\229\135\186\230\157\165\227\129\170\227\129\132")
    CmdEventClosingMessage(TextTable.Disguise)
    CloseMessage()
  else
    if MonsterLocation ~= nil then
      CmdFadeOut(EFadingPriorityTopMost, 0.5)
      SetNicolaEnableDOF(false)
      ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance)
      SetNpcLocation(ActorId, MonsterLocation)
      SetPartyOpacity(2, 0)
      SetPartyOpacity(3, 0)
      SetPartyOpacity(4, 0)
      TurnParty(PlayerLook.Chara, PlayerLook.Turn)
      if PlayerLocation ~= nil then
        SetPlayerLocation(PlayerLocation)
      end
      Wait(0.5)
      CmdFadeIn(EFadingPriorityTopMost, 0.5)
      Wait(0.2)
    end
    CmdSpawnMangaIcon(ActorId, "FIELD_EFX2D_SURPRISE")
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    PlaySEEvent("EVESE_MBR_ESCAPE")
    DestroyMBRMonster(ActorId)
    Wait(1)
    if MonsterLocation ~= nil then
      SetPartyOpacity(2, 1)
      SetPartyOpacity(3, 1)
      SetPartyOpacity(4, 1)
      PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WARP)
      ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
      SetNicolaEnableDOF(true)
      Wait(0.3)
    end
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    if scoutResult == EMBRScoutResultFailedEscapeSound then
      CmdEventClosingMessage("NPC_Talk_Common_MBR_Escape_Sound")
    elseif scoutResult == EMBRScoutResultFailedEscapeSmell then
      CmdEventClosingMessage("NPC_Talk_Common_MBR_Escape_Smell")
    elseif scoutResult == EMBRScoutResultFailedEscapeLook then
      CmdEventClosingMessage("NPC_Talk_Common_MBR_Escape_Look")
    end
  end
end

function MonsterScoutScriptCamera(MonsterScoutId, TextTable, ActorId, PlayerLocation, CameraParam, PlayerLook, targetActorId, MonsterLocation, CameraSets)
  local scoutResult = GetScoutMonsterVigilanceResult(MonsterScoutId)
  if scoutResult == EMBRScoutResultFailed then
    return
  end
  if scoutResult == EMBRScoutResultSuccess then
    print("\230\136\144\229\138\159\227\129\151\227\129\166\227\130\139\230\153\130")
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    SetNicolaEnableDOF(false)
    if CameraSets then
      ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance, {
        Yaw = 0,
        Pitch = -30,
        Roll = 0
      })
    else
      ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance, {
        Yaw = 0,
        Pitch = -15,
        Roll = 0
      })
    end
    if MonsterLocation ~= nil then
      SetNpcLocation(ActorId, MonsterLocation)
    end
    SetPartyOpacity(2, 0)
    SetPartyOpacity(3, 0)
    SetPartyOpacity(4, 0)
    TurnParty(PlayerLook.Chara, PlayerLook.Turn)
    if PlayerLocation ~= nil then
      SetPlayerLocation(PlayerLocation)
    end
    Wait(0.5)
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    AddScoutMonster(MonsterScoutId)
    SetTagWordMonsterSpeciesFromScoutId(MonsterScoutId)
    CmdMessage(TextTable.Success1)
    CloseMessage()
    CmdMessage(TextTable.Success2)
    CloseMessage()
    CmdMessage(TextTable.Success3)
    CloseMessage()
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    PlaySEEvent("EVESE_MBR_STAIRWAY")
    DestroyMBRMonster(ActorId)
    SetPartyOpacity(2, 1)
    SetPartyOpacity(3, 1)
    SetPartyOpacity(4, 1)
    PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WARP)
    ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
    SetNicolaEnableDOF(true)
    Wait(1)
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    CmdCallMBRScoutSuccessUI(MonsterScoutId)
  elseif scoutResult == EMBRScoutResultSuccessDisguiseHuman then
    print("\229\140\150\227\129\145\227\129\166\227\129\132\227\129\166\230\136\144\229\138\159\227\129\151\227\129\166\227\130\139\230\153\130")
    CmdMessage(TextTable.Disguise)
    CloseMessage()
    CmdMessage(TextTable.RaMirror1)
    Wait(0.5)
    CloseMessage()
    Wait(1)
    PlaySEEvent("EVESE_SAMANOSA_RA_MIRROR")
    CmdFadeOut(EFadingPriorityWhiteTopMost, 0.5)
    SetNicolaEnableDOF(false)
    ChangeActorDisguiseHumanToMonster(ActorId)
    if CameraSets then
      ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance, {
        Yaw = 0,
        Pitch = -30,
        Roll = 0
      })
    else
      ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance, {
        Yaw = 0,
        Pitch = -15,
        Roll = 0
      })
    end
    if MonsterLocation ~= nil then
      SetNpcLocation(ActorId, MonsterLocation)
    end
    SetPartyOpacity(2, 0)
    SetPartyOpacity(3, 0)
    SetPartyOpacity(4, 0)
    TurnParty(PlayerLook.Chara, PlayerLook.Turn)
    if PlayerLocation ~= nil then
      SetPlayerLocation(PlayerLocation)
    end
    Wait(0.5)
    CmdFadeIn(EFadingPriorityWhiteTopMost, 0.5)
    AddScoutMonster(MonsterScoutId)
    SetTagWordMonsterSpeciesFromScoutId(MonsterScoutId)
    CmdMessage(TextTable.RaMirror2)
    CloseMessage()
    CmdMessage(TextTable.Success1)
    CloseMessage()
    CmdMessage(TextTable.Success2)
    CloseMessage()
    CmdMessage(TextTable.Success3)
    CloseMessage()
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    PlaySEEvent("EVESE_MBR_STAIRWAY")
    DestroyMBRMonster(ActorId)
    Wait(1)
    SetPartyOpacity(2, 1)
    SetPartyOpacity(3, 1)
    SetPartyOpacity(4, 1)
    PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WARP)
    ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
    SetNicolaEnableDOF(true)
    Wait(1)
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    CmdCallMBRScoutSuccessUI(MonsterScoutId)
  elseif scoutResult == EMBRScoutResultFailedDisguiseHuman then
    print("\228\186\186\227\129\171\229\140\150\227\129\145\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\227\130\185\227\130\171\227\130\166\227\131\136\229\135\186\230\157\165\227\129\170\227\129\132")
    CmdEventClosingMessage(TextTable.Disguise)
    CloseMessage()
  else
    if MonsterLocation ~= nil then
      CmdFadeOut(EFadingPriorityTopMost, 0.5)
      SetNicolaEnableDOF(false)
      if CameraSets then
        ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance, {
          Yaw = 0,
          Pitch = -30,
          Roll = 0
        })
      else
        ChangeStageCameraToGlobalPoint(CameraParam.X, CameraParam.Y, CameraParam.Z, CAMERA_BLEND_EASE_IN_OUT, 0, 0, CameraParam.Distance, {
          Yaw = 0,
          Pitch = -15,
          Roll = 0
        })
      end
      SetNpcLocation(ActorId, MonsterLocation)
      SetPartyOpacity(2, 0)
      SetPartyOpacity(3, 0)
      SetPartyOpacity(4, 0)
      TurnParty(PlayerLook.Chara, PlayerLook.Turn)
      if PlayerLocation ~= nil then
        SetPlayerLocation(PlayerLocation)
      end
      Wait(0.5)
      CmdFadeIn(EFadingPriorityTopMost, 0.5)
      Wait(0.2)
    end
    CmdSpawnMangaIcon(ActorId, "FIELD_EFX2D_SURPRISE")
    CmdFadeOut(EFadingPriorityTopMost, 0.5)
    PlaySEEvent("EVESE_MBR_ESCAPE")
    DestroyMBRMonster(ActorId)
    Wait(1)
    if MonsterLocation ~= nil then
      SetPartyOpacity(2, 1)
      SetPartyOpacity(3, 1)
      SetPartyOpacity(4, 1)
      PartyMemberAlignment(ALIGNMENT_TOGETHER, ALIGNMENT_MOVE_WARP)
      ChangeTraceCamera(CAMERA_BLEND_LINEAR, 0, 0)
      SetNicolaEnableDOF(true)
      Wait(0.3)
    end
    CmdFadeIn(EFadingPriorityTopMost, 0.5)
    if scoutResult == EMBRScoutResultFailedEscapeSound then
      CmdEventClosingMessage("NPC_Talk_Common_MBR_Escape_Sound")
    elseif scoutResult == EMBRScoutResultFailedEscapeSmell then
      CmdEventClosingMessage("NPC_Talk_Common_MBR_Escape_Smell")
    elseif scoutResult == EMBRScoutResultFailedEscapeLook then
      CmdEventClosingMessage("NPC_Talk_Common_MBR_Escape_Look")
    end
  end
end

function MBRrandomCheers(SEnumber)
  local SEnumber = math.random(3)
  print(SEnumber)
  local playbackId
  if SEnumber == 1 then
    playbackId = PlaySEEvent("EVESE_MBR_CHEERS_2")
  elseif SEnumber == 2 then
    playbackId = PlaySEEvent("EVESE_MBR_CHEERS_3")
  elseif SEnumber == 3 then
    playbackId = PlaySEEvent("EVESE_MBR_CHEERS_4")
  end
end

function CmdSearchObjWellChangeMap(NextMapId, NextPlayerStartTag)
  RequestLoading(NextMapId)
  CmdMessage("NPC_Talk_Common_SEARCHOBJECT_Well_1")
  CloseMessage()
  ChangeMap(NextMapId, NextPlayerStartTag, ORIENTATION_DOWN)
end
