// ~Homebrew~ Mega Man: The Sequel Wars - Episode Red
// #ID = 24453

// TODO: Mega Man and Man are synonymous
// TODO: Make sure boss no hit & boss no special achievements work during boss rush
// TODO: change boss conditional check from checkpoint to stage number
// TODO: use room number for priming boss achievements
// TODO: make sure necessary achievements are protected against Free Play mode

// Memory Symbols -----------------------------------------------------------------------------------------------------------------
_MEM_LIVES                 = 0x01A1 - 1    // (D lives) - 1
_MEM_ETANKS                = 0x01A0 + 1    // (D etanks) + 1
_MEM_PSX                   = 0x0388        // (B psx)
_MEM_MODIFIERS_A           = 0x1D4C        // (B modifiers)
_MEM_MODIFIERS_B           = 0x1D4C + 1    // (B modifiers) + 1
_MEM_BOSSACTIVE            = 0x2650 + 1    // (B bossactive) + 1
_MEM_DEMOROUTINE           = 0x2604        // (B demoroutine)
_MEM_FIREPRESSED           = 0x2625 - 1    // (B firepressed) - 1
_MEM_CASTLEPROG            = 0x268B - 1    // (B castleprog) - 1
_MEM_DISPHEALTH            = 0x26DE        // (B disphealth)
_MEM_DIFFICULTY            = 0x26ED - 1    // (B difficulty) - 1
_MEM_CHECKPOINT            = 0x2878 + 1    // (B checkpoint) + 1
_MEM_PAUSED                = 0x287A        // (B paused)
_MEM_WEAPON                = 0x287C + 1    // (B weapon) + 1
_MEM_CHARACTER             = 0x287E + 1    // (B character) + 1
_MEM_PREVLOCK              = 0x28A5 - 1    // (B prevlock) - 1
_MEM_WEPUNLOCKED_A         = 0x2698 + 2    // (B wepunlocked) + 2
_MEM_WEPUNLOCKED_B         = 0x2698 + 3    // (B wepunlocked) + 3
_MEM_GAMEMODE              = 0x29FC + 1    // (B gamemode) + 1
_MEM_HIGHESTVDPSPRITEINDEX = 0x2A02        // (B highestVDPSpriteIndex)
_MEM_STAGE                 = 0x2E54 + 1    // (B stage) + 1
_MEM_ENTITYI               = 0x306A        // (B entityI)
_MEM_CURSCREEN             = 0x6C84        // (B curscreen)


// Memory -------------------------------------------------------------------------------------------------------------------------
function TotalLivesLeft() => byte(_MEM_LIVES)
function TotalETanksLeft() => byte(_MEM_ETANKS)
function CurrentXPosition() => byte(_MEM_PSX)
function IsBurstChaserEnabled() => bit2(_MEM_MODIFIERS_A)
function IsDoubleJumpEnabled() => bit3(_MEM_MODIFIERS_A)
function IsAirSlidingEnabled() => bit4(_MEM_MODIFIERS_A)
function IsFullArsenalEnabled() => bit7(_MEM_MODIFIERS_A)
function IsInfiniteAmmoEnabled() => bit1(_MEM_MODIFIERS_B)
function IsInfiniteLivesEnabled() => bit2(_MEM_MODIFIERS_B)
function BossActive() => byte(_MEM_BOSSACTIVE)
function IsDemoPlaying() => byte(_MEM_DEMOROUTINE)
function IsFirePressed() => byte(_MEM_FIREPRESSED)
function CastleStagesBeaten() => byte(_MEM_CASTLEPROG)
function CurrentHealth() => byte(_MEM_DISPHEALTH)

function CurrentDifficulty() => byte(_MEM_DIFFICULTY)
DIFFICULTY_EASY = 0x00
DIFFICULTY_MEDIUM = 0x01
DIFFICULTY_HARD = 0x02

function CurrentCheckpoint() => byte(_MEM_CHECKPOINT)
CHECKPOINT_NONE = 0x00
CHECKPOINT_MID = 0x01
CHECKPOINT_END = 0x02
CHECKPOINT_FINISHED_BOSS_RUSH = 0x03

function IsPauseMenuOpen() => byte(_MEM_PAUSED)

function CurrentEquippedWeapon() => byte(_MEM_WEAPON)
EQUIPPED_BUSTER = 0x00
EQUIPPED_SBARRIER = 0x01
EQUIPPED_DBOMB = 0x02
EQUIPPED_RFLUSH = 0x03
EQUIPPED_DCRUSHER = 0x04
EQUIPPED_RBOOMERANG = 0x05
EQUIPPED_DMISSILE = 0x06
EQUIPPED_PSHOT = 0x07
EQUIPPED_FSTOPPER = 0x08
EQUIPPED_RCOIL = 0x09
EQUIPPED_RJET = 0x0A
EQUIPPED_RMARINE = 0x0B
EQUIPPED_BALLOON = 0x0C
EQUIPPED_WIRE = 0x0D
EQUIPPED_EXITSTAGE = 0x27

function CurrentCharacter() => byte(_MEM_CHARACTER)
CHAR_MEGAMAN = 0x00
CHAR_PROTOMAN = 0x01
CHAR_ROLL = 0x02
CHAR_MAN = 0x03

function IsPlayerLocked() => byte(_MEM_PREVLOCK)

WEAPONS_EARNED = [
    bit1(_MEM_WEPUNLOCKED_A), // Skull Man
    bit2(_MEM_WEPUNLOCKED_A), // Drill Man
    bit3(_MEM_WEPUNLOCKED_A), // Toad Man
    bit4(_MEM_WEPUNLOCKED_A), // Dust Man
    bit5(_MEM_WEPUNLOCKED_A), // Ring Man
    bit6(_MEM_WEPUNLOCKED_A), // Dive Man
    bit7(_MEM_WEPUNLOCKED_A), // Pharaoh Man
    bit0(_MEM_WEPUNLOCKED_B)  // Bright Man
]

function CanonicalGameState() => byte(_MEM_GAMEMODE)
STATE_LEVEL = 0x00
STATE_PAUSE_MENU_OPEN = 0x02
STATE_MAIN_SETTINGS = 0x04
STATE_LEVEL_INTRO = 0x05
STATE_GAME_INTRO = 0x06
STATE_GAME_OVER = 0x07
STATE_WEAPON_GET = 0x08
STATE_STAGE_SELECT = 0x09
STATE_ENTER_PASSWORD_SCREEN = 0x0A
STATE_SAVE_OR_CONTINUE_SCREEN = 0x0B
STATE_MM4_TITLE_SCREEN = 0x0C
STATE_MEGAMAN_GAME_SELECT = 0x0D
STATE_COSSACK_WILY_LEVEL_INTRO_SCREEN = 0x0E
STATE_MM4_SETTINGS = 0x14
STATE_MM4_INTRO_CUTSCENE = 0x15
STATE_FILE_SELECT = 0x16
STATE_CREDITS = 0x18
STATE_FREE_PLAY_MENU = 0x19
STATE_ENDING_ONE = 0x1A
STATE_ENDING_TWO = 0x1B

function HighestVDPSpriteIndex() => byte(_MEM_HIGHESTVDPSPRITEINDEX)
WILY_MACHINE_FORM_ONE = 0x28
WILY_MACHINE_FORM_TWO = 0x34

function CurrentStage() => byte(_MEM_STAGE)
STAGE_ADDRESS_MAP = {
    "Toad": 0x00,
    "Dust": 0x01,
    "Dive": 0x02,
    "Bright": 0x03,
    "Drill": 0x04,
    "Skull": 0x05,
    "Pharaoh": 0x06,
    "Ring": 0x07,
    "Cossack1": 0x08,
    "Cossack2": 0x09,
    "Cossack3": 0x0A,
    "Cossack4": 0x0B,
    "Wily1": 0x0C,
    "Wily2": 0x0D,
    "Wily3": 0x0E,
    "Wily4": 0x0F
}

function CurrentScreen() => byte(_MEM_CURSCREEN)
SCREEN_WILY_MACHINE_BATTLE = 0x19
SCREEN_BOSS_RUSH_MAIN = 0x1D


// Utils --------------------------------------------------------------------------------------------------------------------------
BOSS_ACTIVE_WILY_CAPSULE = 0x0A
BOSS_CORRIDOR_RIGHT_DOOR_POS = 0xFA
COSSACK_ONE = 0x08
MAX_HEALTH = 0x1C
WILY_THREE = 0x0E
WILY_FOUR = 0x0F

function PlayerDead() => CurrentHealth() == 0

function IsPlayerTouchingBossEntranceDoor(requiredCheckpoint = 0x02) {
    // 0x02: CHECKPOINT_END

    // Make sure the player isn't touching the entrance door for the boss corridor.
    // Probably won't be the case if they're on checkpoint 2 for at least 240 frames first.
    return 
        BossActive() == 0
        && CurrentXPosition() >= 0xF9
        && once(repeated(240, CurrentCheckpoint() == requiredCheckpoint))
}

function BossHealth() {
    BossActivePointer = BossActive() * (16 * 2)
    return byte(_MEM_ENTITYI + BossActivePointer + 4)
}

function IsShootingSpecialWeapon() {
    return
        IsFirePressed() == 1
        && IsPauseMenuOpen() == 0
        && CurrentEquippedWeapon() != EQUIPPED_BUSTER
        && CurrentEquippedWeapon() != EQUIPPED_RCOIL
        && CurrentEquippedWeapon() != EQUIPPED_RJET
        && CurrentEquippedWeapon() != EQUIPPED_RMARINE
}

function IsUsingOnlyAllowedModifiers() {
    return
        CurrentDifficulty() >= DIFFICULTY_MEDIUM
        && IsInfiniteAmmoEnabled() == 0
        && IsInfiniteLivesEnabled() == 0
        && IsAirSlidingEnabled() == 0
        && IsDoubleJumpEnabled() == 0
        && IsFullArsenalEnabled() == 0
        && IsBurstChaserEnabled() == 0 // TODO: This setting may actually be okay
}

function IsBossKilled(bossDeadHealth = 0, bossLifeBarCount = 1) {
    wilyMachineHack = always_true()
    if (bossLifeBarCount == 2) {
        wilyMachineHack = once(HighestVDPSpriteIndex() == WILY_MACHINE_FORM_TWO)
    }

    return
        wilyMachineHack
        && (BossHealth() <= bossDeadHealth && prev(BossHealth()) > bossDeadHealth)
        && (once(IsPlayerLocked() == 0 && prev(IsPlayerLocked()) == 1))
        && once(BossHealth() < MAX_HEALTH && prev(BossHealth()) == MAX_HEALTH)
        && (prev(BossActive()) != 0) // prevents a bug where the boss pointer points at Mega Man's health
}

// Achievement Functions ----------------------------------------------------------------------------------------------------------
function BossKill(bossKey, bossDeadHealth = 0, bossLifeBarCount = 1, requiredCheckpoint = 0x02) {
    // 0x02: CHECKPOINT_END

    if (requiredCheckpoint == CHECKPOINT_FINISHED_BOSS_RUSH) {
        start = once(prev(CurrentScreen()) == SCREEN_BOSS_RUSH_MAIN && CurrentScreen() == SCREEN_WILY_MACHINE_BATTLE)
    } else {
        start = once(IsPlayerTouchingBossEntranceDoor(requiredCheckpoint))
    }

    cancel = never(PlayerDead())

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && CurrentStage() == STAGE_ADDRESS_MAP[bossKey]
        && CurrentCheckpoint() == requiredCheckpoint
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

function BossKillNoSpecialWeapons(bossKey, requiredCharacter, bossDeadHealth = 0, bossLifeBarCount = 1, requiredCheckpoint = 0x02) {
    // 0x02: CHECKPOINT_END

    if (requiredCheckpoint == CHECKPOINT_FINISHED_BOSS_RUSH) {
        start = once(prev(CurrentScreen()) == SCREEN_BOSS_RUSH_MAIN && CurrentScreen() == SCREEN_WILY_MACHINE_BATTLE)
    } else {
        start = once(IsPlayerTouchingBossEntranceDoor(requiredCheckpoint))
    }

    cancel = 
        never(PlayerDead()) 
        && never(IsShootingSpecialWeapon())
        && never(TotalETanksLeft() < prev(TotalETanksLeft()))

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && CurrentCharacter() == requiredCharacter
        && CurrentStage() == STAGE_ADDRESS_MAP[bossKey]
        && CurrentCheckpoint() == requiredCheckpoint
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

function BossKillDamageless(bossKey, requiredCharacter, bossDeadHealth = 0, bossLifeBarCount = 1, requiredCheckpoint = 0x02) {
    // 0x02: CHECKPOINT_END

    if (requiredCheckpoint == CHECKPOINT_FINISHED_BOSS_RUSH) {
        start = once(prev(CurrentScreen()) == SCREEN_BOSS_RUSH_MAIN && CurrentScreen() == SCREEN_WILY_MACHINE_BATTLE)
    } else {
        start = once(IsPlayerTouchingBossEntranceDoor(requiredCheckpoint))
    }

    cancel = 
        never(PlayerDead())
        && never(CurrentHealth() < prev(CurrentHealth()))

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && CurrentCharacter() == requiredCharacter
        && CurrentStage() == STAGE_ADDRESS_MAP[bossKey]
        && CurrentCheckpoint() == requiredCheckpoint
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

function BossDoorDamageless(bossKey, requiredCharacter, requiredCheckpoint = 0x02) {
    // 0x02: CHECKPOINT_END

    start = 
        once(CanonicalGameState() == STATE_LEVEL && prev(CanonicalGameState()) == STATE_LEVEL_INTRO)
        || once(CanonicalGameState() == STATE_LEVEL && prev(CanonicalGameState()) == STATE_COSSACK_WILY_LEVEL_INTRO_SCREEN)
        || once(CanonicalGameState() == STATE_LEVEL && CurrentHealth() == MAX_HEALTH && prev(CurrentHealth()) == 0 && CurrentCheckpoint() == CHECKPOINT_NONE)

    cancel = 
        never(IsDemoPlaying() == 1) 
        && never(CurrentHealth() < prev(CurrentHealth()))

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && CurrentCharacter() == requiredCharacter
        && CurrentStage() == STAGE_ADDRESS_MAP[bossKey]
        && trigger_when(CurrentCheckpoint() == requiredCheckpoint)
}


// Achievements -------------------------------------------------------------------------------------------------------------------

// TODO: some kind of invalid settings detected icon that persists?
// maybe show this icon on the modifiers screen for MM4

achievement("Rain Flush", "Defeat Toad Man", 5, BossKill("Toad"))
achievement("Flash Stopper", "Defeat Bright Man", 5, BossKill("Bright"))
achievement("Pharaoh Shot", "Defeat Pharaoh Man", 5, BossKill("Pharaoh"))
achievement("Ring Boomerang", "Defeat Ring Man", 5, BossKill("Ring"))
achievement("Dust Crusher", "Defeat Dust Man", 5, BossKill("Dust"))
achievement("Skull Barrier", "Defeat Skull Man", 5, BossKill("Skull"))
achievement("Dive Missile", "Defeat Dive Man", 5, BossKill("Dive"))
achievement("Drill Bombs", "Defeat Drill Man", 5, BossKill("Drill"))

achievement("M Toad Man Stage No Hit", "As Mega Man, reach Toad Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Toad", CHAR_MEGAMAN))
achievement("P Toad Man Stage No Hit", "As Proto Man, reach Toad Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Toad", CHAR_PROTOMAN))
achievement("R Toad Man Stage No Hit", "As Roll, reach Toad Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Toad", CHAR_ROLL))

achievement("M Toad Man No Special Weapons", "As Mega Man, defeat Toad Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons("Toad", CHAR_MEGAMAN))
achievement("M Toad Man Boss No Hit", "As Mega Man, defeat Toad Man in his stage without taking damage", 5, BossKillDamageless("Toad", CHAR_MEGAMAN))

achievement("Mothraya", "Defeat Mothraya", 5, BossKill("Cossack1"))
achievement("Square Machine", "Defeat the Square Machine", 5, BossKill("Cossack2"))
achievement("Cockroach Twins", "Defeat the Cockroach Twins", 5, BossKill("Cossack3"))
achievement("Cossack Catcher", "Defeat the Cossack Catcher", 5, BossKill("Cossack4", bossDeadHealth = 0x02))

achievement("M Cossack 1 Stage No Hit", "As Mega Man, reach Cossack 1's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack1", CHAR_MEGAMAN))
achievement("M Cossack 2 Stage No Hit", "As Mega Man, reach Cossack 2's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack2", CHAR_MEGAMAN))
achievement("M Cossack 3 Stage No Hit", "As Mega Man, reach Cossack 3's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack3", CHAR_MEGAMAN))
achievement("M Cossack 4 Stage No Hit", "As Mega Man, reach Cossack 4's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack4", CHAR_MEGAMAN))

achievement("M Mothraya No Hit", "As Mega Man, defeat Mothraya without taking damage", 5, BossKillDamageless("Cossack1", CHAR_MEGAMAN))
achievement("M Square Machine No Hit", "As Mega Man, defeat the Square Machine without taking damage", 5, BossKillDamageless("Cossack2", CHAR_MEGAMAN))
achievement("M Cockroach Twins No Hit", "As Mega Man, defeat the Cockroach Twins without taking damage", 5, BossKillDamageless("Cossack3", CHAR_MEGAMAN))
achievement("M Cossack Catcher No Hit", "As Mega Man, defeat the Cossack Catcher without taking damage", 5, BossKillDamageless("Cossack4", CHAR_MEGAMAN))

achievement("M Mothraya No Special Weapons", "As Mega Man, defeat Mothraya with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons("Cossack1", CHAR_MEGAMAN))
achievement("M Square Machine No Special Weapons", "As Mega Man, defeat the Square Machine with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons("Cossack2", CHAR_MEGAMAN))
achievement("M Cockroach Twins No Special Weapons", "As Mega Man, defeat the Cockroach Twins with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons("Cossack3", CHAR_MEGAMAN))
achievement("M Cossack Catcher No Special Weapons", "As Mega Man, defeat the Cossack Catcher with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons("Cossack4", CHAR_MEGAMAN, bossDeadHealth = 0x02))

achievement("Metall Daddy", "Defeat Metall Daddy", 5, BossKill("Wily1"))
achievement("Tako Trash", "Defeat Tako Trash", 5, BossKill("Wily2"))
achievement("Wily Machine 4", "Defeat Wily Machine 4", 5, BossKill("Wily3", requiredCheckpoint = CHECKPOINT_FINISHED_BOSS_RUSH, bossLifeBarCount = 2))
achievement("Wily Capsule", "Defeat Wily Capsule", 5, BossKill("Wily4", requiredCheckpoint = CHECKPOINT_NONE))

achievement("M Wily 1 Stage No Hit", "As Mega Man, reach Wily 1's boss doors without taking damage or dying", 10, BossDoorDamageless("Wily1", CHAR_MEGAMAN))
achievement("M Wily 2 Stage No Hit", "As Mega Man, reach Wily 2's boss doors without taking damage or dying", 10, BossDoorDamageless("Wily2", CHAR_MEGAMAN))

// NOTE: This is the Boss Rush damageless achievement, it pops as soon as finishing the last boss and the capsule to the Wily Machine appears
achievement("M Wily 3 Stage No Hit", "As Mega Man, reach Wily 3's boss doors without taking damage or dying", 10, BossDoorDamageless("Wily3", CHAR_MEGAMAN, requiredCheckpoint = CHECKPOINT_FINISHED_BOSS_RUSH))

// pointless
// achievement("M Wily 4 Stage No Hit", "As Mega Man, reach Wily 4's boss doors without taking damage or dying", 10, BossDoorDamageless("Wily4", CHAR_MEGAMAN))

achievement("M Metall Daddy No Hit", "As Mega Man, defeat Metall Daddy without taking damage", 5, BossKillDamageless("Wily1", CHAR_MEGAMAN))
achievement("M Tako Trash No Hit", "As Mega Man, defeat Tako Trash without taking damage", 5, BossKillDamageless("Wily2", CHAR_MEGAMAN))
achievement("M Wily Machine 4 No Hit", "As Mega Man, defeat Wily Machine 4 without taking damage", 5, BossKillDamageless("Wily3", CHAR_MEGAMAN, requiredCheckpoint = CHECKPOINT_FINISHED_BOSS_RUSH, bossLifeBarCount = 2))
achievement("M Wily Capsule No Hit", "As Mega Man, defeat Wily Capsule without taking damage", 5, BossKillDamageless("Wily4", CHAR_MEGAMAN, requiredCheckpoint = CHECKPOINT_NONE))

achievement("M Metall Daddy No Special Weapons", "As Mega Man, defeat Metall Daddy with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons("Wily1", CHAR_MEGAMAN))
achievement("M Tako Trash No Special Weapons", "As Mega Man, defeat Tako Trash with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons("Wily2", CHAR_MEGAMAN))
achievement("M Wily Machine No Special Weapons", "As Mega Man, defeat Wily Machine 4 with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons("Wily3", CHAR_MEGAMAN, requiredCheckpoint = CHECKPOINT_FINISHED_BOSS_RUSH, bossLifeBarCount = 2))

// -- all 3 chars?
// Reach Toad Man's boss doors without taking damage or dying
// Reach Bright Man's boss doors without taking damage or dying
// Reach Pharaoh Man's boss doors without taking damage or dying
// Reach Ring Man's boss doors without taking damage or dying
// Reach Dust Man's boss doors without taking damage or dying
// Reach Skull Man's boss doors without taking damage or dying
// Reach Dive Man's boss doors without taking damage or dying
// Reach Drill Man's boss doors without taking damage or dying


// Rich Presence ------------------------------------------------------------------------------------------------------------------
livesLabels = {
    0x01: "life"
}

livesCountLabels = {
    0x00: "0", 0x01: "1", 0x02: "2", 0x03: "3", 0x04: "4", 0x05: "5", 0x06: "6", 0x07: "7", 0x08: "8", 0x09: "9",
    0x0A: "10", 0x0B: "11", 0x0C: "12", 0x0D: "13", 0x0E: "14", 0x0F: "15", 0x10: "16", 0x11: "17", 0x12: "18", 0x13: "19",
    0x14: "20", 0x15: "21", 0x16: "22", 0x17: "23", 0x18: "24", 0x19: "25", 0x1A: "26", 0x1B: "27", 0x1C: "28", 0x1D: "29",
    0x1E: "30", 0x1F: "31", 0x20: "32", 0x21: "33", 0x22: "34", 0x23: "35", 0x24: "36", 0x25: "37", 0x26: "38", 0x27: "39",
    0x28: "40", 0x29: "41", 0x2A: "42", 0x2B: "43", 0x2C: "44", 0x2D: "45", 0x2E: "46", 0x2F: "47", 0x30: "48", 0x31: "49",
    0x32: "50", 0x33: "51", 0x34: "52", 0x35: "53", 0x36: "54", 0x37: "55", 0x38: "56", 0x39: "57", 0x3A: "58", 0x3B: "59",
    0x3C: "60", 0x3D: "61", 0x3E: "62", 0x3F: "63", 0x40: "64", 0x41: "65", 0x42: "66", 0x43: "67", 0x44: "68", 0x45: "69",
    0x46: "70", 0x47: "71", 0x48: "72", 0x49: "73", 0x4A: "74", 0x4B: "75", 0x4C: "76", 0x4D: "77", 0x4E: "78", 0x4F: "79",
    0x50: "80", 0x51: "81", 0x52: "82", 0x53: "83", 0x54: "84", 0x55: "85", 0x56: "86", 0x57: "87", 0x58: "88", 0x59: "89",
    0x5A: "90", 0x5B: "91", 0x5C: "92", 0x5D: "93", 0x5E: "94", 0x5F: "95", 0x60: "96", 0x61: "97", 0x62: "98", 0x63: "Infinite"
}

// @see CurrentCharacter()
characterLabels = {
    0x00: "Mega Man",
    0x01: "Proto Man",
    0x02: "Roll",
    0x03: "Man"
}

// @see CurrentDifficulty()
difficultyLabels = {
    0x00: "Easy",
    0x01: "Normal",
    0x02: "Hard"
}

// @see STAGE_ADDRESS_MAP
stageLabels = {
    0x00: "Toad Man",
    0x01: "Dust Man",
    0x02: "Dive Man",
    0x03: "Bright Man",
    0x04: "Drill Man",
    0x05: "Skull Man",
    0x06: "Pharaoh Man",
    0x07: "Ring Man",
    0x08: "Dr. Cossack",
    0x09: "Dr. Cossack",
    0x0A: "Dr. Cossack",
    0x0B: "Dr. Cossack",
    0x0C: "Dr. Wily",
    0x0D: "Dr. Wily",
    0x0E: "Dr. Wily",
    0x0F: "Dr. Wily"
}

bossNameLabels = {
    0x00: "Toad Man",
    0x01: "Dust Man",
    0x02: "Dive Man",
    0x03: "Bright Man",
    0x04: "Drill Man",
    0x05: "Skull Man",
    0x06: "Pharaoh Man",
    0x07: "Ring Man",
    0x08: "Mothraya",
    0x09: "the Square Machine",
    0x0A: "the Cockroach Twins",
    0x0B: "the Cossack Catcher",
    0x0C: "Metall Daddy",
    0x0D: "Tako Trash",
    0x0E: "Wily Machine 4",
    0x0F: "Wily Capsule"
}

// @see CurrentCheckpoint()
checkpointLabels = {
    0x00: "Just started",
    0x01: "Halfway through"
}

doctorVillainLabels = {
    0x00: "Cossack",
    0x01: "Cossack",
    0x02: "Cossack",
    0x03: "Cossack",
    0x04: "Wily",
    0x05: "Wily",
    0x06: "Wily",
    0x07: "Wily"
}

// @see CurrentStage()
doctorVillainStageIntroLabels = {
    0x08: "first",
    0x09: "second",
    0x0A: "third",
    0x0B: "fourth",
    0x0C: "first",
    0x0D: "second",
    0x0E: "third",
    0x0F: "fourth"
}

rich_presence_conditional_display(CanonicalGameState() == STATE_GAME_INTRO, "Watching the intro")
rich_presence_conditional_display(IsDemoPlaying() == 1, "On the game title screen")
rich_presence_conditional_display(CanonicalGameState() == STATE_FILE_SELECT, "Selecting a file")
rich_presence_conditional_display(CanonicalGameState() == STATE_MAIN_SETTINGS, "Adjusting the main game settings")
rich_presence_conditional_display(CanonicalGameState() == STATE_MEGAMAN_GAME_SELECT, "Selecting which Mega Man game to play")
rich_presence_conditional_display(CanonicalGameState() == STATE_MM4_INTRO_CUTSCENE, "Watching the Mega Man 4 intro")
rich_presence_conditional_display(CanonicalGameState() == STATE_MM4_TITLE_SCREEN, "On the Mega Man 4 title screen")
rich_presence_conditional_display(CanonicalGameState() == STATE_ENTER_PASSWORD_SCREEN, "Entering a password")
rich_presence_conditional_display(CanonicalGameState() == STATE_MM4_SETTINGS, "Adjusting the Mega Man 4 game settings")
rich_presence_conditional_display(CanonicalGameState() == STATE_FREE_PLAY_MENU, "On the Free Play menu")

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_ENDING_ONE || CanonicalGameState() == STATE_ENDING_TWO),
    "{0} • {1} • Watching the ending",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels)
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_CREDITS,
    "{0} • {1} • Viewing the credits. Thanks for playing! 🎉",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels)
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_STAGE_SELECT,
    "{0} • {1} • {2}/8 • {3} {4} • Stage Select Screen",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_LEVEL_INTRO,
    "Watching the intro to {0}'s stage",
    rich_presence_lookup("Stage", CurrentStage(), stageLabels, "a bad guy")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() < COSSACK_ONE && (CurrentCheckpoint() == CHECKPOINT_NONE || CurrentCheckpoint() == CHECKPOINT_MID),
    "{0} • {1} • {2}/8 • {3} {4} • {5} {6}'s stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Checkpoint Label", CurrentCheckpoint(), checkpointLabels, "In"),
    rich_presence_lookup("Stage", CurrentStage(), stageLabels, "a bad guy")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == WILY_THREE && (CurrentCheckpoint() == CHECKPOINT_END),
    "{0} • {1} • {2}/8 • {3} {4} • In the Boss Rush of Dr. Wily's third stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == WILY_THREE && CurrentCheckpoint() == CHECKPOINT_FINISHED_BOSS_RUSH,
    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily Machine 4",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == WILY_FOUR && BossActive() == BOSS_ACTIVE_WILY_CAPSULE,
    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily Capsule",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() >= COSSACK_ONE && (CurrentCheckpoint() == CHECKPOINT_NONE || CurrentCheckpoint() == CHECKPOINT_MID),
    "{0} • {1} • {2}/8 • {3} {4} • {5} {6}'s {7} stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Checkpoint Label", CurrentCheckpoint(), checkpointLabels, "In"),
    rich_presence_lookup("Stage", CurrentStage(), stageLabels, "a bad guy"),
    rich_presence_lookup("EndStage", CurrentStage(), doctorVillainStageIntroLabels, "endgame")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && (CurrentCheckpoint() == CHECKPOINT_END),
    "{0} • {1} • {2}/8 • {3} {4} • Fighting {5}",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Boss Name", CurrentStage(), bossNameLabels, "a bad guy")
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_SAVE_OR_CONTINUE_SCREEN,
    "{0} • {1} • {2}/8 • Save or Continue Screen",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A)))
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_GAME_OVER,
    "{0} • {1} • Game Over",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A)))
)

// FIXME: It seems this can show "Getting Dr. Wily's weapon"
rich_presence_conditional_display(
    CanonicalGameState() == STATE_WEAPON_GET,
    "{0} • {1} • {2}/8 • {3} {4} • Getting {5}'s weapon",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Stage", CurrentStage(), stageLabels, "a bad guy")
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_COSSACK_WILY_LEVEL_INTRO_SCREEN,
    "{0} • {1} • Preparing to enter a Dr. {2} stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_lookup("Villain Name", CastleStagesBeaten(), doctorVillainLabels, "Cossack")
)

rich_presence_display("Playing Mega Man 4")
