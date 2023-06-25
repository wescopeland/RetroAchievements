// Pac-Man | Puck Man [Subset - Perfect Pac]
// #ID = 24933

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
// Compute how many frames it will take to reach a certain time span.
// @param minutes {0} - How many minutes it will take
// @param seconds {0} - How many seconds it will take
// @param frames {0} - How many frames it will take
function TimeSpan(minutes = 0, seconds = 0, frames = 0) => minutes * 3600 + seconds * 60 + frames

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
perfectBoardScores = {
    1: 14800,
    2: 30000,
    3: 45600,
    4: 61200,
    5: 77200,
    6: 93200,
    7: 109800,
    8: 126400,
    9: 145000,
    10: 163600,
    11: 184200,
    12: 204800,
    13: 229400,
    14: 254000,
    15: 278600,
    16: 303200,
    17: 315800,
    18: 340400,
    19: 353000,
    20: 365600,
    21: 378200,
    22: 390800,
    23: 403400,
    24: 416000,
    25: 428600,
    26: 441200,
    27: 453800,
    28: 466400,
    29: 479000,
    30: 491600,
    31: 504200,
    32: 516800,
    33: 529400,
    34: 542000,
    35: 554600,
    36: 567200,
    37: 579800,
    38: 592400,
    39: 605000,
    40: 617600,
    41: 630200,
    42: 642800,
    43: 655400,
    44: 668000,
    45: 680600,
    46: 693200,
    47: 705800,
    48: 718400,
    49: 731000,
    50: 743600,
    51: 756200,
    52: 768800,
    53: 781400,
    54: 794000,
    55: 806600,
    56: 819200,
    57: 831800,
    58: 844400,
    59: 857000,
    60: 869600,
    61: 882200,
    62: 894800,
    63: 907400,
    64: 920000,
    65: 932600,
    66: 945200,
    67: 957800,
    68: 970400,
    69: 983000,
    70: 995600,
    71: 8200,
    72: 20800,
    73: 33400,
    74: 46000,
    75: 58600,
    76: 71200,
    77: 83800,
    78: 96400,
    79: 109000,
    80: 121600,
    81: 134200,
    82: 146800,
    83: 159400,
    84: 172000,
    85: 184600,
    86: 197200,
    87: 209800,
    88: 222400,
    89: 235000,
    90: 247600,
    91: 260200,
    92: 272800,
    93: 285400,
    94: 298000,
    95: 310600,
    96: 323200,
    97: 335800,
    98: 348400,
    99: 361000,
    100: 373600,
    101: 386200,
    102: 398800,
    103: 411400,
    104: 424000,
    105: 436600,
    106: 449200,
    107: 461800,
    108: 474400,
    109: 487000,
    110: 499600,
    111: 512200,
    112: 524800,
    113: 537400,
    114: 550000,
    115: 562600,
    116: 575200,
    117: 587800,
    118: 600400,
    119: 613000,
    120: 625600,
    121: 638200,
    122: 650800,
    123: 663400,
    124: 676000,
    125: 688600,
    126: 701200,
    127: 713800,
    128: 726400,
    129: 739000,
    130: 751600,
    131: 764200,
    132: 776800,
    133: 789400,
    134: 802000,
    135: 814600,
    136: 827200,
    137: 839800,
    138: 852400,
    139: 865000,
    140: 877600,
    141: 890200,
    142: 902800,
    143: 915400,
    144: 928000,
    145: 940600,
    146: 953200,
    147: 965800,
    148: 978400,
    149: 991000,
    150: 3600,
    151: 16200,
    152: 28800,
    153: 41400,
    154: 54000,
    155: 66600,
    156: 79200,
    157: 91800,
    158: 104400,
    159: 117000,
    160: 129600,
    161: 142200,
    162: 154800,
    163: 167400,
    164: 180000,
    165: 192600,
    166: 205200,
    167: 217800,
    168: 230400,
    169: 243000,
    170: 255600,
    171: 268200,
    172: 280800,
    173: 293400,
    174: 306000,
    175: 318600,
    176: 331200,
    177: 343800,
    178: 356400,
    179: 369000,
    180: 381600,
    181: 394200,
    182: 406800,
    183: 419400,
    184: 432000,
    185: 444600,
    186: 457200,
    187: 469800,
    188: 482400,
    189: 495000,
    190: 507600,
    191: 520200,
    192: 532800,
    193: 545400,
    194: 558000,
    195: 570600,
    196: 583200,
    197: 595800,
    198: 608400,
    199: 621000,
    200: 633600,
    201: 646200,
    202: 658800,
    203: 671400,
    204: 684000,
    205: 696600,
    206: 709200,
    207: 721800,
    208: 734400,
    209: 747000,
    210: 759600,
    211: 772200,
    212: 784800,
    213: 797400,
    214: 810000,
    215: 822600,
    216: 835200,
    217: 847800,
    218: 860400,
    219: 873000,
    220: 885600,
    221: 898200,
    222: 910800,
    223: 923400,
    224: 936000,
    225: 948600,
    226: 961200,
    227: 973800,
    228: 986400,
    229: 999000,
    230: 11600,
    231: 24200,
    232: 36800,
    233: 49400,
    234: 62000,
    235: 74600,
    236: 87200,
    237: 99800,
    238: 112400,
    239: 125000,
    240: 137600,
    241: 150200,
    242: 162800,
    243: 175400,
    244: 188000,
    245: 200600,
    246: 213200,
    247: 225800,
    248: 238400,
    249: 251000,
    250: 263600,
    251: 276200,
    252: 288800,
    253: 301400,
    254: 314000,
    255: 326600
}

function StartProgressLeaderboard() {
    return 
        GameState() == GAME_STATE_PLAYING
        && ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE
        && PlayerOneScore() == 14800
        && IsTwoPlayer() == FALSE
}

function StartSpeedrunLeaderboard() {
    return
        IsMusicPlaying() == TRUE && prev(IsMusicPlaying()) == FALSE
        && IsTwoPlayer() == FALSE
}

function BuildProgressSubmit() {
    onDeathsClause = 
        GameState() == GAME_STATE_PLAYING 
        && CurrentRemainingLives() < prev(CurrentRemainingLives())

    boardScoreClause = always_false()
    for boardNumber in range(2, 255) {
        boardScoreClause =
            boardScoreClause
            || (
                CurrentStage() == boardNumber - 1 
                && ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE 
                && PlayerOneScore() != perfectBoardScores[boardNumber]
            )
    }

    return 
        onDeathsClause 
        || boardScoreClause 
        || (CurrentStage() == 0xFF)
}

function BuildSpeedrunCancel() {
    onDeathsClause = 
        GameState() == GAME_STATE_PLAYING 
        && CurrentRemainingLives() < prev(CurrentRemainingLives())

    boardScoreClause = always_false()
    for boardNumber in range(2, 255) {
        boardScoreClause =
            boardScoreClause
            || (
                CurrentStage() == boardNumber - 1 
                && ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE 
                && PlayerOneScore() != perfectBoardScores[boardNumber]
            )
    }

    return onDeathsClause || boardScoreClause
}

leaderboard(
    "Perfect Progress",
    "Most screens completed on perfect pace",
    start = StartProgressLeaderboard(),
    cancel = always_false(),
    submit = BuildProgressSubmit(),
    value = CurrentStage()
)

leaderboard(
    "Perfect Time",
    "Fastest perfect game",
    start = StartSpeedrunLeaderboard(),
    cancel = BuildSpeedrunCancel(),
    submit = CurrentStage() == 0xFF && PlayerOneScore() == 333360,
    value = repeated(TimeSpan(), always_true()),
    format = "FRAMES",
    lower_is_better = true
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

    "Board {0} [{1}] • {2} {3} • 1,{4}{5}{6},{7}{8}{9} points",
    rich_presence_value("Current Stage", CurrentStage() + 1),
    rich_presence_lookup("Stage Name", CurrentStage(), stageLabels, "Cherry"),
    rich_presence_value("Lives Count", CurrentRemainingLives()),
    rich_presence_lookup("Lives Label", CurrentRemainingLives(), livesLabels, "lives"),
    rich_presence_value("Score X00000", PlayerOneScoreX00000()),
    rich_presence_value("Score 0X0000", PlayerOneScore0X0000()),
    rich_presence_value("Score 00X000", PlayerOneScore00X000()),
    rich_presence_value("Score 000X00", PlayerOneScore000X00()),
    rich_presence_value("Score 0000X0", PlayerOneScore0000X0()),
    rich_presence_value("Score 00000X", PlayerOneScore00000X())
)
// "2,200,000 points"
rich_presence_conditional_display(
    GameState() == GAME_STATE_PLAYING
    && repeated(2, PlayerOneScoreX00000() == 0 && prev(PlayerOneScoreX00000()) == 9)
    && never(CurrentRemainingLives() == 0),

    "Board {0} [{1}] • {2} {3} • 1,{4}{5}{6},{7}{8}{9} points",
    rich_presence_value("Current Stage", CurrentStage() + 1),
    rich_presence_lookup("Stage Name", CurrentStage(), stageLabels, "Cherry"),
    rich_presence_value("Lives Count", CurrentRemainingLives()),
    rich_presence_lookup("Lives Label", CurrentRemainingLives(), livesLabels, "lives"),
    rich_presence_value("Score X00000", PlayerOneScoreX00000()),
    rich_presence_value("Score 0X0000", PlayerOneScore0X0000()),
    rich_presence_value("Score 00X000", PlayerOneScore00X000()),
    rich_presence_value("Score 000X00", PlayerOneScore000X00()),
    rich_presence_value("Score 0000X0", PlayerOneScore0000X0()),
    rich_presence_value("Score 00000X", PlayerOneScore00000X())
)
// "1,200,000 points"
rich_presence_conditional_display(
    GameState() == GAME_STATE_PLAYING
    && repeated(1, PlayerOneScoreX00000() == 0 && prev(PlayerOneScoreX00000()) == 9)
    && never(CurrentRemainingLives() == 0),

    "Board {0} [{1}] • {2} {3} • 1,{4}{5}{6},{7}{8}{9} points",
    rich_presence_value("Current Stage", CurrentStage() + 1),
    rich_presence_lookup("Stage Name", CurrentStage(), stageLabels, "Cherry"),
    rich_presence_value("Lives Count", CurrentRemainingLives()),
    rich_presence_lookup("Lives Label", CurrentRemainingLives(), livesLabels, "lives"),
    rich_presence_value("Score X00000", PlayerOneScoreX00000()),
    rich_presence_value("Score 0X0000", PlayerOneScore0X0000()),
    rich_presence_value("Score 00X000", PlayerOneScore00X000()),
    rich_presence_value("Score 000X00", PlayerOneScore000X00()),
    rich_presence_value("Score 0000X0", PlayerOneScore0000X0()),
    rich_presence_value("Score 00000X", PlayerOneScore00000X())
)
// "200,000 points"
rich_presence_conditional_display(
    GameState() == GAME_STATE_PLAYING
    && (PlayerOneScore() >= 1000 && PlayerOneScore() <= 999999)
    && never(PlayerOneScoreX00000() == 0 && prev(PlayerOneScoreX00000()) == 9)
    && never(CurrentRemainingLives() == 0),

    "Board {0} [{1}] • {2} {3} • {4},{5}{6}{7} points",
    rich_presence_value("Current Stage", CurrentStage() + 1),
    rich_presence_lookup("Stage Name", CurrentStage(), stageLabels, "Cherry"),
    rich_presence_value("Lives Count", CurrentRemainingLives()),
    rich_presence_lookup("Lives Label", CurrentRemainingLives(), livesLabels, "lives"),
    rich_presence_value("Score Thousandths", PlayerOneScoreXXX000()),
    rich_presence_value("Score 000X00", PlayerOneScore000X00()),
    rich_presence_value("Score 0000X0", PlayerOneScore0000X0()),
    rich_presence_value("Score 00000X", PlayerOneScore00000X())
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
function PerfectProgression(stageNumber = 5) {
    // Stages are 0-indexed.
    STAGE_MEMORY_VALUE = stageNumber - 1

    start = once(
        GameState() == GAME_STATE_PLAYING
        && prev(GameState()) < GAME_STATE_PLAYING
    )

    cancel =
        never(CurrentRemainingLives() < prev(CurrentRemainingLives()))
        && never(CurrentStage() > STAGE_MEMORY_VALUE)

    return
        start
        && cancel
        && ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE
        && PlayerOneScore() == perfectBoardScores[stageNumber]
}

function PerfectBoardClear(stageNumber = 1) {
    // Stages are 0-indexed.
    STAGE_MEMORY_VALUE = stageNumber - 1

    startClause = once(
        GameState() == GAME_STATE_PLAYING
        && CurrentStage() == STAGE_MEMORY_VALUE
        && prev(CurrentStage()) == STAGE_MEMORY_VALUE - 1
        && IsTwoPlayer() == FALSE
    )
    if (stageNumber == 1) {
        startClause = once(
            GameState() == GAME_STATE_PLAYING
            && prev(GameState()) < GAME_STATE_PLAYING
        )
    }

    cancel =
        never(CurrentRemainingLives() < prev(CurrentRemainingLives()))
        && never(
            CurrentStage() == STAGE_MEMORY_VALUE
            && ExtendedGameState() == EXTENDED_GAME_STATE_ACTIVELY_PLAYING
            && FruitSpawned() == 0x00
            && prev(FruitSpawned()) != 0x00
            && CurrentSound() != CURRENT_SOUND_FRUIT_EATEN
        )
        && never(CurrentStage() > STAGE_MEMORY_VALUE)

    ghostsEatenClause = always_true()
    if (STAGE_MEMORY_VALUE != 0x10 && STAGE_MEMORY_VALUE < 0x12) {
        ghostsEatenClause = repeated(4,  GhostsEaten() == 4 && prev(GhostsEaten()) < 4)
    }

    return
        startClause
        && cancel
        && trigger_when(
            // Two fruit eats.
            repeated(2, 
                CurrentSound() == CURRENT_SOUND_FRUIT_EATEN 
                && prev(CurrentSound()) != CURRENT_SOUND_FRUIT_EATEN
            )
            // Sixteen ghost eats (exclude 17 and >= 19)
            && ghostsEatenClause
            && ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE
        )
}

function PerfectBoardRangeClear(startStageNumber = 1, endStageNumber = 4) {
    // Stages are 0-indexed.
    START_STAGE_MEMORY_VALUE = startStageNumber - 1
    END_STAGE_MEMORY_VALUE = endStageNumber - 1

    startClause = once(
        GameState() == GAME_STATE_PLAYING
        && CurrentStage() == START_STAGE_MEMORY_VALUE
        && prev(CurrentStage()) == START_STAGE_MEMORY_VALUE - 1
    )
    if (startStageNumber == 1) {
        startClause = once(
            GameState() == GAME_STATE_PLAYING
            && prev(GameState()) < GAME_STATE_PLAYING
        )
    }

    cancel =
        never(CurrentRemainingLives() < prev(CurrentRemainingLives()))
        && never(
            ExtendedGameState() == EXTENDED_GAME_STATE_ACTIVELY_PLAYING
            && FruitSpawned() == 0x00
            && prev(FruitSpawned()) != 0x00
            && CurrentSound() != CURRENT_SOUND_FRUIT_EATEN
        )
        && never(CurrentStage() > END_STAGE_MEMORY_VALUE)


    eatenRightGhostCountClause = always_false()
    index = 1
    for stageNumber in range(startStageNumber + 1, endStageNumber) {
        STAGE_MEMORY_VALUE = stageNumber - 1
        FULL_POWER_PELLETS_REQUIRED = 4 * index

        // http://aaronin.jp/pacman.html
        if (STAGE_MEMORY_VALUE != 0x10) {
            if (startStageNumber >= 0x12) {
                eatenRightGhostCountClause = always_true()
            } else {
                eatenRightGhostCountClause =
                    eatenRightGhostCountClause
                    || (
                        CurrentStage() == STAGE_MEMORY_VALUE 
                        && repeated(FULL_POWER_PELLETS_REQUIRED, GhostsEaten() == 4 && prev(GhostsEaten()) < 4)
                    )
            }
        }

        index = index + 1
    }

    FRUIT_EATS_REQUIRED = index * 2
    TOTAL_FULL_PELLETS_REQUIRED = index * 4

    return
        startClause
        && cancel
        && eatenRightGhostCountClause
        && trigger_when(
            repeated(FRUIT_EATS_REQUIRED,
                CurrentSound() == CURRENT_SOUND_FRUIT_EATEN 
                && prev(CurrentSound()) != CURRENT_SOUND_FRUIT_EATEN
                && ExtendedGameState() == EXTENDED_GAME_STATE_ACTIVELY_PLAYING
            )
            && repeated(TOTAL_FULL_PELLETS_REQUIRED,  GhostsEaten() == 4 && prev(GhostsEaten()) < 4)
            && CurrentStage() >= END_STAGE_MEMORY_VALUE
            && ExtendedGameState() == EXTENDED_GAME_STATE_STAGE_DONE
        )
}

function StartedWithDefaultSettings() {
    start = 
        once(
            GameState() == GAME_STATE_ATTRACT_MODE 
            && prev(GameState()) == GAME_STATE_RUG_PATTERN
        )

    cancel =
        never(IsTwoPlayer() == TRUE)
        && never((CurrentCredits() < prev(CurrentCredits())) && SettingLives() < 3)

    return
        start
        && cancel
        && trigger_when(CurrentCredits() < prev(CurrentCredits()))
}

function GotPerfectGame() {
    start = once(
        GameState() == GAME_STATE_PLAYING
        && prev(GameState()) != GAME_STATE_PLAYING
    )

    cancel = never(CurrentRemainingLives() < prev(CurrentRemainingLives()))

    return
        start
        && cancel
        && CurrentStage() == 0xFF
        && PlayerOneScore() == 333360
}

function ReachedSplitScreen() {
    start = once(
        GameState() == GAME_STATE_PLAYING
        && prev(GameState()) != GAME_STATE_PLAYING
        && IsTwoPlayer() == FALSE
    )

    cancel = never(CurrentRemainingLives() == 0)

    return
        start
        && cancel
        && CurrentStage() == 0xFF
}
// #endregion

// #region Achievements -------------------------------------------------------------------------------------------------------------------
achievement("DEFAULT SETTINGS CHECK", "Lives = 3+, One Player Mode. With the exception of \"Split Screen\", all achievements require no deaths.", 0, StartedWithDefaultSettings())

achievement("Perfect Cherry", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the Cherry board", 10, PerfectBoardClear(1))
achievement("Perfect Strawberry", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the Strawberry board", 10, PerfectBoardClear(2))
achievement("Perfect 1st Orange", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 1st Orange board", 10, PerfectBoardClear(3))
achievement("Perfect 2nd Orange", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 2nd Orange board", 10, PerfectBoardClear(4))
achievement("Perfect 1st Apple", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 1st Apple board", 10, PerfectBoardClear(5))
achievement("Perfect 2nd Apple", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 2nd Apple board", 10, PerfectBoardClear(6))
achievement("Perfect 1st Melon", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 1st Melon board", 10, PerfectBoardClear(7))
achievement("Perfect 2nd Melon", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 2nd Melon board", 10, PerfectBoardClear(8))
achievement("Perfect 1st Galaxian", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 1st Galaxian board", 10, PerfectBoardClear(9))
achievement("Perfect 2nd Galaxian", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 2nd Galaxian board", 10, PerfectBoardClear(10))
achievement("Perfect 1st Bell", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 1st Bell board", 10, PerfectBoardClear(11))
achievement("Perfect 2nd Bell", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 2nd Bell board", 10, PerfectBoardClear(12))
achievement("Perfect 1st Key", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 1st Key board", 10, PerfectBoardClear(13))
achievement("Perfect 2nd Key", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 2nd Key board", 10, PerfectBoardClear(14))
achievement("Perfect 3rd Key", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 3rd Key board", 10, PerfectBoardClear(15))
achievement("Perfect 4th Key", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 4th Key board", 10, PerfectBoardClear(16))
achievement("Perfect 5th Key", "Eat every possible dot and both fruit bonuses on the 5th Key board", 10, PerfectBoardClear(17))
achievement("Perfect 6th Key", "Eat every possible dot, all 16 ghosts, and both fruit bonuses on the 6th Key board", 10, PerfectBoardClear(18))
achievement("Perfect 7th Key", "Eat every possible dot and both fruit bonuses on the 7th Key board", 10, PerfectBoardClear(19))
achievement("Perfect 8th Key", "Eat every possible dot and both fruit bonuses on the 8th Key board", 10, PerfectBoardClear(20))

achievement("2%", "Clear the 1st Apple board with a score of 77,200 points", 25, PerfectProgression(5))
achievement("4%", "Clear the 2nd Galaxian board with a score of 163,600 points", 25, PerfectProgression(10))
achievement("6%", "Clear the 3rd Key board with a score of 278,600 points", 25, PerfectProgression(15))
achievement("8%", "Clear the 8th Key board with a score of 365,600 points", 25, PerfectProgression(20))
achievement("28%", "Clear the 59th Key board with a score of 1,008,200 points", 50, PerfectProgression(71))
achievement("59%", "Clear the 150th Key board with a score of 2,003,600 points", 50, PerfectProgression(150))
achievement("90%", "Clear the 230th Key board with a score of 3,011,600 points", 50, PerfectProgression(230))
achievement("Endgame", "Reach board 256, the final stage in Pac-Man [Any Score Allowed] [Deaths Allowed]", 50, ReachedSplitScreen())
achievement("Perfect Pac", "Score 3,333,360 points by eating every dot, power pellet, ghost, and fruit in the entire game", 100, GotPerfectGame())