// Pac-Man (speedup)
// #ID = 24885

// #region Memory Symbols -----------------------------------------------------------------------------------------------------------------
_MEM_GHOSTSEATEN       = 0x05D0
_MEM_FRUITSPAWNED      = 0x05D3
_MEM_GAMESTATE         = 0x0600
_MEM_EXTENDEDGAMESTATE = 0x0604
_MEM_CURRSTAGE         = 0x0613
_MEM_CURRLIVESLEFT     = 0x0614
_MEM_REQUIRESMONEY     = 0x066B
_MEM_CREDITS           = 0x066E
_MEM_SETTINGLIVES      = 0x066F
_MEM_ISTWOPLAYER       = 0x0670
_MEM_P1SCORE0000XX     = 0x0680
_MEM_P1SCORE00XX00     = 0x0681
_MEM_P1SCOREXX0000     = 0x0682
_MEM_CURRSOUND         = 0x06BC
_MEM_ISMUSICPLAYING    = 0x06DC
// #endregion

// #region Memory -------------------------------------------------------------------------------------------------------------------------
function GhostsEaten() => byte(_MEM_GHOSTSEATEN)
function FruitSpawned() => byte(_MEM_FRUITSPAWNED)

function GameState() => byte(_MEM_GAMESTATE)
GAME_STATE_RUG_PATTERN = 0x00
GAME_STATE_ATTRACT_MODE = 0x01
GAME_STATE_COINED_UP = 0x02
GAME_STATE_PLAYING = 0x03

function ExtendedGameState() => byte(_MEM_EXTENDEDGAMESTATE)
EXTENDED_GAME_STATE_ACTIVELY_PLAYING = 0x03
EXTENDED_GAME_STATE_GAME_OVER = 0x07
EXTENDED_GAME_STATE_STAGE_DONE = 0x0D
EXTENDED_GAME_STATE_COFFEE_BREAK = 0x20
EXTENDED_GAME_STATE_READY_TEXT = 0x24

function CurrentStage() => byte(_MEM_CURRSTAGE)
function CurrentRemainingLives() => byte(_MEM_CURRLIVESLEFT)
function CurrentCredits() => byte(_MEM_CREDITS)
function SettingLives() => byte(_MEM_SETTINGLIVES)
function IsTwoPlayer() => byte(_MEM_ISTWOPLAYER)
function DoesGameRequireMoney() => byte(_MEM_REQUIRESMONEY)
function PlayerOneScore() => bcd(tbyte(_MEM_P1SCORE0000XX))

function CurrentSound() => byte(_MEM_CURRSOUND)
CURRENT_SOUND_FRUIT_EATEN = 0x04
CURRENT_SOUND_GHOST_EATEN_A = 0x08
CURRENT_SOUND_GHOST_EATEN_B = 0x09

function IsMusicPlaying() => byte(_MEM_ISMUSICPLAYING)
// #endregion

// #region Constants ----------------------------------------------------------------------------------------------------------------------
TRUE = 1
FALSE = 0
// #endregion

// #region Utils --------------------------------------------------------------------------------------------------------------------------
function PlayerOneScoreX00000() => high4(_MEM_P1SCOREXX0000)
function PlayerOneScore0X0000() => low4(_MEM_P1SCOREXX0000)
function PlayerOneScore00X000() => high4(_MEM_P1SCORE00XX00)
function PlayerOneScore000X00() => low4(_MEM_P1SCORE00XX00)
function PlayerOneScore0000X0() => high4(_MEM_P1SCORE0000XX)
function PlayerOneScore00000X() => low4(_MEM_P1SCORE0000XX)

function PlayerOneScoreXXX000() {
    return (
        PlayerOneScoreX00000() * 100000
        + PlayerOneScore0X0000() * 10000
        + PlayerOneScore00X000() * 1000
    ) / 1000
}

function PlayerOneScore000XXX() {
    return (
        PlayerOneScore000X00() * 100
        + PlayerOneScore0000X0() * 10
        + PlayerOneScore00000X()
    )
}

function OnceStartedGame() {
    return 
        once(IsMusicPlaying() == TRUE && prev(IsMusicPlaying()) == FALSE)
        && never(SettingLives() > 3)
        && never(IsTwoPlayer() == TRUE)
}

function ResetIfEndedGame() {
    return never(CurrentRemainingLives() == 0)
}
// #endregion

// #region Leaderboards -------------------------------------------------------------------------------------------------------------------
leaderboard(
    "High Score",
    "Default settings (3 lives, single player)",
    OnceStartedGame(),
    always_false(),
    CurrentRemainingLives() == 0,
    PlayerOneScore()
)

leaderboard(
    "First Life",
    "Highest score on your very first Pac-Man",
    OnceStartedGame(),
    always_false(),
    CurrentRemainingLives() < prev(CurrentRemainingLives()),
    PlayerOneScore()
)
// #endregion

// #region Rich Presence ------------------------------------------------------------------------------------------------------------------
livesLabels = {
    0x01: "life"
}

stageLabels = {
    0x00: "Cherry",
    0x01: "Strawberry",
    0x02: "1st Peach",
    0x03: "2nd Peach",
    0x04: "1st Apple",
    0x05: "2nd Apple",
    0x06: "1st Grape",
    0x07: "2nd Grape",
    0x08: "1st Galboss",
    0x09: "2nd Galboss",
    0x0A: "1st Bell", 0x0B: "2nd Bell",

    0x0C: "1st Key", 0x0D: "2nd Key", 0x0E: "3rd Key", 0x0F: "4th Key", 0x10: "5th Key", 0x11: "6th Key",
    0x12: "7th Key", 0x13: "8th Key", 0x14: "9th Key", 0x15: "10th Key", 0x16: "11th Key", 0x17: "12th Key", 0x18: "13th Key", 0x19: "14th Key",
    0x1A: "15th Key", 0x1B: "16th Key", 0x1C: "17th Key", 0x1D: "18th Key", 0x1E: "19th Key", 0x1F: "20th Key", 0x20: "21st Key", 0x21: "22nd Key",
    0x22: "23rd Key", 0x23: "24th Key", 0x24: "25th Key", 0x25: "26th Key", 0x26: "27th Key", 0x27: "28th Key", 0x28: "29th Key", 0x29: "30th Key",
    0x2A: "31st Key", 0x2B: "32nd Key", 0x2C: "33rd Key", 0x2D: "34th Key", 0x2E: "35th Key", 0x2F: "36th Key", 0x30: "37th Key", 0x31: "38th Key",
    0x32: "39th Key", 0x33: "40th Key", 0x34: "41st Key", 0x35: "42nd Key", 0x36: "43rd Key", 0x37: "44th Key", 0x38: "45th Key", 0x39: "46th Key",
    0x3A: "47th Key", 0x3B: "48th Key", 0x3C: "49th Key", 0x3D: "50th Key", 0x3E: "51st Key", 0x3F: "52nd Key", 0x40: "53rd Key", 0x41: "54th Key",
    0x42: "55th Key", 0x43: "56th Key", 0x44: "57th Key", 0x45: "58th Key", 0x46: "59th Key", 0x47: "60th Key", 0x48: "61st Key", 0x49: "62nd Key", 
    0x4A: "63rd Key", 0x4B: "64th Key", 0x4C: "65th Key", 0x4D: "66th Key", 0x4E: "67th Key", 0x4F: "68th Key", 0x50: "69th Key", 0x51: "70th Key",
    0x52: "71st Key", 0x53: "72nd Key", 0x54: "73rd Key", 0x55: "74th Key", 0x56: "75th Key", 0x57: "76th Key", 0x58: "77th Key", 0x59: "78th Key",
    0x5A: "79th Key", 0x5B: "80th Key", 0x5C: "81st Key", 0x5D: "82nd Key", 0x5E: "83rd Key", 0x5F: "84th Key", 0x60: "85th Key", 0x61: "86th Key",
    0x62: "87th Key", 0x63: "88th Key", 0x64: "89th Key", 0x65: "90th Key", 0x66: "91st Key", 0x67: "92nd Key", 0x68: "93rd Key", 0x69: "94th Key",
    0x6A: "95th Key", 0x6B: "96th Key", 0x6C: "97th Key", 0x6D: "98th Key", 0x6E: "99th Key", 0x6F: "100th Key", 0x70: "101st Key", 0x71: "102nd Key",
    0x72: "103rd Key", 0x73: "104th Key", 0x74: "105th Key", 0x75: "106th Key", 0x76: "107th Key", 0x77: "108th Key", 0x78: "109th Key", 0x79: "110th Key",
    0x7A: "111th Key", 0x7B: "112th Key", 0x7C: "113th Key", 0x7D: "114th Key", 0x7E: "115th Key", 0x7F: "116th Key", 0x80: "117th Key", 0x81: "118th Key",
    0x82: "119th Key", 0x83: "120th Key", 0x84: "121st Key", 0x85: "122nd Key", 0x86: "123rd Key", 0x87: "124th Key", 0x88: "125th Key", 0x89: "126th Key",
    0x8A: "127th Key", 0x8B: "128th Key", 0x8C: "129th Key", 0x8D: "130th Key", 0x8E: "131st Key", 0x8F: "132nd Key", 0x90: "133rd Key", 0x91: "134th Key",
    0x92: "135th Key", 0x93: "136th Key", 0x94: "137th Key", 0x95: "138th Key", 0x96: "139th Key", 0x97: "140th Key", 0x98: "141st Key", 0x99: "142nd Key",
    0x9A: "143rd Key", 0x9B: "144th Key", 0x9C: "145th Key", 0x9D: "146th Key", 0x9E: "147th Key", 0x9F: "148th Key", 0xA0: "149th Key", 0xA1: "150th Key",
    0xA2: "151st Key", 0xA3: "152nd Key", 0xA4: "153rd Key", 0xA5: "154th Key", 0xA6: "155th Key", 0xA7: "156th Key", 0xA8: "157th Key", 0xA9: "158th Key",
    0xAA: "159th Key", 0xAB: "160th Key", 0xAC: "161st Key", 0xAD: "162nd Key", 0xAE: "163rd Key", 0xAF: "164th Key", 0xB0: "165th Key", 0xB1: "166th Key",
    0xB2: "167th Key", 0xB3: "168th Key", 0xB4: "169th Key", 0xB5: "170th Key", 0xB6: "171st Key", 0xB7: "172nd Key", 0xB8: "173rd Key", 0xB9: "174th Key",
    0xBA: "175th Key", 0xBB: "176th Key", 0xBC: "177th Key", 0xBD: "178th Key", 0xBE: "179th Key", 0xBF: "180th Key", 0xC0: "181st Key", 0xC1: "182nd Key",
    0xC2: "183rd Key", 0xC3: "184th Key", 0xC4: "185th Key", 0xC5: "186th Key", 0xC6: "187th Key", 0xC7: "188th Key", 0xC8: "189th Key", 0xC9: "190th Key",
    0xCA: "191st Key", 0xCB: "192nd Key", 0xCC: "193rd Key", 0xCD: "194th Key", 0xCE: "195th Key", 0xCF: "196th Key", 0xD0: "197th Key", 0xD1: "198th Key",
    0xD2: "199th Key", 0xD3: "200th Key", 0xD4: "201st Key", 0xD5: "202nd Key", 0xD6: "203rd Key", 0xD7: "204th Key", 0xD8: "205th Key", 0xD9: "206th Key",
    0xDA: "207th Key", 0xDB: "208th Key", 0xDC: "209th Key", 0xDD: "210th Key", 0xDE: "211th Key", 0xDF: "212th Key", 0xE0: "213th Key", 0xE1: "214th Key",
    0xE2: "215th Key", 0xE3: "216th Key", 0xE4: "217th Key", 0xE5: "218th Key", 0xE6: "219th Key", 0xE7: "220th Key", 0xE8: "221st Key", 0xE9: "222nd Key",
    0xEA: "223rd Key", 0xEB: "224th Key", 0xEC: "225th Key", 0xED: "226th Key", 0xEE: "227th Key", 0xEF: "228th Key", 0xF0: "229th Key", 0xF1: "230th Key",
    0xF2: "231st Key", 0xF3: "232nd Key", 0xF4: "233rd Key", 0xF5: "234th Key", 0xF6: "235th Key", 0xF7: "236th Key", 0xF8: "237th Key", 0xF9: "238th Key",
    0xFA: "239th Key", 0xFB: "240th Key", 0xFC: "241st Key", 0xFD: "242nd Key", 0xFE: "243rd Key",

    0xFF: "Split Screen"
}

rich_presence_conditional_display(GameState() == GAME_STATE_ATTRACT_MODE, "Attract Mode")
rich_presence_conditional_display(GameState() == GAME_STATE_COINED_UP, "Coined Up")
rich_presence_conditional_display(GameState() == GAME_STATE_PLAYING && CurrentRemainingLives() == 0, "Game Over")

// "3,200,000 points"
rich_presence_conditional_display(
    GameState() == GAME_STATE_PLAYING
    && repeated(3, PlayerOneScoreX00000() == 0 && prev(PlayerOneScoreX00000()) == 9)
    && never(CurrentRemainingLives() == 0),

    "Board {0} [{1}] • {2} {3} • 1,{4}{5}{6},{7} points",
    rich_presence_value("Current Stage", CurrentStage() + 1),
    rich_presence_lookup("Stage Name", CurrentStage(), stageLabels, "Cherry"),
    rich_presence_value("Lives Count", CurrentRemainingLives()),
    rich_presence_lookup("Lives Label", CurrentRemainingLives(), livesLabels, "lives"),
    rich_presence_value("Score X00000", PlayerOneScoreX00000()),
    rich_presence_value("Score 0X0000", PlayerOneScore0X0000()),
    rich_presence_value("Score 00X000", PlayerOneScore00X000()),
    rich_presence_value("Score Hundreths", PlayerOneScore000XXX())
)
// "2,200,000 points"
rich_presence_conditional_display(
    GameState() == GAME_STATE_PLAYING
    && repeated(2, PlayerOneScoreX00000() == 0 && prev(PlayerOneScoreX00000()) == 9)
    && never(CurrentRemainingLives() == 0),

    "Board {0} [{1}] • {2} {3} • 1,{4}{5}{6},{7} points",
    rich_presence_value("Current Stage", CurrentStage() + 1),
    rich_presence_lookup("Stage Name", CurrentStage(), stageLabels, "Cherry"),
    rich_presence_value("Lives Count", CurrentRemainingLives()),
    rich_presence_lookup("Lives Label", CurrentRemainingLives(), livesLabels, "lives"),
    rich_presence_value("Score X00000", PlayerOneScoreX00000()),
    rich_presence_value("Score 0X0000", PlayerOneScore0X0000()),
    rich_presence_value("Score 00X000", PlayerOneScore00X000()),
    rich_presence_value("Score Hundreths", PlayerOneScore000XXX())
)
// "1,200,000 points"
rich_presence_conditional_display(
    GameState() == GAME_STATE_PLAYING
    && repeated(1, PlayerOneScoreX00000() == 0 && prev(PlayerOneScoreX00000()) == 9)
    && never(CurrentRemainingLives() == 0),

    "Board {0} [{1}] • {2} {3} • 1,{4}{5}{6},{7} points",
    rich_presence_value("Current Stage", CurrentStage() + 1),
    rich_presence_lookup("Stage Name", CurrentStage(), stageLabels, "Cherry"),
    rich_presence_value("Lives Count", CurrentRemainingLives()),
    rich_presence_lookup("Lives Label", CurrentRemainingLives(), livesLabels, "lives"),
    rich_presence_value("Score X00000", PlayerOneScoreX00000()),
    rich_presence_value("Score 0X0000", PlayerOneScore0X0000()),
    rich_presence_value("Score 00X000", PlayerOneScore00X000()),
    rich_presence_value("Score Hundreths", PlayerOneScore000XXX())
)
// "200,000 points"
rich_presence_conditional_display(
    GameState() == GAME_STATE_PLAYING
    && (PlayerOneScore() >= 1000 && PlayerOneScore() <= 999999)
    && never(PlayerOneScoreX00000() == 0 && prev(PlayerOneScoreX00000()) == 9)
    && never(CurrentRemainingLives() == 0),

    "Board {0} [{1}] • {2} {3} • {4},{5} points",
    rich_presence_value("Current Stage", CurrentStage() + 1),
    rich_presence_lookup("Stage Name", CurrentStage(), stageLabels, "Cherry"),
    rich_presence_value("Lives Count", CurrentRemainingLives()),
    rich_presence_lookup("Lives Label", CurrentRemainingLives(), livesLabels, "lives"),
    rich_presence_value("Score Thousandths", PlayerOneScoreXXX000()),
    rich_presence_value("Score Hundreths", PlayerOneScore000XXX())
)
// "600 points"
rich_presence_conditional_display(
    GameState() == GAME_STATE_PLAYING
    && (PlayerOneScore() < 1000)
    && never(PlayerOneScoreX00000() == 0 && prev(PlayerOneScoreX00000()) == 9)
    && never(CurrentRemainingLives() == 0),

    "Board {0} [{1}] • {2} {3} • {4} points",
    rich_presence_value("Current Stage", CurrentStage() + 1),
    rich_presence_lookup("Stage Name", CurrentStage(), stageLabels, "Cherry"),
    rich_presence_value("Lives Count", CurrentRemainingLives()),
    rich_presence_lookup("Lives Label", CurrentRemainingLives(), livesLabels, "lives"),
    rich_presence_value("Score", PlayerOneScore())
)

rich_presence_display("Playing Pac-Man")
// #endregion

// #region Achievement Functions ----------------------------------------------------------------------------------------------------------
function StartedWithDefaultSettings() {
    start = 
        once(
            GameState() == GAME_STATE_ATTRACT_MODE 
            && prev(GameState()) == GAME_STATE_RUG_PATTERN
        )

    cancel =
        never(IsTwoPlayer() == TRUE)
        && never((CurrentCredits() < prev(CurrentCredits())) && SettingLives() > 3)

    return
        start
        && cancel
        && trigger_when(CurrentCredits() < prev(CurrentCredits()))
}

// @param stageNumber {1: Stage 1 (Cherry Board)} - The stage we want the player to clear.
function CompletedStageGhostless(stageNumber = 1) {
    // Stages are 0-indexed.
    STAGE_MEMORY_VALUE = stageNumber - 1

    start = once(
        GameState() == GAME_STATE_PLAYING
        && prev(ExtendedGameState()) != EXTENDED_GAME_STATE_ACTIVELY_PLAYING
        && ExtendedGameState() == EXTENDED_GAME_STATE_ACTIVELY_PLAYING
    )

    cancel =
        ResetIfEndedGame()
        && disable_when(
            GameState() == GAME_STATE_PLAYING && GhostsEaten() > 0,
            CurrentStage() > prev(CurrentStage())
        )

    return
        start
        && cancel
        && CurrentStage() == STAGE_MEMORY_VALUE
        && trigger_when(ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE)
}

// @param stageNumber {1: Stage 1 (Cherry Board)} - The stage we want the player to clear.
function CompletedStage(stageNumber = 1, requiresScore = 0) {
    // Stages are 0-indexed.
    STAGE_MEMORY_VALUE = stageNumber - 1

    start = OnceStartedGame()
    cancel = ResetIfEndedGame()

    requiresScoreClause = always_true()
    if (requiresScore > 0) {
        requiresScoreClause = PlayerOneScore() >= requiresScore
    }

    triggerClause = trigger_when(ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE)

    // Don't prime the perfect clear achievements.
    if (requiresScore > 0) {
        triggerClause = 
            ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE
            && requiresScoreClause
    }

    return
        start
        && cancel
        && CurrentStage() == STAGE_MEMORY_VALUE
        && triggerClause
}

function EarnedScore(targetScore = 200000) {
    start = OnceStartedGame()
    cancel = ResetIfEndedGame()

    return
        start
        && cancel
        && PlayerOneScore() >= targetScore
}

// @param stageNumbers {[1]: Stage 1 (Cherry Board)} - The stages we want the player to eat a fruit on.
function FruitEatenOnStages(stageNumbers = [1]) {
    start = 
        GameState() == GAME_STATE_PLAYING 
        && ExtendedGameState() != 0x0F // game is booting
        && once(FruitSpawned() != 0x00)

    cancel = 
        ResetIfEndedGame()
        && never(
            FruitSpawned() == 0x00
            && prev(FruitSpawned()) != 0x00
            && CurrentSound() != CURRENT_SOUND_FRUIT_EATEN
        )
        && never(ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE)

    currentStageClause = always_false()
    for stage in stageNumbers {
        // Stages are 0-indexed.
        STAGE_MEMORY_VALUE = stage - 1
        
        currentStageClause = (currentStageClause || CurrentStage() == STAGE_MEMORY_VALUE)
    }
    if (stageNumbers[0] == 13 && stageNumbers[1] == 255) {
        currentStageClause = CurrentStage() >= (13 - 1)
    }

    return
        start
        && cancel
        && currentStageClause
        && trigger_when(CurrentSound() == CURRENT_SOUND_FRUIT_EATEN)
}

function EarnedExtraLife() {
    start = OnceStartedGame()

    cancel = ResetIfEndedGame()

    return
        start
        && cancel
        && PlayerOneScore() > prev(PlayerOneScore())
        && CurrentRemainingLives() > prev(CurrentRemainingLives())
}
// #endregion

// #region Achievements -------------------------------------------------------------------------------------------------------------------
achievement("DEFAULT SETTINGS CHECK", "Lives = 3, One Player Mode, Free Play Disabled", 0, StartedWithDefaultSettings())

achievement("Stage 1: Cherry", "", 1, CompletedStage(1))
achievement("Stage 2: Strawberry", "", 2, CompletedStage(2))
achievement("Stage 4: 2nd Peach", "", 3, CompletedStage(4))
achievement("Stage 6: 2nd Apple", "", 5, CompletedStage(6))
achievement("Stage 8: 2nd Grape", "", 5, CompletedStage(8))
achievement("Stage 10: 2nd Galboss", "", 5, CompletedStage(10))
achievement("Stage 12: 2nd Bell", "", 5, CompletedStage(12))
achievement("Stage 13: 1st Key", "", 10, CompletedStage(13))
achievement("Stage 15: 3rd Key", "", 10, CompletedStage(15))
achievement("Stage 17: 5th Key", "", 10, CompletedStage(17))
achievement("Stage 19: 7th Key", "", 10, CompletedStage(19))
achievement("Stage 21: 9th Key", "", 25, CompletedStage(21))

achievement("Cherry Eaten", "", 1, FruitEatenOnStages([1]))
achievement("Strawberry Eaten", "", 1, FruitEatenOnStages([2]))
achievement("Peach Eaten", "", 1, FruitEatenOnStages([3, 4]))
achievement("Apple Eaten", "", 2, FruitEatenOnStages([5, 6]))
achievement("Grape Eaten", "", 3, FruitEatenOnStages([7, 8]))
achievement("Galboss Eaten", "", 5, FruitEatenOnStages([9, 10]))
achievement("Bell Eaten", "", 5, FruitEatenOnStages([11, 12]))
achievement("Key Eaten", "", 5, FruitEatenOnStages([13, 255]))

achievement("Perfect Stage 1", "", 5, CompletedStage(1, requiresScore = 14800))
achievement("Perfect Stage 2", "", 5, CompletedStage(2, requiresScore = 30000))
achievement("Perfect Stage 3", "", 10, CompletedStage(3, requiresScore = 45600))
achievement("Perfect Stage 4", "", 10, CompletedStage(4, requiresScore = 61200))

achievement("Pacifist Stage 1", "", 5, CompletedStageGhostless(1))
achievement("Pacifist Stage 2", "", 5, CompletedStageGhostless(2))
achievement("Pacifist Stage 3", "", 10, CompletedStageGhostless(3))
achievement("Pacifist Stage 4", "", 10, CompletedStageGhostless(4))

achievement("Extra Life", "", 1, EarnedExtraLife())

achievement("100,000 Points", "", 25, EarnedScore(100000))
achievement("250,000 Points", "", 50, EarnedScore(200000))
// #endregion