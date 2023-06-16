// Retro Game Challenge 2
// #ID = 3110

// Credits:
// Kaiserlucas - RAM Digging, Achievement Concepts

// #region Memory Symbols -----------------------------------------------------------------------------------------------------------------
_MEM_GAME_ENTITY = 0x05ACE0
_MEM_CHLNG_WIZMAN1_STATUS = 0x05AD30
_MEM_CURRGAME = 0x05D814
_MEM_TRAININGLEVEL = 0x30038C
_MEM_TRAININGISDEAD = 0x300344
_MEM_TRAININGMISSES = 0x30045C
_MEM_TRAININGSTREAK = 0x300474
_MEM_TRAININGSCORE = 0x3008B4
_MEM_WIZSCORE = 0x300254
_MEM_WIZONTITLE = 0x300280
_MEM_WIZGAMESTATE = 0x300290
_MEM_WIZSKIPSTATE = 0x300294
_MEM_WIZCURRSTAGE = 0x300298
_MEM_WIZMAZELOADED = 0x300348
_MEM_WIZMETADATA_PTR = 0x33A208
// #endregion

// #region Constants ----------------------------------------------------------------------------------------------------------------------
TRUE = 1
FALSE = 0

CHALLENGE_UNFINISHED = 0x00
CHALLENGE_CLEARED = 0x01
CHALLENGE_SKIPPED = 0x02
// #endregion

// #region Memory -------------------------------------------------------------------------------------------------------------------------
function CurrentKnownGame() => byte(_MEM_CURRGAME)
GAME_WIZMAN = 0x05

function WizManCurrentScore() => dword(_MEM_WIZSCORE)
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
    return
        CurrentKnownGame() == targetGame
        && trigger_when(
            ChallengeProgress(targetGame, 1) == CHALLENGE_CLEARED
            && prev(ChallengeProgress(targetGame, 1)) == CHALLENGE_UNFINISHED
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

function WizManWarpedToEnd() {
    start = 
        OnceStartedWizMan() 
        && once(WizManCurrentStage() == 1 && WizManFloorSkipCrystalsCollected() == 1)

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
        && trigger_when(WizManCurrentStage() == WIZMAN_STAGE_FLOOR_32)
}

function WizManBeaten(areCheatsBanned = false, areFloorSkipsBanned = false) {
    start = OnceStartedWizMan()
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

    return
        start
        && cancel
        && areCheatsBannedClause
        && areFloorSkipsBannedClause
        && WizManCurrentStage() >= WIZMAN_STAGE_FLOOR_32
        && trigger_when(BeatWizMan())
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
achievement("Wiz-Man Beat No Cheats", "", 5, WizManBeaten(areCheatsBanned = true))
achievement("Wiz-Man Beat No Cheats or Skips", "", 5, WizManBeaten(areCheatsBanned = true, areFloorSkipsBanned = true))
achievement("Wiz-Man Warped to End", "", 5, WizManWarpedToEnd())
// #endregion

// #region Leaderboards -------------------------------------------------------------------------------------------------------------------
// #endregion

// #region Rich Presence ------------------------------------------------------------------------------------------------------------------
// #endregion
