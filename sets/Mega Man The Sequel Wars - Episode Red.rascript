// ~Homebrew~ Mega Man: The Sequel Wars - Episode Red
// #ID = 24453

// TODO: no banned settings achievement
// TODO: Mega Man and Man are synonymous
// TODO: Make sure boss no hit & boss no special achievements work during boss rush
// TODO: make sure necessary achievements are protected against Free Play mode
// TODO: v1.0 support?
// TODO: be sure to mark missables

// #region Memory Symbols -----------------------------------------------------------------------------------------------------------------
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

// Anything marked as unsafe did not come from the symbols file. These need to be checked on every patch.
_UNSAFE_MEM_BOSSRUSHDEADA  = 0x2852
_UNSAFE_MEM_BOSSRUSHDEADB  = 0x2853
// #endregion

// #region Memory -------------------------------------------------------------------------------------------------------------------------
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

function BossRushEnemiesKilledA() => byte(_UNSAFE_MEM_BOSSRUSHDEADA)
function BossRushEnemiesKilledB() => byte(_UNSAFE_MEM_BOSSRUSHDEADB)

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

function WeaponsEarnedA() => byte(_MEM_WEPUNLOCKED_A)
function WeaponsEarnedB() => byte(_MEM_WEPUNLOCKED_B)
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
SCREEN_BOSS_RUSH_ROOM = 0x1E
// #endregion Memory

// #region Utils --------------------------------------------------------------------------------------------------------------------------
BOSS_ACTIVE_WILY_CAPSULE = 0x0A // @see BossActive()
COSSACK_ONE = 0x08 // @see CurrentStage()
MAX_HEALTH = 0x1C // @see BossHealth() and CurrentHealth()
WILY_THREE = 0x0E // @see CurrentStage()
WILY_FOUR = 0x0F // @see CurrentStage()

// @see _MEM_CURSCREEN
BOSS_SCREENS = {
    "TOAD_MAN": {"previous": [0xD2, 0x1D], "current": [0xD3, 0x21]},
    "BRIGHT_MAN": {"previous": [0x15, 0x1D], "current": [0x16, 0x23]},
    "PHARAOH_MAN": {"previous": [0xB6, 0x1D], "current": [0xB7, 0x1C]},
    "RING_MAN": {"previous": [0x8F, 0x1D], "current": [0x90, 0x1B]},
    "DUST_MAN": {"previous": [0x11, 0x1D], "current": [0x12, 0x1F]},
    "SKULL_MAN": {"previous": [0x30, 0x1D], "current": [0x31, 0x18]},
    "DIVE_MAN": {"previous": [0x53, 0x1D], "current": [0x54, 0x20]},
    "DRILL_MAN": {"previous": [0x1E, 0x1D], "current": [0x1F, 0x22]},
    "COSSACK1": {"previous": [0x0B], "current": [0x0C]},
    "COSSACK2": {"previous": [0x07], "current": [0x08]},
    "COSSACK3": {"previous": [0x0D], "current": [0x0E]},
    "COSSACK4": {"previous": [0x68], "current": [0x69]},
    "WILY1": {"previous": [0x0B], "current": [0x0C]},
    "WILY2": {"previous": [0x0A], "current": [0x0C]},
    "WILY3": {"previous": [0x1D], "current": [0x19]},
    "WILY4": {"previous": [0x13], "current": [0x14]}
}

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

function HasTransitionedBetweenScreens(previousScreens = [], currentScreens = []) {
    condition = always_true()
    
    iterator = 0
    for previousScreen in previousScreens {
        if (iterator == 0) {
            condition =
                once(prev(CurrentScreen()) == previousScreens[0] && CurrentScreen() == currentScreens[0])
        }

        if (iterator == 1) {
            condition =
                once(prev(CurrentScreen()) == previousScreens[0] && CurrentScreen() == currentScreens[0])
                || once(prev(CurrentScreen()) == previousScreens[1] && CurrentScreen() == currentScreens[1])
        }

        if (iterator == 2) {
            condition =
                once(prev(CurrentScreen()) == previousScreens[0] && CurrentScreen() == currentScreens[0])
                || once(prev(CurrentScreen()) == previousScreens[1] && CurrentScreen() == currentScreens[1])
                || once(prev(CurrentScreen()) == previousScreens[2] && CurrentScreen() == currentScreens[2])
        }
            
        iterator = iterator + 1
    }

    return condition
}

RequiresAnyCharacter = 0
RequiresMegaManOrMan = 1
RequiresMegaManOrProtoManOrMan = 2
RequiresProtoMan = 3
RequiresRoll = 4

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
function IsUsingRequiredCharacters(requiredCharacters = 0x00) {
    condition = always_true()

    if (requiredCharacters == RequiresMegaManOrMan) {
        condition = (CurrentCharacter() == CHAR_MEGAMAN || CurrentCharacter() == CHAR_MAN)
    } else if (requiredCharacters == RequiresMegaManOrProtoManOrMan) {
        condition = (CurrentCharacter() == CHAR_MEGAMAN || CurrentCharacter() == CHAR_PROTOMAN || CurrentCharacter() == CHAR_MAN)
    } else if (requiredCharacters == RequiresProtoMan) {
        condition = (CurrentCharacter() == CHAR_PROTOMAN)
    } else if (requiredCharacters == RequiresRoll) {
        condition = (CurrentCharacter() == CHAR_ROLL)
    }

    return condition
}

function RequireNewFileWithoutPasswords() {
    return 
        disable_when(
            CanonicalGameState() == STATE_MM4_TITLE_SCREEN && WeaponsEarnedA() != 0 && WeaponsEarnedB() != 0,
            CanonicalGameState() == STATE_FILE_SELECT
        )
        && disable_when(CanonicalGameState() == STATE_MM4_SETTINGS && prev(CanonicalGameState()) == STATE_ENTER_PASSWORD_SCREEN)
}
// #endregion Utils

// #region Achievement Functions ----------------------------------------------------------------------------------------------------------

// @param screensMap {previous: [], current: []} - The screens associated with immediately before & during the boss fight.
// @param bossDeadHealth - At what health will victory be achieved? Some bosses like Cossack Catcher trigger a cutscene on 2HP.
// @param bossLifeBarCount - Does this boss have multiple forms? If so, we have to trigger the achievement on killing the final form.
// @param requiredDifficulty {0x01: DIFFICULTY_MEDIUM} - The difficulty level required for the achievement to unlock.
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
function BossKill(screensMap = {}, bossDeadHealth = 0, bossLifeBarCount = 1, requiredDifficulty = 0x01, requiredCharacters = 0x00) {
    start = HasTransitionedBetweenScreens(screensMap["previous"], screensMap["current"])
    cancel = never(PlayerDead())

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(requiredCharacters)
        && CurrentDifficulty() >= requiredDifficulty
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

// @param screensMap {previous: [], current: []} - The screens associated with immediately before & during the boss fight.
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param bossDeadHealth - At what health will victory be achieved? Some bosses like Cossack Catcher trigger a cutscene on 2HP.
// @param bossLifeBarCount - Does this boss have multiple forms? If so, we have to trigger the achievement on killing the final form.
function BossKillNoSpecialWeapons(screensMap = {}, requiredCharacters = 0x00, bossDeadHealth = 0, bossLifeBarCount = 1) {
    start = HasTransitionedBetweenScreens(screensMap["previous"], screensMap["current"])

    cancel = 
        never(PlayerDead()) 
        && never(IsShootingSpecialWeapon())
        && never(TotalETanksLeft() < prev(TotalETanksLeft()))

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(requiredCharacters)
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

function BossRushNoSpecialWeapons(requiredCharacters = 0x00) {
    start =
        once(
            CanonicalGameState() == STATE_LEVEL
            && CurrentStage() == STAGE_ADDRESS_MAP["Wily3"]
            && CurrentCheckpoint() == CHECKPOINT_END // CHECKPOINT_END is the boss rush room
            && BossRushEnemiesKilledA() == 0
            && BossRushEnemiesKilledB() == 0
            && CurrentScreen() == SCREEN_BOSS_RUSH_ROOM
        )

    cancel =
        never(PlayerDead())
        && never(IsShootingSpecialWeapon())
        && never(TotalETanksLeft() < prev(TotalETanksLeft()))

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(requiredCharacters)
        && trigger_when(BossRushEnemiesKilledA() == 0xFE && BossRushEnemiesKilledB() == 0x01)
}

// @param screensMap {previous: [], current: []} - The screens associated with immediately before & during the boss fight.
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param bossDeadHealth - At what health will victory be achieved? Some bosses like Cossack Catcher trigger a cutscene on 2HP.
// @param bossLifeBarCount - Does this boss have multiple forms? If so, we have to trigger the achievement on killing the final form.
function BossKillDamageless(screensMap = {}, requiredCharacters = 0x00, bossDeadHealth = 0, bossLifeBarCount = 1) {
    start = HasTransitionedBetweenScreens(screensMap["previous"], screensMap["current"])

    cancel = 
        never(PlayerDead())
        && never(CurrentHealth() < prev(CurrentHealth()))

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(requiredCharacters)
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

// @param bossKey - Make sure the player is on the correct stage (see: STAGE_ADDRESS_MAP)
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param requiredCheckpoint {0x02: CHECKPOINT_END} - Make sure the player has reached the correct stage checkpoint
function BossDoorDamageless(bossKey = "Toad", requiredCharacters = 0x00, requiredCheckpoint = 0x02) {
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
        && IsUsingRequiredCharacters(requiredCharacters)
        && CurrentStage() == STAGE_ADDRESS_MAP[bossKey]
        && trigger_when(CurrentCheckpoint() == requiredCheckpoint)
}
// #endregion Achievement Functions

// #region Achievements -------------------------------------------------------------------------------------------------------------------

// TODO: some kind of invalid settings detected icon that persists?
// maybe show this icon on the modifiers screen for MM4

achievement("Rain Flush", "Defeat Toad Man", 5, BossKill(BOSS_SCREENS["TOAD_MAN"]))
achievement("Flash Stopper", "Defeat Bright Man", 5, BossKill(BOSS_SCREENS["BRIGHT_MAN"]))
achievement("Pharaoh Shot", "Defeat Pharaoh Man", 5, BossKill(BOSS_SCREENS["PHARAOH_MAN"]))
achievement("Ring Boomerang", "Defeat Ring Man", 5, BossKill(BOSS_SCREENS["RING_MAN"]))
achievement("Dust Crusher", "Defeat Dust Man", 5, BossKill(BOSS_SCREENS["DUST_MAN"]))
achievement("Skull Barrier", "Defeat Skull Man", 5, BossKill(BOSS_SCREENS["SKULL_MAN"]))
achievement("Dive Missile", "Defeat Dive Man", 5, BossKill(BOSS_SCREENS["DIVE_MAN"]))
achievement("Drill Bomb", "Defeat Drill Man", 5, BossKill(BOSS_SCREENS["DRILL_MAN"]))

achievement("Toad Man Stage Damageless", "Reach Toad Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Toad", RequiresAnyCharacter))
achievement("Bright Man Stage Damageless", "Reach Bright Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Bright", RequiresAnyCharacter))
achievement("Pharaoh Man Stage Damageless", "Reach Pharaoh Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Pharaoh", RequiresAnyCharacter))
achievement("Ring Man Stage Damageless", "Reach Ring Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Ring", RequiresAnyCharacter))
achievement("Dust Man Stage Damageless", "Reach Dust Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Dust", RequiresAnyCharacter))
achievement("Skull Man Stage Damageless", "Reach Skull Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Skull", RequiresAnyCharacter))
achievement("Dive Man Stage Damageless", "Reach Dive Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Dive", RequiresAnyCharacter))
achievement("Drill Man Stage Damageless", "Reach Drill Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Drill", RequiresAnyCharacter))

achievement("M Toad Man Buster Only", "As Mega Man, defeat Toad Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["TOAD_MAN"], RequiresMegaManOrMan))
achievement("M Bright Man Buster Only", "As Mega Man, defeat Bright Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["BRIGHT_MAN"], RequiresMegaManOrMan))
achievement("M Pharaoh Man Buster Only", "As Mega Man, defeat Pharaoh Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["PHARAOH_MAN"], RequiresMegaManOrMan))
achievement("M Ring Man Buster Only", "As Mega Man, defeat Ring Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["RING_MAN"], RequiresMegaManOrMan))
achievement("M Dust Man Buster Only", "As Mega Man, defeat Dust Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DUST_MAN"], RequiresMegaManOrMan))
achievement("M Skull Man Buster Only", "As Mega Man, defeat Skull Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["SKULL_MAN"], RequiresMegaManOrMan))
achievement("M Dive Man Buster Only", "As Mega Man, defeat Dive Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DIVE_MAN"], RequiresMegaManOrMan))
achievement("M Drill Man Buster Only", "As Mega Man, defeat Drill Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DRILL_MAN"], RequiresMegaManOrMan))

achievement("P Toad Man Buster Only", "As Proto Man, defeat Toad Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["TOAD_MAN"], RequiresProtoMan))
achievement("P Bright Man Buster Only", "As Proto Man, defeat Bright Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["BRIGHT_MAN"], RequiresProtoMan))
achievement("P Pharaoh Man Buster Only", "As Proto Man, defeat Pharaoh Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["PHARAOH_MAN"], RequiresProtoMan))
achievement("P Ring Man Buster Only", "As Proto Man, defeat Ring Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["RING_MAN"], RequiresProtoMan))
achievement("P Dust Man Buster Only", "As Proto Man, defeat Dust Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DUST_MAN"], RequiresProtoMan))
achievement("P Skull Man Buster Only", "As Proto Man, defeat Skull Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["SKULL_MAN"], RequiresProtoMan))
achievement("P Dive Man Buster Only", "As Proto Man, defeat Dive Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DIVE_MAN"], RequiresProtoMan))
achievement("P Drill Man Buster Only", "As Proto Man, defeat Drill Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DRILL_MAN"], RequiresProtoMan))

achievement("R Toad Man Broom Only", "As Roll, defeat Toad Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["TOAD_MAN"], RequiresRoll))
achievement("R Bright Man Broom Only", "As Roll, defeat Bright Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["BRIGHT_MAN"], RequiresRoll))
achievement("R Pharaoh Man Broom Only", "As Roll, defeat Pharaoh Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["PHARAOH_MAN"], RequiresRoll))
achievement("R Ring Man Broom Only", "As Roll, defeat Ring Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["RING_MAN"], RequiresRoll))
achievement("R Dust Man Broom Only", "As Roll, defeat Dust Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DUST_MAN"], RequiresRoll))
achievement("R Skull Man Broom Only", "As Roll, defeat Skull Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["SKULL_MAN"], RequiresRoll))
achievement("R Dive Man Broom Only", "As Roll, defeat Dive Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DIVE_MAN"], RequiresRoll))
achievement("R Drill Man Broom Only", "As Roll, defeat Drill Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DRILL_MAN"], RequiresRoll))

achievement("Toad Man Damageless", "Defeat Toad Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["TOAD_MAN"], RequiresAnyCharacter))
achievement("Bright Man Damageless", "Defeat Bright Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["BRIGHT_MAN"], RequiresAnyCharacter))
achievement("Pharaoh Man Damageless", "Defeat Pharaoh Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["PHARAOH_MAN"], RequiresAnyCharacter))
achievement("Ring Man Damageless", "Defeat Ring Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["RING_MAN"], RequiresAnyCharacter))
achievement("Dust Man Damageless", "Defeat Dust Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["DUST_MAN"], RequiresAnyCharacter))
achievement("Skull Man Damageless", "Defeat Skull Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["SKULL_MAN"], RequiresAnyCharacter))
achievement("Dive Man Damageless", "Defeat Dive Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["DIVE_MAN"], RequiresAnyCharacter))
achievement("Drill Man Damageless", "Defeat Drill Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["DRILL_MAN"], RequiresAnyCharacter))

achievement("Mothraya", "Defeat Mothraya", 5, BossKill(BOSS_SCREENS["COSSACK1"]))
achievement("Square Machine", "Defeat the Square Machine", 5, BossKill(BOSS_SCREENS["COSSACK2"]))
achievement("Cockroach Twins", "Defeat the Cockroach Twins", 5, BossKill(BOSS_SCREENS["COSSACK3"]))
achievement("Cossack Catcher", "Defeat the Cossack Catcher", 5, BossKill(BOSS_SCREENS["COSSACK4"], bossDeadHealth = 0x02))

achievement("Cossack 1 Stage Damageless", "Reach Cossack 1's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack1", RequiresAnyCharacter))
achievement("Cossack 2 Stage Damageless", "Reach Cossack 2's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack2", RequiresAnyCharacter))
achievement("Cossack 3 Stage Damageless", "Reach Cossack 3's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack3", RequiresAnyCharacter))
achievement("Cossack 4 Stage Damageless", "Reach Cossack 4's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack4", RequiresAnyCharacter))

achievement("M Mothraya Buster Only", "As Mega Man, defeat Mothraya with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK1"], RequiresMegaManOrMan))
achievement("M Square Machine Buster Only", "As Mega Man, defeat the Square Machine with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK2"], RequiresMegaManOrMan))
achievement("M Cockroach Twins Buster Only", "As Mega Man, defeat the Cockroach Twins with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK3"], RequiresMegaManOrMan))
achievement("M Cossack Catcher Buster Only", "As Mega Man, defeat the Cossack Catcher with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK4"], RequiresMegaManOrMan, bossDeadHealth = 0x02))

achievement("P Mothraya Buster Only", "As Proto Man, defeat Mothraya with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK1"], RequiresProtoMan))
achievement("P Square Machine Buster Only", "As Proto Man, defeat the Square Machine with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK2"], RequiresProtoMan))
achievement("P Cockroach Twins Buster Only", "As Proto Man, defeat the Cockroach Twins with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK3"], RequiresProtoMan))
achievement("P Cossack Catcher Buster Only", "As Proto Man, defeat the Cossack Catcher with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK4"], RequiresProtoMan, bossDeadHealth = 0x02))

achievement("R Mothraya Broom Only", "As Roll, defeat Mothraya with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK1"], RequiresRoll))
achievement("R Square Machine Broom Only", "As Roll, defeat the Square Machine with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK2"], RequiresRoll))
achievement("R Cockroach Twins Broom Only", "As Roll, defeat the Cockroach Twins with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK3"], RequiresRoll))
achievement("R Cossack Catcher Broom Only", "As Roll, defeat the Cossack Catcher with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK4"], RequiresRoll, bossDeadHealth = 0x02))

achievement("Mothraya Damageless", "Defeat Mothraya without taking damage", 5, BossKillDamageless(BOSS_SCREENS["COSSACK1"], RequiresAnyCharacter))
achievement("Square Machine Damageless", "Defeat the Square Machine without taking damage", 5, BossKillDamageless(BOSS_SCREENS["COSSACK2"], RequiresAnyCharacter))
achievement("Cockroach Twins Damageless", "Defeat the Cockroach Twins without taking damage", 5, BossKillDamageless(BOSS_SCREENS["COSSACK3"], RequiresAnyCharacter))
achievement("Cossack Catcher Damageless", "Defeat the Cossack Catcher without taking damage", 5, BossKillDamageless(BOSS_SCREENS["COSSACK4"], RequiresAnyCharacter))

achievement("Metall Daddy", "Defeat Metall Daddy", 5, BossKill(BOSS_SCREENS["WILY1"]))
achievement("Tako Trash", "Defeat Tako Trash", 5, BossKill(BOSS_SCREENS["WILY2"]))
achievement("Wily Machine 4", "Defeat Wily Machine 4", 5, BossKill(BOSS_SCREENS["WILY3"], bossLifeBarCount = 2))

achievement("Mega Man Normal Clear", "As Mega Man, beat the game on Normal or greater without the use of passwords", 10, RequireNewFileWithoutPasswords() && BossKill(BOSS_SCREENS["WILY4"], requiredCharacters = RequiresMegaManOrMan, requiredDifficulty = DIFFICULTY_MEDIUM))
achievement("Mega Man Hard Clear", "As Mega Man, beat the game on Hard without the use of passwords", 25, RequireNewFileWithoutPasswords() && BossKill(BOSS_SCREENS["WILY4"], requiredCharacters = RequiresMegaManOrMan, requiredDifficulty = DIFFICULTY_HARD))
achievement("Proto Man Normal Clear", "As Proto Man, beat the game on Normal or greater without the use of passwords", 10, RequireNewFileWithoutPasswords() && BossKill(BOSS_SCREENS["WILY4"], requiredCharacters = RequiresProtoMan, requiredDifficulty = DIFFICULTY_MEDIUM))
achievement("Proto Man Hard Clear", "As Proto Man, beat the game on Hard without the use of passwords", 25, RequireNewFileWithoutPasswords() && BossKill(BOSS_SCREENS["WILY4"], requiredCharacters = RequiresProtoMan, requiredDifficulty = DIFFICULTY_HARD))
achievement("Roll Normal Clear", "As Roll, beat the game on Normal or greater without the use of passwords", 10, RequireNewFileWithoutPasswords() && BossKill(BOSS_SCREENS["WILY4"], requiredCharacters = RequiresRoll, requiredDifficulty = DIFFICULTY_MEDIUM))
achievement("Roll Hard Clear", "As Roll, beat the game on Hard without the use of passwords", 25, RequireNewFileWithoutPasswords() && BossKill(BOSS_SCREENS["WILY4"], requiredCharacters = RequiresRoll, requiredDifficulty = DIFFICULTY_HARD))

achievement("Wily 1 Stage Damageless", "Reach Wily 1's boss doors without taking damage or dying", 10, BossDoorDamageless("Wily1", RequiresAnyCharacter))
achievement("Wily 2 Stage Damageless", "Reach Wily 2's boss doors without taking damage or dying", 10, BossDoorDamageless("Wily2", RequiresAnyCharacter))

achievement("M Metall Daddy Buster Only", "As Mega Man, defeat Metall Daddy with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY1"], RequiresMegaManOrMan))
achievement("M Tako Trash Buster Only", "As Mega Man, defeat Tako Trash with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY2"], RequiresMegaManOrMan))
achievement("M Wily Machine Buster Only", "As Mega Man, defeat Wily Machine 4 with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY3"], RequiresMegaManOrMan, bossLifeBarCount = 2))

achievement("P Metall Daddy Buster Only", "As Proto Man, defeat Metall Daddy with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY1"], RequiresProtoMan))
achievement("P Tako Trash Buster Only", "As Proto Man, defeat Tako Trash with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY2"], RequiresProtoMan))
achievement("P Wily Machine Buster Only", "As Proto Man, defeat Wily Machine 4 with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY3"], RequiresProtoMan, bossLifeBarCount = 2))

achievement("R Metall Daddy Broom Only", "As Roll, defeat Metall Daddy with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY1"], RequiresRoll))
achievement("R Tako Trash Broom Only", "As Roll, defeat Tako Trash with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY2"], RequiresRoll))
achievement("R Wily Machine Broom Only", "As Roll, defeat Wily Machine 4 with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY3"], RequiresRoll, bossLifeBarCount = 2))

achievement("Metall Daddy Damageless", "Defeat Metall Daddy without taking damage", 5, BossKillDamageless(BOSS_SCREENS["WILY1"], RequiresAnyCharacter))
achievement("Tako Trash Damageless", "Defeat Tako Trash without taking damage", 5, BossKillDamageless(BOSS_SCREENS["WILY2"], RequiresAnyCharacter))
achievement("Wily Machine 4 Damageless", "Defeat Wily Machine 4 without taking damage", 5, BossKillDamageless(BOSS_SCREENS["WILY3"], RequiresAnyCharacter, bossLifeBarCount = 2))
achievement("Wily Capsule Damageless", "Defeat Wily Capsule without taking damage", 5, BossKillDamageless(BOSS_SCREENS["WILY4"], RequiresAnyCharacter))

achievement("M No Time for Refills", "Without dying, defeat all 8 Robot Masters in the boss rush using only the M. Buster [No E-Tanks]", 25, BossRushNoSpecialWeapons(RequiresMegaManOrMan))
achievement("P No Time for Refills", "Without dying, defeat all 8 Robot Masters in the boss rush using only the P. Buster [No E-Tanks]", 25, BossRushNoSpecialWeapons(RequiresProtoMan))
achievement("R No Time for Refills", "Without dying, defeat all 8 Robot Masters in the boss rush using only the R. Broom [No E-Tanks]", 25, BossRushNoSpecialWeapons(RequiresRoll))

// TODO: all 3 chars, boss rush, one life, no special weapons
// TODO: basic weapon whole game
// TODO: no continues
// TODO: no deaths
// TODO: 60 minutes or less in one sitting
// TODO: character leaderboards

// #endregion Achievements

// #region Rich Presence ------------------------------------------------------------------------------------------------------------------
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

// @see CURRENT_EQUIPPED_WEAPON
stageWeaponMegaManLabels = {
    0x01: "Skull Barrier",
    0x02: "Drill Bomb",
    0x03: "Rain Flush",
    0x04: "Dust Crusher",
    0x05: "Ring Boomerang",
    0x06: "Dive Missile",
    0x07: "Pharaoh Shot",
    0x08: "Flash Stopper",
    0x09: "Rush Coil",
    0x0A: "Rush Jet",
    0x0B: "Rush Marine",
    0x0C: "Balloon",
    0x0D: "Wire"
}

stageWeaponProtoManLabels = {
    0x01: "Skull Barrier",
    0x02: "Drill Bomb",
    0x03: "Rain Flush",
    0x04: "Dust Crusher",
    0x05: "Ring Boomerang",
    0x06: "Dive Missile",
    0x07: "Pharaoh Shot",
    0x08: "Flash Stopper",
    0x09: "Proto Coil",
    0x0A: "Proto Jet",
    0x0B: "Proto Marine",
    0x0C: "Balloon",
    0x0D: "Wire"
}

stageWeaponRollLabels = {
    0x01: "Skull Barrier",
    0x02: "Drill Bomb",
    0x03: "Rain Flush",
    0x04: "Dust Crusher",
    0x05: "Ring Boomerang",
    0x06: "Dive Missile",
    0x07: "Pharaoh Shot",
    0x08: "Flash Stopper",
    0x09: "Tango Coil",
    0x0A: "Tango Jet",
    0x0B: "Tango Marine",
    0x0C: "Balloon",
    0x0D: "Wire"
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

bossRushEnemyLabels = {
    0x21: "Toad Man",
    0x23: "Bright Man",
    0x1C: "Pharaoh Man",
    0x1B: "Ring Man",
    0x1F: "Dust Man",
    0x18: "Skull Man",
    0x20: "Dive Man",
    0x22: "Drill Man"
}
bossRushEnemyRooms = [0x21, 0x23, 0x1C, 0x1B, 0x1F, 0x18, 0x20, 0x22]
rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == WILY_THREE
    && CurrentStage() == WILY_THREE 
    && (CurrentCheckpoint() == CHECKPOINT_END)
    && any_of(bossRushEnemyRooms, r => CurrentScreen() == r),

    "{0} • {1} • {2}/8 • {3} {4} • Fighting {5} in the Boss Rush",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Boss Rush Enemy Label", CurrentScreen(), bossRushEnemyLabels, "a bad guy")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() == WILY_THREE 
    && (CurrentCheckpoint() == CHECKPOINT_END),

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

rich_presence_conditional_display(
    CanonicalGameState() == STATE_WEAPON_GET && IsUsingRequiredCharacters(RequiresMegaManOrMan),
    "{0} • {1} • {2}/8 • {3} {4} • Learning {5}",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Mega Man Weapon", CurrentEquippedWeapon(), stageWeaponMegaManLabels, "a new weapon")
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_WEAPON_GET && IsUsingRequiredCharacters(RequiresProtoMan),
    "{0} • {1} • {2}/8 • {3} {4} • Learning {5}",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Proto Man Weapon", CurrentEquippedWeapon(), stageWeaponProtoManLabels, "a new weapon")
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_WEAPON_GET && IsUsingRequiredCharacters(RequiresRoll),
    "{0} • {1} • {2}/8 • {3} {4} • Learning {5}",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Roll Weapon", CurrentEquippedWeapon(), stageWeaponRollLabels, "a new weapon")
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_COSSACK_WILY_LEVEL_INTRO_SCREEN,
    "{0} • {1} • Preparing to enter a Dr. {2} stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_lookup("Villain Name", CastleStagesBeaten(), doctorVillainLabels, "Cossack")
)

rich_presence_display("Playing Mega Man 4")
// #endregion Rich Presence