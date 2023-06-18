// Retro Game Challenge 2
// #ID = 3110

// Credits:
// Kaiserlucas - RAM Digging, Achievement Concepts

// #region Memory Symbols -----------------------------------------------------------------------------------------------------------------
_MEM_GAME_ENTITY = 0x05ACE0
_MEM_CHLNG_WIZMAN1_STATUS = 0x05AD30
_MEM_CURRGAME = 0x05D814
_MEM_ISPLAYINGGAME = 0x20A9F4
_MEM_TRAININGLEVEL = 0x30038C
_MEM_TRAININGISDEAD = 0x300344
_MEM_TRAININGMISSES = 0x30045C
_MEM_TRAININGSTREAK = 0x300474
_MEM_TRAININGSCORE = 0x3008B4
_MEM_WIZSCORE = 0x300254
_MEM_WIZCURRLIVES = 0x300260
_MEM_WIZONTITLE = 0x300280
_MEM_WIZGAMESTATE = 0x300290
_MEM_WIZSKIPSTATE = 0x300294
_MEM_WIZCURRSTAGE = 0x300298
_MEM_WIZMAZELOADED = 0x300348
_MEM_WIZMETADATA_PTR = 0x33A208
_MEM_WIZ_LWANDS_0 = 0x3001E8
_MEM_WIZ_LWANDS_1 = 0x3001E9
_MEM_WIZ_LWANDS_2 = 0x3001EA
_MEM_WIZ_LWANDS_3 = 0x3001EB
_MEM_WIZ_LWANDS_4 = 0x3001EC
_MEM_WIZ_LWANDS_5 = 0x3001ED
_MEM_WIZ_LWANDS_6 = 0x3001EE
_MEM_WIZ_LWANDS_7 = 0x3001EF
_MEM_WIZ_LWANDS_8 = 0x3001F0
_MEM_WIZ_LWANDS_9 = 0x3001F1
_MEM_WIZ_LWANDS_10 = 0x3001F2
_MEM_WIZ_LWANDS_11 = 0x3001F3
// #endregion

// #region Constants ----------------------------------------------------------------------------------------------------------------------
TRUE = 1
FALSE = 0

CHALLENGE_UNFINISHED = 0x00
CHALLENGE_CLEARED = 0x01
CHALLENGE_SKIPPED = 0x02

WIZMAN_LWANDS = {
    1: [bit0(_MEM_WIZ_LWANDS_0), bit1(_MEM_WIZ_LWANDS_0), bit2(_MEM_WIZ_LWANDS_0)],
    2: [bit3(_MEM_WIZ_LWANDS_0), bit4(_MEM_WIZ_LWANDS_0), bit5(_MEM_WIZ_LWANDS_0)],
    3: [bit6(_MEM_WIZ_LWANDS_0), bit7(_MEM_WIZ_LWANDS_0), bit0(_MEM_WIZ_LWANDS_1)],
    4: [bit1(_MEM_WIZ_LWANDS_1), bit2(_MEM_WIZ_LWANDS_1), bit3(_MEM_WIZ_LWANDS_1)],
    5: [bit4(_MEM_WIZ_LWANDS_1), bit5(_MEM_WIZ_LWANDS_1), bit6(_MEM_WIZ_LWANDS_1)],
    6: [bit7(_MEM_WIZ_LWANDS_1), bit0(_MEM_WIZ_LWANDS_2), bit1(_MEM_WIZ_LWANDS_2)],
    7: [bit2(_MEM_WIZ_LWANDS_2), bit3(_MEM_WIZ_LWANDS_2), bit4(_MEM_WIZ_LWANDS_2)],
    8: [bit5(_MEM_WIZ_LWANDS_2), bit6(_MEM_WIZ_LWANDS_2), bit7(_MEM_WIZ_LWANDS_2)],
    9: [bit0(_MEM_WIZ_LWANDS_3), bit1(_MEM_WIZ_LWANDS_3), bit2(_MEM_WIZ_LWANDS_3)],
    10: [bit3(_MEM_WIZ_LWANDS_3), bit4(_MEM_WIZ_LWANDS_3), bit5(_MEM_WIZ_LWANDS_3)],
    11: [bit6(_MEM_WIZ_LWANDS_3), bit7(_MEM_WIZ_LWANDS_3), bit0(_MEM_WIZ_LWANDS_4)],
    12: [bit1(_MEM_WIZ_LWANDS_4), bit2(_MEM_WIZ_LWANDS_4), bit3(_MEM_WIZ_LWANDS_4)],
    13: [bit4(_MEM_WIZ_LWANDS_4), bit5(_MEM_WIZ_LWANDS_4), bit6(_MEM_WIZ_LWANDS_4)],
    14: [bit7(_MEM_WIZ_LWANDS_4), bit0(_MEM_WIZ_LWANDS_5), bit1(_MEM_WIZ_LWANDS_5)],
    15: [bit2(_MEM_WIZ_LWANDS_5), bit3(_MEM_WIZ_LWANDS_5), bit4(_MEM_WIZ_LWANDS_5)],
    16: [bit5(_MEM_WIZ_LWANDS_5), bit6(_MEM_WIZ_LWANDS_5), bit7(_MEM_WIZ_LWANDS_5)],
    17: [bit0(_MEM_WIZ_LWANDS_6), bit1(_MEM_WIZ_LWANDS_6), bit2(_MEM_WIZ_LWANDS_6)],
    18: [bit3(_MEM_WIZ_LWANDS_6), bit4(_MEM_WIZ_LWANDS_6), bit5(_MEM_WIZ_LWANDS_6)],
    19: [bit6(_MEM_WIZ_LWANDS_6), bit7(_MEM_WIZ_LWANDS_6), bit0(_MEM_WIZ_LWANDS_7)],
    20: [bit1(_MEM_WIZ_LWANDS_7), bit2(_MEM_WIZ_LWANDS_7), bit3(_MEM_WIZ_LWANDS_7)],
    21: [bit4(_MEM_WIZ_LWANDS_7), bit5(_MEM_WIZ_LWANDS_7), bit6(_MEM_WIZ_LWANDS_7)],
    22: [bit7(_MEM_WIZ_LWANDS_7), bit0(_MEM_WIZ_LWANDS_8), bit1(_MEM_WIZ_LWANDS_8)],
    23: [bit2(_MEM_WIZ_LWANDS_8), bit3(_MEM_WIZ_LWANDS_8), bit4(_MEM_WIZ_LWANDS_8)],
    24: [bit5(_MEM_WIZ_LWANDS_8), bit6(_MEM_WIZ_LWANDS_8), bit7(_MEM_WIZ_LWANDS_8)],
    25: [bit0(_MEM_WIZ_LWANDS_9), bit1(_MEM_WIZ_LWANDS_9), bit2(_MEM_WIZ_LWANDS_9)],
    26: [bit3(_MEM_WIZ_LWANDS_9), bit4(_MEM_WIZ_LWANDS_9), bit5(_MEM_WIZ_LWANDS_9)],
    27: [bit6(_MEM_WIZ_LWANDS_9), bit7(_MEM_WIZ_LWANDS_9), bit0(_MEM_WIZ_LWANDS_10)],
    28: [bit1(_MEM_WIZ_LWANDS_10), bit2(_MEM_WIZ_LWANDS_10), bit3(_MEM_WIZ_LWANDS_10)],
    29: [bit4(_MEM_WIZ_LWANDS_10), bit5(_MEM_WIZ_LWANDS_10), bit6(_MEM_WIZ_LWANDS_10)],
    30: [bit7(_MEM_WIZ_LWANDS_10), bit0(_MEM_WIZ_LWANDS_11), bit1(_MEM_WIZ_LWANDS_11)],
    31: [bit2(_MEM_WIZ_LWANDS_11), bit3(_MEM_WIZ_LWANDS_11), bit4(_MEM_WIZ_LWANDS_11)],
    32: [bit5(_MEM_WIZ_LWANDS_11), bit6(_MEM_WIZ_LWANDS_11), bit7(_MEM_WIZ_LWANDS_11)]
}
// #endregion

// #region Memory -------------------------------------------------------------------------------------------------------------------------
function CurrentKnownGame() => byte(_MEM_CURRGAME)
GAME_WIZMAN = 0x05

function IsPlayingAnyGame() => byte(_MEM_ISPLAYINGGAME)

function WizManCurrentScore() => dword(_MEM_WIZSCORE)
function WizManCurrentLives() => byte(_MEM_WIZCURRLIVES)
function WizManIsOnTitleScreen() => byte(_MEM_WIZONTITLE)

function WizManFloorSkipState() => byte(_MEM_WIZSKIPSTATE)
WIZMAN_SKIP_MAYBE = 0x04

function WizManGameState() => byte(_MEM_WIZGAMESTATE)
WIZMAN_STATE_VIEWING_TITLE_SCREEN = 0x00
WIZMAN_STATE_ACTIVELY_PLAYING = 0x01
WIZMAN_STATE_FLOOR_SELECT = 0x02
WIZMAN_STATE_GAME_OVER = 0x03
WIZMAN_STATE_FLOOR_SKIP_BREAK = 0x04
WIZMAN_STATE_COFFEE_BREAK = 0x06
WIZMAN_STATE_ENDING_CUTSCENE = 0x07

function WizManCurrentStage() => byte(_MEM_WIZCURRSTAGE)
WIZMAN_STAGE_FLOOR_32 = 0x20

function WizManHasMazeLoaded() => byte(_MEM_WIZMAZELOADED)

WIZMAN_METADATA_PTR_OFFSET_ARE_SKIP_CRYSTALS_AVAILABLE = 0x48
WIZMAN_METADATA_PTR_OFFSET_SKIP_CRYSTALS_COLLECTED = 0x50
function WizManAreFloorSkipCrystalsStillAvailable() => byte(tbyte(_MEM_WIZMETADATA_PTR) + WIZMAN_METADATA_PTR_OFFSET_ARE_SKIP_CRYSTALS_AVAILABLE)
function WizManFloorSkipCrystalsCollected() => byte(tbyte(_MEM_WIZMETADATA_PTR) + WIZMAN_METADATA_PTR_OFFSET_SKIP_CRYSTALS_COLLECTED)

function WizManLightWandsCollectedForFloor(targetFloor = 1) {
    memoryAddress = 0x000000


}

function WizManLightWandsCollectedForFloor(targetFloor = 1) {
    return sum_of(WIZMAN_LWANDS[targetFloor], f => f)
}

function TrainingCurrentLevel() => byte(_MEM_TRAININGLEVEL)
function TrainingIsPlayerDead() => byte(_MEM_TRAININGISDEAD)
function TrainingCurrentMisses() => byte(_MEM_TRAININGMISSES)
function TrainingCurrentStreak() => byte(_MEM_TRAININGSTREAK)
function TrainingCurrentScore() => dword(_MEM_TRAININGSCORE)
// #endregion

// #region Utils --------------------------------------------------------------------------------------------------------------------------
// @param targetGame {0x05: GAME_WIZMAN} - The game to retrieve the progress data structure for
function GameProgressDataStructurePointer(targetGame = 0x05) {
    GamePointer = targetGame * 0x10
    return _MEM_GAME_ENTITY + GamePointer
}

// @param targetGame {0x05: GAME_WIZMAN} - The game to retrieve the progress data structure for
// @param challengeNumber {1, 2, 3, or 4} - Which challenge are we retrieving progress for
function ChallengeProgress(targetGame = 0x05, challengeNumber = 1) {
    challengeOffset = challengeNumber - 1
    return byte(GameProgressDataStructurePointer(targetGame) + challengeOffset)
}

function UsedWizManCheats() {
    usedFloorSelect = 
        WizManGameState() == WIZMAN_STATE_ACTIVELY_PLAYING 
        && prev(WizManGameState()) == WIZMAN_STATE_FLOOR_SELECT

    usedContinue =
        WizManGameState() == WIZMAN_STATE_ACTIVELY_PLAYING
        && prev(WizManGameState()) == WIZMAN_STATE_GAME_OVER

    return usedFloorSelect || usedContinue
}

function OnceStartedWizMan() {
    return 
        once(
            CurrentKnownGame() == GAME_WIZMAN
            && WizManIsOnTitleScreen() == FALSE
            && (
                prev(WizManGameState()) == WIZMAN_STATE_VIEWING_TITLE_SCREEN
                || prev(WizManGameState()) == WIZMAN_STATE_FLOOR_SELECT
            )
            && WizManGameState() == WIZMAN_STATE_ACTIVELY_PLAYING
        )
        && once(WizManHasMazeLoaded() == TRUE && prev(WizManHasMazeLoaded()) == FALSE)
}

function NeverEndedWizMan() {
    return 
        never(WizManGameState() == WIZMAN_STATE_GAME_OVER)
        && never(WizManGameState() == WIZMAN_STATE_VIEWING_TITLE_SCREEN)
        && never(IsPlayingAnyGame() == FALSE && prev(IsPlayingAnyGame()) == TRUE)
}

function HasFinishedFourWizManChallenges() {
    return
        ChallengeProgress(GAME_WIZMAN, 1) > 0
        && ChallengeProgress(GAME_WIZMAN, 2) > 0
        && ChallengeProgress(GAME_WIZMAN, 3) > 0
        && ChallengeProgress(GAME_WIZMAN, 4) > 0
}

function BeatWizMan() {
    return
        WizManGameState() == WIZMAN_STATE_ENDING_CUTSCENE
        && WizManCurrentStage() == 0x21
}

function StartedTrainingGame() {
    return TrainingCurrentLevel() == 1 && prev(TrainingCurrentLevel()) == 0x0E
}

function PauseIfNotWizMan() {
    return disable_when(
        CurrentKnownGame() != GAME_WIZMAN,
        OnceStartedWizMan()
    )
}

function PauseIfNotTrainingGame() {
    return disable_when(
        TrainingCurrentLevel() == 0 || (TrainingCurrentLevel() == 0x0E && prev(TrainingCurrentLevel()) != 0x0D),
        StartedTrainingGame()
    )

    return TrainingCurrentLevel() == 1 && prev(TrainingCurrentLevel() == 0)
}
// #endregion

// #region Achievement Functions ----------------------------------------------------------------------------------------------------------
// @param targetGame {0x05: GAME_WIZMAN} - What game this story challenge belongs to
// @param challengeNumber {1, 2, 3, or 4} - Which challenge the achievement will unlock for
function ChallengeCompleted(targetGame = 0x05, challengeNumber = 1) {
    start = 
        CurrentKnownGame() == targetGame
        && once(IsPlayingAnyGame() == TRUE && prev(IsPlayingAnyGame()) == FALSE)

    cancel = never(IsPlayingAnyGame() == FALSE && prev(IsPlayingAnyGame()) == TRUE)
    if (challengeNumber > 1) {
        cancel = cancel && never(ChallengeProgress(targetGame, challengeNumber - 1) == 0)
    }

    return
        start
        && cancel
        && trigger_when(
            ChallengeProgress(targetGame, challengeNumber) == CHALLENGE_CLEARED
            && prev(ChallengeProgress(targetGame, challengeNumber)) == CHALLENGE_UNFINISHED
        )
}

function WizManFloorSkipped() {
    start = OnceStartedWizMan()
    cancel = NeverEndedWizMan()

    return
        start
        && cancel
        && PauseIfNotWizMan()
        && WizManFloorSkipCrystalsCollected() >= 1
        && trigger_when(WizManFloorSkipCrystalsCollected() == 4)
}

function WizManCollectedAllSectionWands(startFloor = 1, isFullPlaythrough = false) {
    endFloor = startFloor + 3
    if (startFloor == 1 && isFullPlaythrough == true) {
        endFloor = 32
    }

    skippedWandClause = always_true()
    for index in range(startFloor, endFloor) {
        skippedWandClause = 
            skippedWandClause 
            && never(WizManCurrentStage() == (index + 1) && WizManLightWandsCollectedForFloor(index) < 3)
    }

    triggerWandClause = always_true()
    for index in range(startFloor, endFloor) {
        triggerWandClause =
            triggerWandClause
            && WizManLightWandsCollectedForFloor(index) == 3
    }

    start =
        OnceStartedWizMan()
        && once(WizManLightWandsCollectedForFloor(startFloor) == 1)

    cancel = NeverEndedWizMan() && skippedWandClause

    trigger = trigger_when(WizManCurrentStage() == (endFloor + 1))
    if (startFloor == 1 && isFullPlaythrough == true) {
        allFlags = []
        for index in range(startFloor, endFloor) {
            array_push(allFlags, WIZMAN_LWANDS[index][0])
            array_push(allFlags, WIZMAN_LWANDS[index][1])
            array_push(allFlags, WIZMAN_LWANDS[index][2])
        }

        measuredClause = measured(
            sum_of(allFlags, f => f) == length(allFlags),

            WizManCurrentStage() == 1 
            || (WizManCurrentStage() >= 2 && sum_of(allFlags, f => f) >= (WizManCurrentStage() * 3) - 3)
        )

        trigger = (trigger || measuredClause)
    }

    return
        start
        && cancel
        && trigger
}

function WizManWarpedToEnd() {
    start = OnceStartedWizMan() 

    cancel =
        NeverEndedWizMan()
        && never(
            WizManGameState() == WIZMAN_STATE_ACTIVELY_PLAYING
            && (
                WizManCurrentStage() > prev(WizManCurrentStage()) 
                && WizManFloorSkipState() != WIZMAN_SKIP_MAYBE
            )
        )
        && never(
            WizManGameState() == WIZMAN_STATE_ACTIVELY_PLAYING
            && WizManAreFloorSkipCrystalsStillAvailable() == 0x00
            && prev(WizManAreFloorSkipCrystalsStillAvailable()) == 0x01
        )

    return
        start
        && cancel
        && HasFinishedFourWizManChallenges()
        && WizManCurrentStage() >= 2
        && trigger_when(WizManCurrentStage() == WIZMAN_STAGE_FLOOR_32)
}

function WizManFloorsBeaten(startFloor = 1, endFloor = 4, areCheatsBanned = false, areFloorSkipsBanned = false, primeFloor = 2) {
    start = OnceStartedWizMan() && once(WizManCurrentStage() == startFloor)
    cancel = NeverEndedWizMan()

    areCheatsBannedClause = always_true()
    if (areCheatsBanned == true) {
        areCheatsBannedClause = never(UsedWizManCheats())
    }

    areFloorSkipsBannedClause = always_true()
    if (areFloorSkipsBanned == true) {
        areFloorSkipsBannedClause = never(
            WizManFloorSkipCrystalsCollected() == 4
            && prev(WizManFloorSkipCrystalsCollected()) == 3
        )
    }

    triggerWhenClause = trigger_when(WizManCurrentStage() > endFloor)
    if (startFloor == 1 && endFloor == 32) { // requires game clear?
        triggerWhenClause = 
            HasFinishedFourWizManChallenges()
            && WizManCurrentStage() >= primeFloor 
            && trigger_when(BeatWizMan())
    }

    return
        start
        && cancel
        && areCheatsBannedClause
        && areFloorSkipsBannedClause
        && WizManCurrentStage() >= startFloor
        && WizManCurrentStage() <= (endFloor + 1)
        && triggerWhenClause
}

function WizManEarnedScore(targetScore = 250000) {
    start = OnceStartedWizMan()
    cancel = NeverEndedWizMan()

    return
        start
        && cancel
        && WizManCurrentScore() >= (targetScore / 2)
        && trigger_when(WizManCurrentScore() >= targetScore)
}

function WizManGotExtraLife() {
    start = OnceStartedWizMan()
    cancel = NeverEndedWizMan()

    return
        start
        && cancel
        && WizManCurrentLives() > prev(WizManCurrentLives())
}

// @param targetScore - At what score will this achievement unlock
// @param primingScore - At what score will we show a helper icon on the screen for this achievement
// @param areDeathsBanned - Must this achievement be earned deathlessly?
function TrainingScoreReached(targetScore = 100000, primingScore = 0, areDeathsBanned = false) {
    start = once(TrainingCurrentLevel() == 1)
    cancel = never(TrainingCurrentMisses() == 3)

    areDeathsBannedClause = always_true()
    if (areDeathsBanned == true) {
        areDeathsBannedClause = disable_when(
            TrainingIsPlayerDead() == TRUE && prev(TrainingIsPlayerDead()) == FALSE,
            StartedTrainingGame()
        )
        && never(TrainingCurrentMisses() >= 1)
    }

    return
        start
        && cancel
        && areDeathsBannedClause
        && PauseIfNotTrainingGame()
        && TrainingCurrentScore() >= primingScore
        && trigger_when(TrainingCurrentScore() >= targetScore)
}

function TrainingLevelReached(targetLevel = 5, primingLevel = 1, areDeathsBanned = false) {
    start = once(TrainingCurrentLevel() == 1)
    cancel = never(TrainingCurrentMisses() == 3)

    areDeathsBannedClause = always_true()
    if (areDeathsBanned == true) {
        areDeathsBannedClause = disable_when(
            TrainingIsPlayerDead() == TRUE && prev(TrainingIsPlayerDead()) == FALSE,
            StartedTrainingGame()
        )
        && never(TrainingCurrentMisses() >= 1)
    }

    return
        start
        && cancel
        && areDeathsBannedClause
        && PauseIfNotTrainingGame()
        && TrainingCurrentLevel() >= primingLevel
        && trigger_when(TrainingCurrentLevel() >= targetLevel)
}

function TrainingCaughtHappyMan() {
    start = once(TrainingCurrentStreak() == 0x00 && prev(TrainingCurrentStreak()) == 0x1D)

    FIVE_SECONDS = 240
    cancel = 
        never(TrainingCurrentMisses() > prev(TrainingCurrentMisses()))
        && never(repeated(FIVE_SECONDS, TrainingCurrentStreak() == 0))
        && never(TrainingIsPlayerDead() == TRUE)

    return
        start
        && cancel
        && PauseIfNotTrainingGame()
        && trigger_when(TrainingCurrentScore() == prev(TrainingCurrentScore()) + 7650)
}
// #endregion

// #region Achievements -------------------------------------------------------------------------------------------------------------------
// Debug
achievement("Debug: OnceStartedWizMan()", "", 0, OnceStartedWizMan())
achievement("Debug: UsedWizManCheats()", "", 0, UsedWizManCheats())
achievement("Debug: BeatWizMan()", "", 0, BeatWizMan())

// Go! Edge Jump Max
achievement("Training Senior", "Training Senior", 5, TrainingScoreReached(2010, primingScore = 0))
achievement("Training Assistant Manager", "Training Assistant Manager", 5, TrainingScoreReached(5010, primingScore = 2010))
achievement("Training Section Chief", "Training Section Chief", 5, TrainingScoreReached(10010, primingScore = 5010))
achievement("Training Manager", "Training Manager", 5, TrainingScoreReached(20010, primingScore = 10010))
achievement("Training Director", "Training Director", 5, TrainingScoreReached(40010, primingScore = 20010))
achievement("Training Executive", "Training Executive", 5, TrainingScoreReached(50010, primingScore = 40010))
achievement("Training Executive Manager", "Training Executive Manager", 5, TrainingScoreReached(75010, primingScore = 50010))
achievement("Training President", "Training President", 5, TrainingScoreReached(100010, primingScore = 75010))
achievement("Training Deathless Level 10", "Training Deathless Level 10", 5, TrainingLevelReached(10, primingLevel = 5, areDeathsBanned = true))
achievement("Training Deathless Level 40", "Training Deathless Level 40", 5, TrainingLevelReached(40, primingLevel = 10, areDeathsBanned = true))
achievement("Training Caught Happy Man", "Training Caught Happy Man", 5, TrainingCaughtHappyMan())

// Wiz-Man
achievement("Wiz-Man One", "", 5, ChallengeCompleted(GAME_WIZMAN, 1))
achievement("Wiz-Man Two", "", 5, ChallengeCompleted(GAME_WIZMAN, 2))
achievement("Wiz-Man Three", "", 5, ChallengeCompleted(GAME_WIZMAN, 3))
achievement("Wiz-Man Four", "", 5, ChallengeCompleted(GAME_WIZMAN, 4))
achievement("Wiz-Man Floor Skip", "", 5, WizManFloorSkipped())
achievement("Wiz-Man Beat No Cheats", "", 5, WizManFloorsBeaten(startFloor = 1, endFloor = 32, primeFloor = 29, areCheatsBanned = true))
achievement("Wiz-Man Beat No Cheats or Skips", "", 5, WizManFloorsBeaten(startFloor = 1, endFloor = 32, primeFloor = 2, areCheatsBanned = true, areFloorSkipsBanned = true))
achievement("Wiz-Man Warped to End", "Warp-Man", 5, WizManWarpedToEnd())
achievement("Wiz-Man Cleared Section 1", "", 5, WizManFloorsBeaten(startFloor = 1, endFloor = 4, areFloorSkipsBanned = true))
achievement("Wiz-Man Cleared Section 2", "", 5, WizManFloorsBeaten(startFloor = 5, endFloor = 8, areFloorSkipsBanned = true))
achievement("Wiz-Man Cleared Section 3", "", 5, WizManFloorsBeaten(startFloor = 9, endFloor = 12, areFloorSkipsBanned = true))
achievement("Wiz-Man Cleared Section 4", "", 5, WizManFloorsBeaten(startFloor = 13, endFloor = 16, areFloorSkipsBanned = true))
achievement("Wiz-Man Cleared Section 5", "", 5, WizManFloorsBeaten(startFloor = 17, endFloor = 20, areFloorSkipsBanned = true))
achievement("Wiz-Man Cleared Section 6", "", 5, WizManFloorsBeaten(startFloor = 21, endFloor = 24, areFloorSkipsBanned = true))
achievement("Wiz-Man Cleared Section 7", "", 5, WizManFloorsBeaten(startFloor = 25, endFloor = 28, areFloorSkipsBanned = true))
achievement("Wiz-Man Cleared Section 8", "", 5, WizManFloorsBeaten(startFloor = 29, endFloor = 32, areFloorSkipsBanned = true))
achievement("Wiz-Man All Section 1 Light Wands", "", 5, WizManCollectedAllSectionWands(startFloor = 1))
achievement("Wiz-Man All Section 2 Light Wands", "", 5, WizManCollectedAllSectionWands(startFloor = 5))
achievement("Wiz-Man All Section 3 Light Wands", "", 5, WizManCollectedAllSectionWands(startFloor = 9))
achievement("Wiz-Man All Section 4 Light Wands", "", 5, WizManCollectedAllSectionWands(startFloor = 13))
achievement("Wiz-Man All Section 5 Light Wands", "", 5, WizManCollectedAllSectionWands(startFloor = 17))
achievement("Wiz-Man All Section 6 Light Wands", "", 5, WizManCollectedAllSectionWands(startFloor = 21))
achievement("Wiz-Man All Section 7 Light Wands", "", 5, WizManCollectedAllSectionWands(startFloor = 25))
achievement("Wiz-Man All Section 8 Light Wands", "", 5, WizManCollectedAllSectionWands(startFloor = 29))
achievement("Wiz-Man All Light Wands Clear", "", 5, WizManCollectedAllSectionWands(startFloor = 1, isFullPlaythrough = true))
achievement("Wiz-Man Extra Life", "", 5, WizManGotExtraLife())
achievement("Wiz-Man 125,000 Points", "", 5, WizManEarnedScore(125000))
achievement("Wiz-Man 250,000 Points", "", 5, WizManEarnedScore(250000))
achievement("Wiz-Man 500,000 Points", "", 5, WizManEarnedScore(500000))
achievement("Wiz-Man 1,000,000 Points", "", 5, WizManEarnedScore(1000000))
// #endregion

// #region Leaderboards -------------------------------------------------------------------------------------------------------------------
leaderboard(
    "Wiz-Man High Score",
    "Get the highest score you can!",

    start =
        CurrentKnownGame() == GAME_WIZMAN
        && WizManIsOnTitleScreen() == FALSE
        && (
            prev(WizManGameState()) == WIZMAN_STATE_VIEWING_TITLE_SCREEN
            || prev(WizManGameState()) == WIZMAN_STATE_FLOOR_SELECT
        )
        && WizManGameState() == WIZMAN_STATE_ACTIVELY_PLAYING,

    cancel = WizManGameState() == WIZMAN_STATE_VIEWING_TITLE_SCREEN,

    submit =
        WizManGameState() == WIZMAN_STATE_GAME_OVER
        || (IsPlayingAnyGame() == FALSE && prev(IsPlayingAnyGame()) == TRUE)
        || (WizManGameState() == WIZMAN_STATE_ENDING_CUTSCENE && WizManCurrentStage() == 0x21),

    value = WizManCurrentScore()
)
// #endregion

// #region Rich Presence ------------------------------------------------------------------------------------------------------------------
// #endregion
