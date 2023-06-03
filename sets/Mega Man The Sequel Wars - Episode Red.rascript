// ~Homebrew~ Mega Man: The Sequel Wars - Episode Red
// #ID = 24453

// Credits:
// Woodfrog, Sequel Wars Team - Game Programming, Memory Assistance, Pointers Assistance, Game Icon
// Fox in Yellow Socks, Sequel Wars Team - Dev Team Challenges, Achievement Concepts
// Cykette, RetroAchievements - Lead Quality Assurance, Playtesting
// frijoles, Sequel Wars Team - Achievement Concepts, Playtesting, Subset Icon
// Lion Sum, Sequel Wars Team - Achievement Concepts
// JackelZXA, Sequel Wars Team - Achievement Concepts
// SonicFan1, Sequel Wars Team - Playtesting
// FlashbackYT, RetroAchievements - Achievement Concepts
// televandalist, RetroAchievements - Artwork Assistance

// Special Thanks:
// purplem1lk, suspect15

// TODO: be sure to credit users for achievement ideas
// TODO: achievement order
// TODO: better achievement descriptions [specify settings similar to Mega Man 2 PCE]

// #region Memory Symbols -----------------------------------------------------------------------------------------------------------------
_MEM_LIVES                 = 0x01A1 - 1    // (D lives) - 1
_MEM_ETANKS                = 0x01A0 + 1    // (D etanks) + 1
_MEM_PSY                   = 0x0384        // (B psy)
_MEM_PSX                   = 0x0388        // (B psx)
_MEM_PSX_B                 = 0x0388 + 1    // (B psx)
_MEM_DISPAMMO              = 0x14B8        // (B dispammo)
_MEM_MODIFIERS_A           = 0x1D4C        // (B modifiers)
_MEM_MODIFIERS_B           = 0x1D4C + 1    // (B modifiers) + 1
_MEM_TIMER                 = 0x2562 + 1    // (B timer) + 1
_MEM_BOSSACTIVE            = 0x2650 + 1    // (B bossactive) + 1
_MEM_DEMOROUTINE           = 0x2604        // (B demoroutine)
_MEM_FIREPRESSED           = 0x2625 - 1    // (B firepressed) - 1
_MEM_JUMPPRESSED           = 0x262B - 1    // (B jumppressed) - 1
_MEM_FREEPLAY              = 0x2677 - 1    // (B freeplay) - 1
_MEM_FLASHSTOPPER          = 0x2682        // (B flashstopper)
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
_UNSAFE_MEM_COLMODE        = 0x0364        // (B colmode) - not sure if this is right
_UNSAFE_MEM_BOSSRUSHDEADA  = 0x2852
_UNSAFE_MEM_BOSSRUSHDEADB  = 0x2853
_UNSAFE_MEM_SCREENDARKNESS = 0x2E1A
_UNSAFE_MEM_QUICKSANDTIMER = 0x2E25
_UNSAFE_MEM_IFRAMETIMER    = 0x307E
_UNSAFE_MEM_ESCAPEPODYPOS  = 0x31E8
_UNSAFE_MEM_TAKOTRASHHBOX  = 0x31EC
// #endregion

// #region Constants ----------------------------------------------------------------------------------------------------------------------
ToadMan = "ToadMan"
DustMan = "DustMan"
DiveMan = "DiveMan"
BrightMan = "BrightMan"
DrillMan = "DrillMan"
SkullMan = "SkullMan"
PharaohMan = "PharaohMan"
RingMan = "RingMan"
Cossack1 = "Cossack1"
Cossack2 = "Cossack2"
Cossack3 = "Cossack3"
Cossack4 = "Cossack4"
Wily1 = "Wily1"
Wily2 = "Wily2"
Wily3 = "Wily3"
Wily4 = "Wily4"

BOSS_ACTIVE_WILY_CAPSULE = 0x0A // @see BossActive()
MAX_HEALTH = 0x1C // @see BossHealth() and CurrentHealth()

// @see _MEM_CURSCREEN
BOSS_SCREENS = {
    ToadMan: {"previous": [0xD2, 0x1D], "current": [0xD3, 0x21]},
    BrightMan: {"previous": [0x15, 0x1D], "current": [0x16, 0x23]},
    PharaohMan: {"previous": [0xB6, 0x1D], "current": [0xB7, 0x1C]},
    RingMan: {"previous": [0x8F, 0x1D], "current": [0x90, 0x1B]},
    DustMan: {"previous": [0x11, 0x1D], "current": [0x12, 0x1F]},
    SkullMan: {"previous": [0x30, 0x1D], "current": [0x31, 0x18]},
    DiveMan: {"previous": [0x53, 0x1D], "current": [0x54, 0x20]},
    DrillMan: {"previous": [0x1E, 0x1D], "current": [0x1F, 0x22]},
    Cossack1: {"previous": [0x0B], "current": [0x0C]},
    Cossack2: {"previous": [0x07], "current": [0x08]},
    Cossack3: {"previous": [0x0D], "current": [0x0E]},
    Cossack4: {"previous": [0x68], "current": [0x69]},
    Wily1: {"previous": [0x0B], "current": [0x0C]},
    Wily2: {"previous": [0x0A], "current": [0x0B]},
    Wily3: {"previous": [0x1D], "current": [0x19]},
    Wily4: {"previous": [0x13], "current": [0x14]}
}
BRIGHT_MAN_CURRENT = 0x23
MOTHRAYA_CURRENT = 0x0C
COCKROACH_CURRENT = 0x0E
COSSACK_CURRENT = 0x69
METALL_CURRENT = 0x0C
WILY_MACHINE_CURRENT = 0x19
WILY_CAPSULE_CURRENT = 0x14
// #endregion

// #region Memory -------------------------------------------------------------------------------------------------------------------------
function IsSliding() => byte(_UNSAFE_MEM_COLMODE)
function TotalLivesLeft() => byte(_MEM_LIVES)
function TotalETanksLeft() => byte(_MEM_ETANKS)
function CurrentYPosition() => byte(_MEM_PSY)
function CurrentXPosition() => byte(_MEM_PSX)
function CurrentXPositionB() => byte(_MEM_PSX_B)
function CurrentWeaponAmmo() => byte(_MEM_DISPAMMO)
function IsBurstChaserEnabled() => bit2(_MEM_MODIFIERS_A)
function IsDoubleJumpEnabled() => bit3(_MEM_MODIFIERS_A)
function IsAirSlidingEnabled() => bit4(_MEM_MODIFIERS_A)
function IsFullArsenalEnabled() => bit7(_MEM_MODIFIERS_A)
function IsInfiniteAmmoEnabled() => bit1(_MEM_MODIFIERS_B)
function IsInfiniteLivesEnabled() => bit2(_MEM_MODIFIERS_B)
function BossActive() => byte(_MEM_BOSSACTIVE)
function IsDemoPlaying() => byte(_MEM_DEMOROUTINE)
function IsFirePressed() => byte(_MEM_FIREPRESSED)
function IsJumpPressed() => byte(_MEM_JUMPPRESSED)
function IsFreePlayEnabled() => byte(_MEM_FREEPLAY)
function FlashStopperTimer() => byte(_MEM_FLASHSTOPPER)
function Timer() => byte(_MEM_TIMER)
function IframeTimer() => byte(_UNSAFE_MEM_IFRAMETIMER)
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
EQUIPPED_MM6_POWERADAPTOR = 0x24
EQUIPPED_EXITSTAGE = 0x27

function CurrentCharacter() => byte(_MEM_CHARACTER)
CHAR_MEGAMAN = 0x00
CHAR_PROTOMAN = 0x01
CHAR_ROLL = 0x02
CHAR_MAN = 0x03

function IsPlayerLocked() => byte(_MEM_PREVLOCK)

function WeaponsEarnedA() => byte(_MEM_WEPUNLOCKED_A)
function WeaponsEarnedB() => byte(_MEM_WEPUNLOCKED_B)
WEAPONS_ADDRESS_MAP = {
    "Skull": bit1(_MEM_WEPUNLOCKED_A),
    "Drill": bit2(_MEM_WEPUNLOCKED_A),
    "Toad": bit3(_MEM_WEPUNLOCKED_A),
    "Dust": bit4(_MEM_WEPUNLOCKED_A),
    "Ring": bit5(_MEM_WEPUNLOCKED_A),
    "Dive": bit6(_MEM_WEPUNLOCKED_A),
    "Pharaoh": bit7(_MEM_WEPUNLOCKED_A),
    "Bright": bit0(_MEM_WEPUNLOCKED_B),
    "Coil": bit1(_MEM_WEPUNLOCKED_B),
    "Jet": bit2(_MEM_WEPUNLOCKED_B),
    "Marine": bit3(_MEM_WEPUNLOCKED_B),
    "Balloon": bit4(_MEM_WEPUNLOCKED_B),
    "Wire": bit5(_MEM_WEPUNLOCKED_B)
}

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
STATE_WIRE_EASTER_EGG = 0x17
STATE_CREDITS = 0x18
STATE_FREE_PLAY_MENU = 0x19
STATE_ENDING_ONE = 0x1A
STATE_ENDING_TWO = 0x1B

function HighestVDPSpriteIndex() => byte(_MEM_HIGHESTVDPSPRITEINDEX)
WILY_MACHINE_FORM_ONE = 0x28
WILY_MACHINE_FORM_TWO = 0x34

function CurrentStage() => byte(_MEM_STAGE)
STAGE_ADDRESS_MAP = {
    ToadMan: 0x00,
    DustMan: 0x01,
    DiveMan: 0x02,
    BrightMan: 0x03,
    DrillMan: 0x04,
    SkullMan: 0x05,
    PharaohMan: 0x06,
    RingMan: 0x07,
    Cossack1: 0x08,
    Cossack2: 0x09,
    Cossack3: 0x0A,
    Cossack4: 0x0B,
    Wily1: 0x0C,
    Wily2: 0x0D,
    Wily3: 0x0E,
    Wily4: 0x0F
}

function ScreenDarkness() => byte(_UNSAFE_MEM_SCREENDARKNESS)
function QuicksandTimer() => byte(_UNSAFE_MEM_QUICKSANDTIMER)
function WilyBossesHitboxState() => byte(_UNSAFE_MEM_TAKOTRASHHBOX)
function WilyEscapePodYPosition() => byte(_UNSAFE_MEM_ESCAPEPODYPOS)

function CurrentScreen() => byte(_MEM_CURSCREEN)
SCREEN_BOSS_RUSH_ROOM = 0x1E
// #endregion Memory

// #region Utils --------------------------------------------------------------------------------------------------------------------------
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

function IsJumping() {
    return IsJumpPressed() == 1 && CurrentYPosition() < prev(CurrentYPosition())
}

function IsShootingAnyWeapon() {
    return IsFirePressed() == 1 && IsPauseMenuOpen() == 0
}

function IsShootingSpecialWeapon() {
    // Pharaoh Shot can be charged in the boss corridor, then released when the user
    // touches the boss door. We should protect against that exploit.
    pharaohShotProtection = (
        CurrentEquippedWeapon() == EQUIPPED_PSHOT 
        && CurrentWeaponAmmo() < prev(CurrentWeaponAmmo())
    )

    return
        pharaohShotProtection 
        || (
            IsShootingAnyWeapon()
            && CanonicalGameState() == STATE_LEVEL
            && CurrentWeaponAmmo() < prev(CurrentWeaponAmmo())
            && CurrentEquippedWeapon() != EQUIPPED_BUSTER
            && CurrentEquippedWeapon() != EQUIPPED_RCOIL
            && CurrentEquippedWeapon() != EQUIPPED_RJET
            && CurrentEquippedWeapon() != EQUIPPED_RMARINE
        )
}

// @param requiredWeapon {0x00: EQUIPPED_BUSTER} - What weapon is required for this function to return falsy
function IsShootingWrongWeapon(requiredWeapon = 0x00) {
    return IsShootingAnyWeapon() && CurrentEquippedWeapon() != requiredWeapon
}

function StageStarted() {
    previousGameState = prev(CanonicalGameState())

    // After beating a boss, their stage intro doesn't play anymore.
    return
        CanonicalGameState() == STATE_LEVEL 
        && (
            previousGameState == STATE_LEVEL_INTRO // normal gameplay
            || previousGameState == STATE_STAGE_SELECT 
            || previousGameState == STATE_MM4_SETTINGS // free play mode
        )
}

MustBeDisabled = 0
Optional = 1
MustBeEnabled = 2
// @param minimumDifficulty {0x01: DIFFICULTY_MEDIUM} - The difficulty must be set to at least this level.
// @param allowInfiniteAmmo {0 or 1}
// @param allowInfiniteLives {0 or 1}
// @param allowAirSliding {0 or 1}
// @param allowDoubleJump {0 or 1}
// @param allowFullArsenal {0, 1, or 2}
// @param allowBurstChaser {0 or 1}
function IsUsingOnlyAllowedModifiers(
    minimumDifficulty = 0x01,
    allowInfiniteAmmo = 0,
    allowInfiniteLives = 0,
    allowAirSliding = 0,
    allowDoubleJump = 0,
    allowFullArsenal = 0,
    allowBurstChaser = 0
) {
    fullArsenalClause = always_true()
    if (allowFullArsenal == MustBeDisabled) {
        fullArsenalClause = IsFullArsenalEnabled() == 0
    } else if (allowFullArsenal == MustBeEnabled) {
        fullArsenalClause = IsFullArsenalEnabled() == 1
    }

    // By using `<=` on many of these conditions, 0 means the setting
    // must be enabled, and 1 means the setting can be enabled or disabled
    // and the achievement will still unlock.
    return
        CurrentDifficulty() >= minimumDifficulty
        && IsInfiniteAmmoEnabled() <= allowInfiniteAmmo
        && IsInfiniteLivesEnabled() <= allowInfiniteLives
        && IsAirSlidingEnabled() <= allowAirSliding
        && IsDoubleJumpEnabled() <= allowDoubleJump
        && fullArsenalClause
        && IsBurstChaserEnabled() <= allowBurstChaser
}

function IsBossKilled(bossDeadHealth = 0, bossLifeBarCount = 1) {
    wilyMachineHack = always_true()
    if (bossLifeBarCount == 2) {
        wilyMachineHack = once(CurrentScreen() == WILY_MACHINE_CURRENT && HighestVDPSpriteIndex() == WILY_MACHINE_FORM_TWO)
    }

    return
        wilyMachineHack
        && (BossHealth() <= bossDeadHealth && prev(BossHealth()) > bossDeadHealth)
        && (once(IsPlayerLocked() == 0 && prev(IsPlayerLocked()) == 1))
        && once(BossHealth() < MAX_HEALTH && prev(BossHealth()) == MAX_HEALTH)
        && (prev(BossActive()) != 0) // prevents a bug where the boss pointer points at Mega Man's health
}

// @param bossKey - Make sure the player is on the correct stage (see: STAGE_ADDRESS_MAP)
// @param previousScreens - The screens associated with immediately before the boss fight.
// @param currentScreens - The screens associated with during the boss fight.
function HasTransitionedBetweenScreens(bossKey, previousScreens = [], currentScreens = []) {
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

    return condition && CurrentStage() == STAGE_ADDRESS_MAP[bossKey]
}

RequiresAnyCharacter = 0
RequiresMegaManOrMan = 1
RequiresMegaManOrProtoManOrMan = 2
RequiresProtoMan = 3
RequiresRoll = 4
RequiresMan = 5
RequiresMegaMan = 6

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
    } else if (requiredCharacters == RequiresMan) {
        condition = (CurrentCharacter() == CHAR_MAN)
    } else if (requiredCharacters == RequiresMegaMan) {
        condition = (CurrentCharacter() == CHAR_MEGAMAN)
    }

    return condition
}

function RequireWithoutPasswords() {
    return disable_when(
        CanonicalGameState() == STATE_MM4_SETTINGS 
        && prev(CanonicalGameState()) == STATE_ENTER_PASSWORD_SCREEN,
        CanonicalGameState() == STATE_GAME_INTRO
    )
}

function RequireNewFileWithoutPasswords() {
    return 
        disable_when(
            CanonicalGameState() == STATE_MM4_TITLE_SCREEN && WeaponsEarnedA() != 0 && WeaponsEarnedB() != 0,
            CanonicalGameState() == STATE_FILE_SELECT
        )
        && RequireWithoutPasswords()
}

function FreePlayChallengeReset() {
    return 
        (CanonicalGameState() != STATE_LEVEL && CanonicalGameState() != STATE_PAUSE_MENU_OPEN)
        || TotalLivesLeft() < prev(TotalLivesLeft())
        || CanonicalGameState() == STATE_FREE_PLAY_MENU
}

function ResetIfNonPlayingState() {
    clause = (
        // prevent triggers when exiting from free play
        never(CanonicalGameState() == STATE_FREE_PLAY_MENU && prev(CanonicalGameState()) == STATE_PAUSE_MENU_OPEN)

        // prevent triggers when exiting from a stage
        && never(CanonicalGameState() == STATE_SAVE_OR_CONTINUE_SCREEN && prev(CanonicalGameState()) == STATE_PAUSE_MENU_OPEN)

        // prevent premature icons
        && never(CanonicalGameState() == STATE_WEAPON_GET)
        && never(CanonicalGameState() == STATE_COSSACK_WILY_LEVEL_INTRO_SCREEN)
    )

    return clause
}

// Compute how many frames it will take to reach a certain time span.
// @param minutes {0} - How many minutes it will take
// @param seconds {0} - How many seconds it will take
// @param frames {0} - How many frames it will take
function TimeSpan(minutes = 0, seconds = 0, frames = 0) => minutes * 3600 + seconds * 60 + frames
// #endregion Utils

// #region Achievement Functions ----------------------------------------------------------------------------------------------------------
function EscarooSkip() {
    EscarooScreens = [0x8C, 0xCD]
    EscarooMaxHealth = 0x10

    start = 
        once(
            CanonicalGameState() == STATE_LEVEL 
            && CurrentStage() == STAGE_ADDRESS_MAP[ToadMan]
            && (CurrentScreen() == EscarooScreens[0] || CurrentScreen() == EscarooScreens[1])
        )

    cancel =
        never(PlayerDead())
        && disable_when(BossHealth() == EscarooMaxHealth, CurrentScreen() != prev(CurrentScreen()))

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && CurrentScreen() == (prev(CurrentScreen()) + 1)
        && FlashStopperTimer() != 0
}

function TakoTrashHitboxHidingSpot() {
    return
        CanonicalGameState() == STATE_LEVEL
        && CurrentStage() == STAGE_ADDRESS_MAP[Wily2]
        && CurrentCheckpoint() == CHECKPOINT_END
        && IsUsingOnlyAllowedModifiers()
        && WilyBossesHitboxState() == 0x02 // destroyed
        && CurrentXPosition() >= 0x06
        && CurrentXPositionB() == 0x0c
}

function WilyUmbrellaEasterEgg() {
    return
        CanonicalGameState() == STATE_LEVEL
        && CurrentStage() == STAGE_ADDRESS_MAP[Wily3]
        && CurrentCheckpoint() == CHECKPOINT_FINISHED_BOSS_RUSH
        && IsUsingOnlyAllowedModifiers()
        && WilyEscapePodYPosition() != 0x00
        && WilyBossesHitboxState() == 0x03 // umbrella enabled
}

function WireEasterEgg() {
    return 
        IsUsingOnlyAllowedModifiers()
        && (CanonicalGameState() == STATE_WIRE_EASTER_EGG && prev(CanonicalGameState()) == STATE_LEVEL)
}

// @param primeStage {STAGE_ADDRESS_MAP} - What stage this challenge lives on
// @param onlySpecificWeapon {0x00: EQUIPPED_BUSTER} - Are there any weapon restrictions while killing this boss // @see EQUIPPED_*
// @param allowETanks {0 or 1} - Can the player use E-Tanks while killing this boss
// @param allowFullArsenal {0 or 1} - Is full arsenal allowed while killing this boss
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param allowSliding {0 or 1} - Is sliding allowed while killing this boss
function FreePlayStageClear(
    primeStage,
    onlySpecificWeapon = 0,
    allowETanks = 0,
    allowFullArsenal = 0,
    requiredCharacters = 0x00,
    allowSliding = 1
) {
    allowETanksClause = always_true()
    if (allowETanks == 0) {
        allowETanksClause = disable_when(
            TotalETanksLeft() < prev(TotalETanksLeft()),
            FreePlayChallengeReset()
        )
    }

    onlySpecificWeaponClause = always_true()
    if (onlySpecificWeapon != 0) {
        onlySpecificWeaponClause = disable_when(
            IsShootingWrongWeapon(onlySpecificWeapon),
            FreePlayChallengeReset()
        )
    }

    allowSlidingClause = always_true()
    if (allowSliding == 0) {
        allowSlidingClause = disable_when(
            CanonicalGameState() == STATE_LEVEL && IsSliding() == 1,
            FreePlayChallengeReset()
        )
    }

    start =
        once(CurrentStage() == STAGE_ADDRESS_MAP[primeStage])
        && once(CurrentCheckpoint() == CHECKPOINT_NONE)

    cancel =
        never(PlayerDead() && CanonicalGameState() != STATE_FREE_PLAY_MENU && CanonicalGameState() != STATE_MM4_SETTINGS) 
        && never(CanonicalGameState() != STATE_FREE_PLAY_MENU && IsFreePlayEnabled() == 0)
        && never(CurrentStage() != STAGE_ADDRESS_MAP[primeStage])
        && never(CanonicalGameState() == STATE_FREE_PLAY_MENU && CurrentCheckpoint() != CHECKPOINT_NONE)
        && allowETanksClause
        && onlySpecificWeaponClause
        && allowSlidingClause

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers(
            minimumDifficulty = DIFFICULTY_MEDIUM,
            allowInfiniteAmmo = 0,
            allowInfiniteLives = 0,
            allowAirSliding = 0,
            allowDoubleJump = 0,
            allowFullArsenal = allowFullArsenal,
            allowBurstChaser = 0
        )
        && IsUsingRequiredCharacters(requiredCharacters)
        && trigger_when(CanonicalGameState() == STATE_LEVEL && CurrentCheckpoint() == CHECKPOINT_END)
}

function DiveManMarineChallenge() {
    start = 
        CurrentStage() == STAGE_ADDRESS_MAP[DiveMan]
        && CurrentCheckpoint() == CHECKPOINT_END

    cancel =
        never(PlayerDead() && CanonicalGameState() != STATE_FREE_PLAY_MENU && CanonicalGameState() != STATE_MM4_SETTINGS)
        && never(CanonicalGameState() != STATE_FREE_PLAY_MENU && IsFreePlayEnabled() == 0)
        && disable_when(
            CurrentHealth() < prev(CurrentHealth())
            && CurrentEquippedWeapon() == EQUIPPED_RMARINE
            && CurrentWeaponAmmo() < MAX_HEALTH,
            CanonicalGameState() == STATE_FREE_PLAY_MENU
        )
        && disable_when(
            IsShootingAnyWeapon() 
            && CurrentEquippedWeapon() == EQUIPPED_RMARINE 
            && CurrentScreen() == BOSS_SCREENS[DiveMan]["previous"][0],
            CanonicalGameState() == STATE_FREE_PLAY_MENU
        )
    
    return
        start
        && cancel
        && ResetIfNonPlayingState()
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(RequiresMegaManOrMan)
        && trigger_when(CurrentEquippedWeapon() == EQUIPPED_RMARINE && CurrentWeaponAmmo() == 0)
}

// @param primeStage {STAGE_ADDRESS_MAP} - What stage this challenge lives on
// @param currentScreen {see BOSS_SCREENS[bossKey]["current"]} - So we don't disable jump, etc outside the boss fight
// @param primeCheckpoint {0x02: CHECKPOINT_END} - On what checkpoint to prime the achievement icon
// @param bossDeadHealth - At what health will victory be achieved? Some bosses like Cossack Catcher trigger a cutscene on 2HP.
// @param bossLifeBarCount - Does this boss have multiple forms? If so, we have to trigger the achievement on killing the final form.
// @param allowFullArsenal {0 or 1} - Is full arsenal allowed while killing this boss
// @param allowJumping {0 or 1} - Is jumping allowed while killing this boss
// @param allowSliding {0 or 1} - Is sliding allowed while killing this boss
// @param allowDamage {0 or 1} - Can the player receive any damage while killing this boss
// @param allowETanks {0 or 1} - Can the player use E-Tanks while killing this boss
// @param onlySpecificWeapon {0x00: EQUIPPED_BUSTER} - Are there any weapon restrictions while killing this boss // @see EQUIPPED_*
function FreePlayBossKill(
    primeStage,
    currentScreen = 0x00,
    primeCheckpoint = 0x02,
    bossDeadHealth = 0,
    bossLifeBarCount = 1,
    allowFullArsenal = 0,
    allowJumping = 1,
    allowSliding = 1,
    allowDamage = 1,
    allowETanks = 1,
    onlySpecificWeapon = 0
) {
    allowJumpingClause = always_true()
    if (allowJumping == 0) {
        allowJumpingClause = disable_when(
            CanonicalGameState() == STATE_LEVEL && CurrentScreen() == currentScreen && IsJumping(),
            FreePlayChallengeReset()
        )
    }

    allowSlidingClause = always_true()
    if (allowSliding == 0) {
        allowSlidingClause = disable_when(
            CanonicalGameState() == STATE_LEVEL && CurrentScreen() == currentScreen && IsSliding() == 1,
            FreePlayChallengeReset()
        )
    }

    allowDamageClause = always_true()
    if (allowDamage == 0) {
        allowDamageClause = disable_when(
            CanonicalGameState() == STATE_LEVEL && CurrentScreen() == currentScreen && CurrentHealth() < prev(CurrentHealth()),
            FreePlayChallengeReset()
        )
    }

    allowETanksClause = always_true()
    if (allowETanks == 0) {
        allowETanksClause = disable_when(
            TotalETanksLeft() < prev(TotalETanksLeft()),
            FreePlayChallengeReset()
        )
    }

    onlySpecificWeaponClause = always_true()
    if (onlySpecificWeapon != 0) {
        onlySpecificWeaponClause = disable_when(
            BossActive() != 0x00 && IsShootingWrongWeapon(onlySpecificWeapon),
            FreePlayChallengeReset()
        )
    }

    start =
        CurrentStage() == STAGE_ADDRESS_MAP[primeStage]
        && CurrentCheckpoint() == primeCheckpoint

    cancel =
        never(PlayerDead() && CanonicalGameState() != STATE_FREE_PLAY_MENU && CanonicalGameState() != STATE_MM4_SETTINGS) 
        && never(CanonicalGameState() != STATE_FREE_PLAY_MENU && IsFreePlayEnabled() == 0)
        && allowJumpingClause
        && allowSlidingClause
        && allowDamageClause
        && allowETanksClause
        && onlySpecificWeaponClause

    return
        start
        && cancel
        && ResetIfNonPlayingState()
        && IsUsingOnlyAllowedModifiers(
            minimumDifficulty = DIFFICULTY_MEDIUM,
            allowInfiniteAmmo = 0,
            allowInfiniteLives = 0,
            allowAirSliding = 0,
            allowDoubleJump = 0,
            allowFullArsenal = allowFullArsenal,
            allowBurstChaser = 0
        )
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

// @param bossKey - Make sure the player is on the correct stage (see: STAGE_ADDRESS_MAP)
// @param bossDeadHealth - At what health will victory be achieved? Some bosses like Cossack Catcher trigger a cutscene on 2HP.
// @param bossLifeBarCount - Does this boss have multiple forms? If so, we have to trigger the achievement on killing the final form.
// @param requiredDifficulty {0x01: DIFFICULTY_MEDIUM} - The difficulty level required for the achievement to unlock.
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param allowInfiniteAmmo {0 or 1} - Is infinite ammo allowed while killing this boss
// @param allowInfiniteLives {0 or 1} - Is infinite lives allowed while killing this boss
// @param allowAirSliding {0 or 1} - Is air sliding allowed while killing this boss
// @param allowDoubleJump {0 or 1} - Is double jump allowed while killing this boss
// @param allowFullArsenal {0 or 1} - Is full arsenal allowed while killing this boss
// @param allowBurstChaser {0 or 1} - Is burst chaser allowed while killing this boss
function BossKill(
    bossKey,
    bossDeadHealth = 0,
    bossLifeBarCount = 1,
    requiredDifficulty = 0x01,
    requiredCharacters = 0x00,
    allowInfiniteAmmo = 0,
    allowInfiniteLives = 0,
    allowAirSliding = 0,
    allowDoubleJump = 0,
    allowFullArsenal = 0,
    allowBurstChaser = 0
) {
    start = HasTransitionedBetweenScreens(bossKey, BOSS_SCREENS[bossKey]["previous"], BOSS_SCREENS[bossKey]["current"])
    cancel =  never(PlayerDead())

    return
        start
        && cancel
        && ResetIfNonPlayingState()
        && IsUsingOnlyAllowedModifiers(
            requiredDifficulty,
            allowInfiniteAmmo,
            allowInfiniteLives,
            allowAirSliding,
            allowDoubleJump,
            allowFullArsenal,
            allowBurstChaser
        )
        && IsUsingRequiredCharacters(requiredCharacters)
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

function WilyMachine4WireKill() {
    start = HasTransitionedBetweenScreens(Wily3, BOSS_SCREENS[Wily3]["previous"], BOSS_SCREENS[Wily3]["current"])
    cancel = never(PlayerDead()) && never(CanonicalGameState() != STATE_LEVEL && CanonicalGameState() != STATE_PAUSE_MENU_OPEN)

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && IsBossKilled(bossDeadHealth = 0, bossLifeBarCount = 2)
        && CurrentEquippedWeapon() == EQUIPPED_WIRE
}

// @param bossKey - Make sure the player is on the correct stage (see: STAGE_ADDRESS_MAP)
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param bossDeadHealth - At what health will victory be achieved? Some bosses like Cossack Catcher trigger a cutscene on 2HP.
// @param bossLifeBarCount - Does this boss have multiple forms? If so, we have to trigger the achievement on killing the final form.
function BossKillNoSpecialWeapons(bossKey, requiredCharacters = 0x00, bossDeadHealth = 0, bossLifeBarCount = 1) {
    start = HasTransitionedBetweenScreens(bossKey, BOSS_SCREENS[bossKey]["previous"], BOSS_SCREENS[bossKey]["current"])

    cancel = 
        never(PlayerDead()) 
        && never(IsShootingSpecialWeapon())
        && never(TotalETanksLeft() < prev(TotalETanksLeft()))

    return
        start
        && cancel
        && ResetIfNonPlayingState()
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(requiredCharacters)
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

// @param bossKey - Make sure the player is on the correct stage (see: STAGE_ADDRESS_MAP)
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param bossDeadHealth - At what health will victory be achieved? Some bosses like Cossack Catcher trigger a cutscene on 2HP.
// @param bossLifeBarCount - Does this boss have multiple forms? If so, we have to trigger the achievement on killing the final form.
function BossKillNoWeapons(bossKey, requiredCharacters = 0x00, bossDeadHealth = 0, bossLifeBarCount = 1) {
    start = HasTransitionedBetweenScreens(bossKey, BOSS_SCREENS[bossKey]["previous"], BOSS_SCREENS[bossKey]["current"])

    cancel = 
        never(PlayerDead()) 
        && never(IsShootingAnyWeapon())
        && never(TotalETanksLeft() < prev(TotalETanksLeft()))

    return
        start
        && cancel
        && ResetIfNonPlayingState()
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(requiredCharacters)
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
function BossRushNoSpecialWeapons(requiredCharacters = 0x00) {
    start =
        once(
            CanonicalGameState() == STATE_LEVEL
            && CurrentStage() == STAGE_ADDRESS_MAP[Wily3]
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

// @param bossKey - Make sure the player is on the correct stage (see: STAGE_ADDRESS_MAP)
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param bossDeadHealth - At what health will victory be achieved? Some bosses like Cossack Catcher trigger a cutscene on 2HP.
// @param bossLifeBarCount - Does this boss have multiple forms? If so, we have to trigger the achievement on killing the final form.
function BossKillDamageless(bossKey, requiredCharacters = 0x00, bossDeadHealth = 0, bossLifeBarCount = 1) {
    start = HasTransitionedBetweenScreens(bossKey, BOSS_SCREENS[bossKey]["previous"], BOSS_SCREENS[bossKey]["current"])

    cancel = 
        never(PlayerDead())
        && never(CurrentHealth() < prev(CurrentHealth()))

    return
        start
        && cancel
        && ResetIfNonPlayingState()
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(requiredCharacters)
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

// @param bossKey - Make sure the player is on the correct stage (see: STAGE_ADDRESS_MAP)
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param requiredCheckpoint {0x02: CHECKPOINT_END} - Make sure the player has reached the correct stage checkpoint
function BossDoorDamageless(bossKey, requiredCharacters = 0x00, requiredCheckpoint = 0x02) {
    start = 
        once(StageStarted())
        || once(CanonicalGameState() == STATE_LEVEL && prev(CanonicalGameState()) == STATE_COSSACK_WILY_LEVEL_INTRO_SCREEN)
        || once(CanonicalGameState() == STATE_LEVEL && CurrentHealth() == MAX_HEALTH && prev(CurrentHealth()) == 0 && CurrentCheckpoint() == CHECKPOINT_NONE)

    cancel = 
        never(CanonicalGameState() == STATE_SAVE_OR_CONTINUE_SCREEN)
        && never(CanonicalGameState() == STATE_FREE_PLAY_MENU)
        && never(IsDemoPlaying() == 1) 
        && never(CurrentHealth() < prev(CurrentHealth()))

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(requiredCharacters)
        && CurrentStage() == STAGE_ADDRESS_MAP[bossKey]
        && trigger_when(CurrentCheckpoint() == requiredCheckpoint)
}

function BrightManStageLightsAlwaysOn() {
    start =
        once(StageStarted())
        || once(CanonicalGameState() == STATE_LEVEL && CurrentHealth() == MAX_HEALTH && prev(CurrentHealth()) == 0 && CurrentCheckpoint() == CHECKPOINT_NONE)

    cancel =
        never(CanonicalGameState() == STATE_SAVE_OR_CONTINUE_SCREEN)
        && never(CanonicalGameState() == STATE_FREE_PLAY_MENU)
        && never(IsDemoPlaying() == 1)
        && never(Timer() == 0x02 && prev(Timer()) == 0x00) // This is the stage lights turning off.

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && CurrentStage() == STAGE_ADDRESS_MAP[BrightMan]
        && trigger_when(CurrentCheckpoint() == CHECKPOINT_END)
}

function RobotMastersClear() {
    // When all weapons are earned, Dr. Cossack appears on the stage select screen.
    return
        RequireWithoutPasswords()
        && IsUsingOnlyAllowedModifiers()
        && CanonicalGameState() == STATE_STAGE_SELECT
        && WeaponsEarnedA() == 0xFE // All earned
        && WeaponsEarnedB() == 0x01 // All earned
}

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param requiredDifficulty {0x01: DIFFICULTY_MEDIUM} - The difficulty level required for the achievement to unlock.
function GameClear(requiredCharacters = 0x00, requiredDifficulty = 0x01) {
    return
        RequireNewFileWithoutPasswords()
        && BossKill(Wily4, requiredCharacters = requiredCharacters, requiredDifficulty = requiredDifficulty)
}

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param requiredDifficulty {0x01: DIFFICULTY_MEDIUM} - The difficulty level required for the achievement to unlock.
function ContinuelessGameClear(requiredCharacters = 0x00, requiredDifficulty = 0x01) {
    cancel = disable_when(CanonicalGameState() == STATE_GAME_OVER, CanonicalGameState() == STATE_GAME_INTRO)
    return cancel && GameClear(requiredCharacters, requiredDifficulty)
}

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param requiredDifficulty {0x01: DIFFICULTY_MEDIUM} - The difficulty level required for the achievement to unlock.
function DeathlessGameClear(requiredCharacters = 0x00, requiredDifficulty = 0x01) {
    cancel = disable_when(
        CanonicalGameState() == STATE_LEVEL 
        && TotalLivesLeft() < prev(TotalLivesLeft()),
        CanonicalGameState() == STATE_GAME_INTRO
    )

    return cancel && GameClear(requiredCharacters, requiredDifficulty)
}

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
function DamagelessRobotMastersClear(requiredCharacters = 0x00) {
    start =
        once(CanonicalGameState() == STATE_STAGE_SELECT)

    cancel =
        disable_when(CanonicalGameState() == STATE_LEVEL && CurrentHealth() < prev(CurrentHealth()), CanonicalGameState() == STATE_GAME_INTRO)

    return
        start
        && cancel
        && IsUsingRequiredCharacters(requiredCharacters)
        && IsUsingOnlyAllowedModifiers()
        && RequireNewFileWithoutPasswords()
        && trigger_when(
            CanonicalGameState() == STATE_STAGE_SELECT
            && WeaponsEarnedA() == 0xFE // All earned
            && WeaponsEarnedB() == 0x01 // All earned
        )
}

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
function DamagelessGameClear(requiredCharacters = 0x00) {
    start =
        once(CanonicalGameState() == STATE_STAGE_SELECT)

    cancel =
        disable_when(CanonicalGameState() == STATE_LEVEL && CurrentHealth() < prev(CurrentHealth()), CanonicalGameState() == STATE_GAME_INTRO)

    return
        start
        && cancel
        && IsUsingRequiredCharacters(requiredCharacters)
        && IsUsingOnlyAllowedModifiers()
        && RequireNewFileWithoutPasswords()
        && trigger_when(CanonicalGameState() == STATE_ENDING_ONE)
}

// @param weaponKey - The weapon we'll be checking the player's inventory for to trigger the unlock (see: WEAPON_ADDRESS_MAP)
function GetWeapon(weaponKey) {
    return
        IsUsingOnlyAllowedModifiers()
        && CanonicalGameState() == STATE_LEVEL
        && WEAPONS_ADDRESS_MAP[weaponKey] == 1
        && prev(WEAPONS_ADDRESS_MAP[weaponKey]) == 0
}

function PharaohManHardenQuicksand() {
    return
        IsUsingOnlyAllowedModifiers()
        && CanonicalGameState() == STATE_LEVEL
        && CurrentStage() == STAGE_ADDRESS_MAP[PharaohMan]
        && CurrentScreen() <= 0x0A // quicksand is visible
        && QuicksandTimer() == 0x02 // the timer is running
}

function PharaohManTurnOffLights() {
    return
        IsUsingOnlyAllowedModifiers()
        && CanonicalGameState() == STATE_LEVEL
        && CurrentStage() == STAGE_ADDRESS_MAP[PharaohMan]
        && CurrentScreen() > 0x0A // player is underground
        && prev(ScreenDarkness()) == 0x01
        && ScreenDarkness() == 0x02 // it ultimately ticks up to 0x07
}

function DefaultSettingsCheck() {
    start = once(CanonicalGameState() == STATE_MM4_SETTINGS)

    cancel = 
        never(!IsUsingOnlyAllowedModifiers()) 
        && never(CanonicalGameState() != STATE_MM4_SETTINGS && CanonicalGameState() != STATE_STAGE_SELECT && CanonicalGameState() != STATE_LEVEL)

    return
        start
        && cancel
        && trigger_when(
            prev(CanonicalGameState()) == STATE_MM4_SETTINGS 
            && (CanonicalGameState() == STATE_STAGE_SELECT || CanonicalGameState() == STATE_LEVEL) // Free Play means they can start right in a level.
        )
}

function RingManEddie() {
    return
        IsUsingOnlyAllowedModifiers()
        && CanonicalGameState() == STATE_LEVEL
        && CurrentStage() == STAGE_ADDRESS_MAP[RingMan]
        && (prev(CurrentScreen()) == 0x46 && CurrentScreen() == 0x26) // climb the ladder at the checkpoint
}

function NineLives() {
    return
        IsUsingOnlyAllowedModifiers()
        && (prev(TotalLivesLeft()) == 8 && TotalLivesLeft() == 9)
}

function NineETanks() {
    return
        IsUsingOnlyAllowedModifiers()
        && (prev(TotalETanksLeft()) == 8 && TotalETanksLeft() == 9)
}
// #endregion Achievement Functions

// #region Achievements -------------------------------------------------------------------------------------------------------------------
achievement("DEFAULT SETTINGS CHECK", "Normal or Hard difficulty, any character, any buster charge. All other settings OFF.", 0, DefaultSettingsCheck(), id = 323665, badge = "361407")

achievement("Rain Flush", "Defeat Toad Man", 5, BossKill(ToadMan), id = 323666, badge = "361408")
achievement("Flash Stopper", "Defeat Bright Man", 5, BossKill(BrightMan), id = 323667, badge = "361409")
achievement("Pharaoh Shot", "Defeat Pharaoh Man", 5, BossKill(PharaohMan), id = 323668, badge = "361410")
achievement("Ring Boomerang", "Defeat Ring Man", 5, BossKill(RingMan), id = 323669, badge = "361411")
achievement("Dust Crusher", "Defeat Dust Man", 5, BossKill(DustMan), id = 323670, badge = "361412")
achievement("Skull Barrier", "Defeat Skull Man", 5, BossKill(SkullMan), id = 323671, badge = "361413")
achievement("Dive Missile", "Defeat Dive Man", 5, BossKill(DiveMan), id = 323672, badge = "361414")
achievement("Drill Bomb", "Defeat Drill Man", 5, BossKill(DrillMan), id = 323673, badge = "361415")

achievement("Mothraya", "Defeat Mothraya", 5, BossKill(Cossack1), id = 323674, badge = "361629")
achievement("Square Machine", "Defeat Square Machine", 5, BossKill(Cossack2), id = 323675, badge = "361630")
achievement("Cockroach Twins", "Defeat Cockroach Twins", 5, BossKill(Cossack3), id = 323676, badge = "361631")
achievement("Cossack Catcher", "Defeat the Cossack Catcher", 5, BossKill(Cossack4, bossDeadHealth = 0x02), id = 323677, badge = "361632")

achievement("Metall Daddy", "Defeat Metall Daddy", 5, BossKill(Wily1), id = 323678, badge = "361633")
achievement("Tako Trash", "Defeat Tako Trash", 5, BossKill(Wily2), id = 323679, badge = "361634")
achievement("Wily Machine 4", "Defeat Wily Machine 4", 5, BossKill(Wily3, bossLifeBarCount = 2), id = 323680, badge = "361663")

achievement("Mega Man Game Clear [m]", "As Mega Man, beat the game [No Loaded Saves] [No Passwords]", 10, GameClear(RequiresMegaManOrMan, DIFFICULTY_MEDIUM), id = 323681, badge = "361682")
achievement("Mega Perseverance [m]", "As Mega Man, beat the game [Hard] [No Loaded Saves] [No Passwords]", 25, GameClear(RequiresMegaManOrMan, DIFFICULTY_HARD), id = 323683, badge = "361683")
achievement("Proto Man Game Clear [m]", "As Proto Man, beat the game [No Loaded Saves] [No Passwords]", 10, GameClear(RequiresProtoMan, DIFFICULTY_MEDIUM), id = 323684, badge = "361684")
achievement("Proto Perseverance [m]", "As Proto Man, beat the game [Hard] [No Loaded Saves] [No Passwords]", 25, GameClear(RequiresProtoMan, DIFFICULTY_HARD), id = 323685, badge = "361685")
achievement("Roll Game Clear [m]", "As Roll, beat the game [No Loaded Saves] [No Passwords]", 10, GameClear(RequiresRoll, DIFFICULTY_MEDIUM), id = 323686, badge = "361686")
achievement("Roll's Perseverance [m]", "As Roll, beat the game [Hard] [No Loaded Saves] [No Passwords]", 25, GameClear(RequiresRoll, DIFFICULTY_HARD), id = 323687, badge = "361687")

achievement("Toad-ally Unharmed", "Reach Toad Man's boss doors without taking damage or dying", 10, BossDoorDamageless(ToadMan, RequiresAnyCharacter), id = 323688, badge = "361416")
achievement("Spotless Luminary", "Reach Bright Man's boss doors without taking damage or dying", 10, BossDoorDamageless(BrightMan, RequiresAnyCharacter), id = 323689, badge = "361417")
achievement("Tomb Raider", "Reach Pharaoh Man's boss doors without taking damage or dying", 10, BossDoorDamageless(PharaohMan, RequiresAnyCharacter), id = 323690, badge = "361418")
achievement("Ring Leader", "Reach Ring Man's boss doors without taking damage or dying", 10, BossDoorDamageless(RingMan, RequiresAnyCharacter), id = 323691, badge = "361419")
achievement("Dust-Free Zone", "Reach Dust Man's boss doors without taking damage or dying", 10, BossDoorDamageless(DustMan, RequiresAnyCharacter), id = 323692, badge = "361420")
achievement("No Bone to Pick", "Reach Skull Man's boss doors without taking damage or dying", 10, BossDoorDamageless(SkullMan, RequiresAnyCharacter), id = 323693, badge = "361421")
achievement("Surface Tension", "Reach Dive Man's boss doors without taking damage or dying", 10, BossDoorDamageless(DiveMan, RequiresAnyCharacter), id = 323694, badge = "361422")
achievement("Excavating Excellence", "Reach Drill Man's boss doors without taking damage or dying", 10, BossDoorDamageless(DrillMan, RequiresAnyCharacter), id = 323695, badge = "361423")

achievement("Pond Skimming", "As Mega Man, defeat Toad Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(ToadMan, RequiresMegaManOrMan), id = 323696, badge = "361432")
achievement("Mega Watt", "As Mega Man, defeat Bright Man with only the M. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(BrightMan, RequiresMegaManOrMan), id = 323697, badge = "361433")
achievement("Busting the Curse", "As Mega Man, defeat Pharaoh Man with only the M. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(PharaohMan, RequiresMegaManOrMan), id = 323698, badge = "361434")
achievement("Circle of Victory", "As Mega Man, defeat Ring Man with only the M. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(RingMan, RequiresMegaManOrMan), id = 323699, badge = "361435")
achievement("Dust Buster", "As Mega Man, defeat Dust Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(DustMan, RequiresMegaManOrMan), id = 323700, badge = "361436")
achievement("Skull-busted", "As Mega Man, defeat Skull Man with only the M. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(SkullMan, RequiresMegaManOrMan), id = 323701, badge = "361437")
achievement("Busting the Wave", "As Mega Man, defeat Dive Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(DiveMan, RequiresMegaManOrMan), id = 323702, badge = "361438")
achievement("Busting through the Bedrock", "As Mega Man, defeat Drill Man with only the M. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(DrillMan, RequiresMegaManOrMan), id = 323703, badge = "361439")

achievement("Rainy Defense", "As Proto Man, defeat Toad Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(ToadMan, RequiresProtoMan), id = 323704, badge = "361440")
achievement("Shielding the Spotlight", "As Proto Man, defeat Bright Man with only the P. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(BrightMan, RequiresProtoMan), id = 323705, badge = "361441")
achievement("Sphinx Shield Showdown", "As Proto Man, defeat Pharaoh Man with only the P. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(PharaohMan, RequiresProtoMan), id = 323706, badge = "361442")
achievement("Imperfect Circle", "As Proto Man, defeat Ring Man with only the P. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(RingMan, RequiresProtoMan), id = 323707, badge = "361443")
achievement("Shielded Dust-Off", "As Proto Man, defeat Dust Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(DustMan, RequiresProtoMan), id = 323708, badge = "361444")
achievement("Bone-Proof Armor", "As Proto Man, defeat Skull Man with only the P. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(SkullMan, RequiresProtoMan), id = 323709, badge = "361445")
achievement("Deep Dive Defense", "As Proto Man, defeat Dive Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(DiveMan, RequiresProtoMan), id = 323710, badge = "361446")
achievement("Excavator's End", "As Proto Man, defeat Drill Man with only the P. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(DrillMan, RequiresProtoMan), id = 323711, badge = "361447")

achievement("Cleaning up the Pond", "As Roll, defeat Toad Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(ToadMan, RequiresRoll), id = 323712, badge = "361448")
achievement("Sweeping Away the Darkness", "As Roll, defeat Bright Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BrightMan, RequiresRoll), id = 323713, badge = "361449")
achievement("Dusting Off the Sphinx", "As Roll, defeat Pharaoh Man with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(PharaohMan, RequiresRoll), id = 323714, badge = "361450")
achievement("Cleaning the Ring Toss", "As Roll, defeat Ring Man with only the R. Broom [No E-Tanks]", 25, BossKillNoSpecialWeapons(RingMan, RequiresRoll), id = 323715, badge = "361451")
achievement("Dusted Clean", "As Roll, defeat Dust Man with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(DustMan, RequiresRoll), id = 323716, badge = "361452")
achievement("Sweeping the Bone Yard", "As Roll, defeat Skull Man with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(SkullMan, RequiresRoll), id = 323717, badge = "361453")
achievement("Deep Sea Broom Brawl", "As Roll, defeat Dive Man with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(DiveMan, RequiresRoll), id = 323718, badge = "361454")
achievement("Dirt-Free Drilling", "As Roll, defeat Drill Man with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(DrillMan, RequiresRoll), id = 323719, badge = "361740")

achievement("Slippery Success", "Defeat Toad Man without taking damage", 5, BossKillDamageless(ToadMan, RequiresAnyCharacter), id = 323720, badge = "361424")
achievement("Untouched Illumination", "Defeat Bright Man without taking damage", 10, BossKillDamageless(BrightMan, RequiresAnyCharacter), id = 323721, badge = "361425")
achievement("Pyramid Scheme", "Defeat Pharaoh Man without taking damage", 10, BossKillDamageless(PharaohMan, RequiresAnyCharacter), id = 323722, badge = "361426")
achievement("Flawless Ring Toss", "Defeat Ring Man without taking damage", 10, BossKillDamageless(RingMan, RequiresAnyCharacter), id = 323723, badge = "361427")
achievement("Scrapyard Scrapper", "Defeat Dust Man without taking damage", 10, BossKillDamageless(DustMan, RequiresAnyCharacter), id = 323724, badge = "361428")
achievement("Bone-Dry Victory", "Defeat Skull Man without taking damage", 10, BossKillDamageless(SkullMan, RequiresAnyCharacter), id = 323725, badge = "361429")
achievement("Torpedo Dodge Champion", "Defeat Dive Man without taking damage", 10, BossKillDamageless(DiveMan, RequiresAnyCharacter), id = 323726, badge = "361430")
achievement("Rock Solid Success", "Defeat Drill Man without taking damage", 10, BossKillDamageless(DrillMan, RequiresAnyCharacter), id = 323727, badge = "361431")

achievement("Wing Wipeout", "Defeat Mothraya without taking damage", 10, BossKillDamageless(Cossack1, RequiresAnyCharacter), id = 323728, badge = "361635")
achievement("Geometric Genius", "Defeat Square Machine without taking damage", 10, BossKillDamageless(Cossack2, RequiresAnyCharacter), id = 323729, badge = "361636")
achievement("Roach Rebuke", "Defeat Cockroach Twins without taking damage", 10, BossKillDamageless(Cossack3, RequiresAnyCharacter), id = 323730, badge = "361637")
achievement("Soviet Showdown", "Defeat the Cossack Catcher without taking damage", 10, BossKillDamageless(Cossack4, RequiresAnyCharacter), id = 323731, badge = "361638")

achievement("Ironed Out", "Defeat Metall Daddy without taking damage", 10, BossKillDamageless(Wily1, RequiresAnyCharacter), id = 323732, badge = "361639")
achievement("Tako Trashed", "Defeat Tako Trash without taking damage", 10, BossKillDamageless(Wily2, RequiresAnyCharacter), id = 323733, badge = "361640")
achievement("Outsmarted Contraption", "Defeat Wily Machine 4 without taking damage", 25, BossKillDamageless(Wily3, RequiresAnyCharacter, bossLifeBarCount = 2), id = 323734, badge = "361664")
achievement("Foiled Again", "Defeat Wily Capsule without taking damage", 10, BossKillDamageless(Wily4, RequiresAnyCharacter), id = 323735, badge = "361726")

achievement("Cold Yet Untouched", "Reach the boss doors of Dr. Cossack's Citadel I without taking damage or dying", 10, BossDoorDamageless(Cossack1, RequiresAnyCharacter), id = 323736, badge = "361886")
achievement("Frost-Free Fortress", "Reach the boss doors of Dr. Cossack's Citadel II without taking damage or dying", 10, BossDoorDamageless(Cossack2, RequiresAnyCharacter), id = 323737, badge = "361887")
achievement("Polar Performance", "Reach the boss doors of Dr. Cossack's Citadel III without taking damage or dying", 10, BossDoorDamageless(Cossack3, RequiresAnyCharacter), id = 323738, badge = "361888")
achievement("Ice-Free Invasion", "Reach the boss doors of Dr. Cossack's Citadel IV without taking damage or dying", 10, BossDoorDamageless(Cossack4, RequiresAnyCharacter), id = 323739, badge = "361891")

achievement("Bug Buster", "As Mega Man, defeat Mothraya with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack1, RequiresMegaManOrMan), id = 323740, badge = "361641")
achievement("Straight-Angle Annihalator", "As Mega Man, defeat Square Machine with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack2, RequiresMegaManOrMan), id = 323741, badge = "361642")
achievement("Insect Takedown", "As Mega Man, defeat Cockroach Twins with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack3, RequiresMegaManOrMan), id = 323742, badge = "361643")
achievement("Russian Roulette", "As Mega Man, defeat the Cossack Catcher with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack4, RequiresMegaManOrMan, bossDeadHealth = 0x02), id = 323743, badge = "361644")

achievement("Moth Masher", "As Proto Man, defeat Mothraya with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack1, RequiresProtoMan), id = 323744, badge = "361645")
achievement("Quadrilateral Queller", "As Proto Man, defeat Square Machine with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack2, RequiresProtoMan), id = 323745, badge = "361646")
achievement("Paired Pest Deflection", "As Proto Man, defeat Cockroach Twins with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack3, RequiresProtoMan), id = 323746, badge = "361647")
achievement("Cold Conquest", "As Proto Man, defeat the Cossack Catcher with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack4, RequiresProtoMan, bossDeadHealth = 0x02), id = 323747, badge = "361648")

achievement("Swept Wings", "As Roll, defeat Mothraya with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack1, RequiresRoll), id = 323748, badge = "361649")
achievement("Shape Shifter's Nightmare", "As Roll, defeat Square Machine with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(Cossack2, RequiresRoll), id = 323749, badge = "361650")
achievement("Infestation Inhibition", "As Roll, defeat Cockroach Twins with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(Cossack3, RequiresRoll), id = 323750, badge = "361651")
achievement("Cossack's Cleanup Crew", "As Roll, defeat the Cossack Catcher with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(Cossack4, RequiresRoll, bossDeadHealth = 0x02), id = 323751, badge = "361652")

achievement("Unscathed Approach", "Reach the boss doors of Wily Castle I without taking damage or dying", 10, BossDoorDamageless(Wily1, RequiresAnyCharacter), id = 323752, badge = "361889")
achievement("Aggressive Advancement", "Reach the boss doors of Wily Castle II without taking damage or dying", 10, BossDoorDamageless(Wily2, RequiresAnyCharacter), id = 323753, badge = "361890")

// TODO: Rename
achievement("Weaponless Win", "As Mega Man, defeat Metall Daddy with only the M. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(Wily1, RequiresMegaManOrMan), id = 323754, badge = "361653")

achievement("Dumpster Fire", "As Mega Man, defeat Tako Trash with only the M. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(Wily2, RequiresMegaManOrMan), id = 323755, badge = "361654")
achievement("Classic Conquest", "As Mega Man, defeat Wily Machine 4 with only the M. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(Wily3, RequiresMegaManOrMan, bossLifeBarCount = 2), id = 323756, badge = "361665")

achievement("Buster and Shield Showdown", "As Proto Man, defeat Metall Daddy with only the P. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(Wily1, RequiresProtoMan), id = 323757, badge = "361655")
achievement("Deflected Garbage", "As Proto Man, defeat Tako Trash with only the P. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(Wily2, RequiresProtoMan), id = 323758, badge = "361656")
achievement("Stellar Blues", "As Proto Man, defeat Wily Machine 4 with only the P. Buster [No E-Tanks]", 10, BossKillNoSpecialWeapons(Wily3, RequiresProtoMan, bossLifeBarCount = 2), id = 323759, badge = "361666")

achievement("Metall Mopped", "As Roll, defeat Metall Daddy with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(Wily1, RequiresRoll), id = 323760, badge = "361657")
achievement("Trash Sweep", "As Roll, defeat Tako Trash with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(Wily2, RequiresRoll), id = 323761, badge = "361658")
achievement("Wiped Clean", "As Roll, defeat Wily Machine 4 with only the R. Broom [No E-Tanks]", 10, BossKillNoSpecialWeapons(Wily3, RequiresRoll, bossLifeBarCount = 2), id = 323762, badge = "361667")

achievement("Buster Proficiency", "Without dying, defeat all 8 Robot Masters in the boss rush using only the M. Buster [No E-Tanks]", 25, BossRushNoSpecialWeapons(RequiresMegaManOrMan), id = 323763, badge = "361727")
achievement("Shield Proficiency", "Without dying, defeat all 8 Robot Masters in the boss rush using only the P. Buster [No E-Tanks]", 25, BossRushNoSpecialWeapons(RequiresProtoMan), id = 323764, badge = "361728")
achievement("Broom Proficiency", "Without dying, defeat all 8 Robot Masters in the boss rush using only the R. Broom [No E-Tanks]", 25, BossRushNoSpecialWeapons(RequiresRoll), id = 323765, badge = "361729")

achievement("Mega Momentum [m]", "As Mega Man, beat the game without ever using a continue [No Loaded Saves] [No Passwords]", 10, ContinuelessGameClear(RequiresMegaManOrMan, DIFFICULTY_MEDIUM), id = 323766, badge = "361688")
achievement("Mega Mastery [m]", "As Mega Man, beat the game without ever using a continue [Hard] [No Loaded Saves] [No Passwords]", 25, ContinuelessGameClear(RequiresMegaManOrMan, DIFFICULTY_HARD), id = 323767, badge = "361689")
achievement("Proto Progress [m]", "As Proto Man, beat the game without ever using a continue [No Loaded Saves] [No Passwords]", 10, ContinuelessGameClear(RequiresProtoMan, DIFFICULTY_MEDIUM), id = 323768, badge = "361690")
achievement("Proto Perfection [m]", "As Proto Man, beat the game without ever using a continue [Hard] [No Loaded Saves] [No Passwords]", 25, ContinuelessGameClear(RequiresProtoMan, DIFFICULTY_HARD), id = 323769, badge = "361691")
achievement("Roll's Resolve [m]", "As Roll, beat the game without ever using a continue [No Loaded Saves] [No Passwords]", 10, ContinuelessGameClear(RequiresRoll, DIFFICULTY_MEDIUM), id = 323770, badge = "361692")
achievement("Roll's Resilience [m]", "As Roll, beat the game without ever using a continue [Hard] [No Loaded Saves] [No Passwords]", 25, ContinuelessGameClear(RequiresRoll, DIFFICULTY_HARD), id = 323771, badge = "361693")

achievement("Mega Maniac [m]", "As Mega Man, beat the game without dying [Hard] [No Loaded Saves] [No Passwords]", 50, DeathlessGameClear(RequiresMegaManOrMan, DIFFICULTY_HARD), id = 323772, badge = "361694")
achievement("Agent of Anarchy [m]", "As Proto Man, beat the game without dying [Hard] [No Loaded Saves] [No Passwords]", 50, DeathlessGameClear(RequiresProtoMan, DIFFICULTY_HARD), id = 323773, badge = "361695")
achievement("Maid of Mayhem [m]", "As Roll, beat the game without dying [Hard] [No Loaded Saves] [No Passwords]", 50, DeathlessGameClear(RequiresRoll, DIFFICULTY_HARD), id = 323774, badge = "361696")

achievement("Ancient Air-Lift [m]", "Acquire the Balloon Adaptor on Pharaoh Man's stage", 5, GetWeapon("Balloon"), id = 323775, badge = "361987")
achievement("Wire We Diving? [m]", "Acquire the Wire Adaptor on Dive Man's stage", 5, GetWeapon("Wire"), id = 323776, badge = "361988")

// Idea credit: Lion Sum
achievement("Pharaoh's Flood [m]", "Harden the quicksand in Pharaoh Man's stage with Rain Flush", 2, PharaohManHardenQuicksand(), id = 323777, badge = "361989")
// Idea credit: Lion Sum
achievement("Desert Blackout [m]", "Turn off the lights in Pharaoh Man's stage with Rain Flush", 2, PharaohManTurnOffLights(), id = 323778, badge = "361990")

// Idea credit: Fox in Yellow Socks
achievement(
    "What is a Man?",
    "Beat the game as Man. All settings and cheats are allowed!",
    10,
    RequireNewFileWithoutPasswords()
    && BossKill(
        Wily4,
        requiredDifficulty = DIFFICULTY_EASY,
        requiredCharacters = RequiresMan,
        allowInfiniteAmmo = 1,
        allowInfiniteLives = 1,
        allowAirSliding = 1,
        allowDoubleJump = 1,
        allowFullArsenal = 1,
        allowBurstChaser = 1
    ),
    id = 323779,
    badge = "361991"
)

// Idea credit: JackelZXA
achievement("Intergalactic Eddie", "Find Eddie on Ring Man's stage", 1, RingManEddie(), id = 323780, badge = "361992")

achievement("The Kremlin Crawl", "Unlock Dr. Cossack's stages by defeating all eight Robot Masters [No Passwords]", 10, RobotMastersClear(), id = 323781, badge = "361628")
achievement("9 Times the Charm", "Collect 9 lives", 5, NineLives(), id = 323782, badge = "361993")
achievement("Soda Popinski's Envy", "Collect 9 E-Tanks", 5, NineETanks(), id = 323783, badge = "361994")

achievement("Lumen-ating Path [m]", "Reach Bright Man in his stage without turning the lights off", 5, BrightManStageLightsAlwaysOn(), id = 323784, badge = "361995")

// Idea credit: JackelZXA
achievement("Tako 'Bout Defense!", "As Proto Man, defeat Tako Trash using only the shield [No E-Tanks]", 5, BossKillNoWeapons(Wily2, RequiresProtoMan), id = 323785, badge = "361997")

// Idea: Fox in Yellow Socks
achievement("Wired for Victory [m]", "Deliver the killing blow to Wily Machine 4 with the Wire Adaptor", 5, WilyMachine4WireKill(), id = 323786, badge = "362043")

achievement("A Mega Surprise [m]", "On Dr. Cossack's third stage, hold on to a platform with Wire for as long as possible during an autoscroll section", 1, WireEasterEgg(), id = 323787, badge = "361998")
achievement("Drilling a New Passage", "Use Drill Bomb on Tako Trash to vaporize his hitbox, then walk behind him", 2, TakoTrashHitboxHidingSpot(), id = 323788, badge = "362035")
achievement("A Splash of Ingenuity [m]", "Immediately after defeating Wily Machine 4, use Rain Flush on Dr. Wily's capsule before he can fly away", 2, WilyUmbrellaEasterEgg(), id = 323789, badge = "362034")

// Idea: frijoles / FlashbackYT
achievement("Toad-ally Skipped [m]", "Use Flash Stopper to skip an Escaroo miniboss on Toad Man's stage", 5, EscarooSkip(), id = 323790, badge = "362044")

// Idea: Fox in Yellow Socks
achievement(
    "[Dev Team Challenge I] Bright Man",
    "[FREE PLAY MODE: Bright, Checkpoint 2] Defeat Bright Man damageless using only Rain Flush",
    25,
    FreePlayBossKill(BrightMan, BRIGHT_MAN_CURRENT, CHECKPOINT_END, allowDamage = 0, onlySpecificWeapon = EQUIPPED_RFLUSH),
    id = 323791,
    badge = "361456"
)

// Idea: Fox in Yellow Socks
achievement(
    "[Dev Team Challenge II] Dive Man",
    "[FREE PLAY MODE: Dive, Checkpoint 2] Start the fight against Dive Man with full Rush Marine ammo and spend all that ammo without taking damage",
    25,
    DiveManMarineChallenge(),
    id = 323792,
    badge = "361457"
)

// Idea: Fox in Yellow Socks
achievement(
    "[Dev Team Challenge III] Mothraya",
    "[FREE PLAY MODE: Cossack 1, Checkpoint 2] Defeat Mothraya damageless without jumping and with Full Arsenal enabled",
    25,
    FreePlayBossKill(Cossack1, MOTHRAYA_CURRENT, CHECKPOINT_END, allowDamage = 0, allowJumping = 0, allowFullArsenal = MustBeEnabled),
    id = 323793,
    badge = "361659"
)

// Idea: Fox in Yellow Socks
// solution: D.Missile
achievement(
    "[Dev Team Challenge IV] Cockroach Twins",
    "[FREE PLAY MODE: Cossack 3, Checkpoint 2] Defeat Cockroach Twins without jumping and without E-Tanks",
    10,
    FreePlayBossKill(Cossack3, COCKROACH_CURRENT, CHECKPOINT_END, allowJumping = 0, allowETanks = 0),
    id = 323794,
    badge = "361660"
)

// Idea: Fox in Yellow Socks
// Solution: G.Attack + Blind spot on leftmost spot of screen
achievement(
    "[Dev Team Challenge V] Cossack Catcher",
    "[FREE PLAY MODE: Cossack 4, Checkpoint 2] Defeat Cossack Catcher damageless without jumping, without sliding, and with Full Arsenal enabled",
    25,
    FreePlayBossKill(Cossack4, COSSACK_CURRENT, CHECKPOINT_END, allowDamage = 0, allowJumping = 0, allowSliding = 0, allowFullArsenal = MustBeEnabled, bossDeadHealth = 0x02),
    id = 323795,
    badge = "361661"
)

// Idea: Fox in Yellow Socks
// Solution: Ring Man weapon + Balloon item
achievement(
    "[Dev Team Challenge VI] Metall Daddy",
    "[FREE PLAY MODE: Wily 1, Checkpoint 2] Defeat Metall Daddy damageless and without sliding",
    25,
    FreePlayBossKill(Wily1, METALL_CURRENT, CHECKPOINT_END, allowSliding = 0, allowDamage = 0),
    id = 323796,
    badge = "361662"
)

// Idea: Fox in Yellow Socks
// Solution: Stand near the middle and slide
achievement(
    "[Dev Team Challenge VII] Wily Capsule",
    "[FREE PLAY MODE: Wily 4, Checkpoint 0] Defeat Wily Capsule without jumping",
    25,
    FreePlayBossKill(Wily4, WILY_CAPSULE_CURRENT, CHECKPOINT_NONE, allowJumping = 0),
    id = 323797,
    badge = "361725"
)

// Idea: Fox in Yellow Socks
// solution: farm health from respawning enemies
achievement(
    "[Dev Team Challenge VIII] Toad Man's Stage",
    "[FREE PLAY MODE: Toad, Checkpoint 0] With Full Arsenal enabled, reach Toad Man's boss doors without dying, without E-Tanks, and only using the Mega Man 6 Power Adaptor",
    25,
    FreePlayStageClear(ToadMan, onlySpecificWeapon = EQUIPPED_MM6_POWERADAPTOR, allowETanks = 0, allowFullArsenal = MustBeEnabled, requiredCharacters = RequiresMegaManOrMan, allowSliding = 0),
    id = 323798,
    badge = "361458"
)

// Idea: Fox in Yellow Socks
// solution: farm resources on mini bosses
achievement(
    "[Dev Team Challenge IX] Ring Man's Stage",
    "[FREE PLAY MODE: Ring, Checkpoint 0] Reach Ring Man's boss doors without dying, without E-Tanks, and only using the Pharaoh Shot",
    25,
    FreePlayStageClear(RingMan, onlySpecificWeapon = EQUIPPED_PSHOT, allowETanks = 0),
    id = 323799,
    badge = "361459"
)

// Idea: Fox in Yellow Socks
// Solution: fly to edges and pop around to destroy missiles
achievement(
    "[Dev Team Challenge X] Drill Man's Stage",
    "[FREE PLAY MODE: Drill, Checkpoint 0] With Full Arsenal enabled, reach Drill Man's boss doors without dying, without E-Tanks, and only using the Mega Man 6 Power Adaptor",
    25,
    FreePlayStageClear(DrillMan, onlySpecificWeapon = EQUIPPED_MM6_POWERADAPTOR, allowETanks = 0, allowFullArsenal = MustBeEnabled, requiredCharacters = RequiresMegaManOrMan, allowSliding = 0),
    id = 323800,
    badge = "361460"
)
// #endregion Achievements

// #region Subset - Bonus -----------------------------------------------------------------------------------------------------------------
achievement("Halfway Hero", "As Mega Man, defeat all eight Robot Masters without taking damage [Normal]", 50, DamagelessRobotMastersClear(RequiresMegaManOrMan))
achievement("Halfway Haven", "As Proto Man, defeat all eight Robot Masters without taking damage [Normal]", 50, DamagelessRobotMastersClear(RequiresProtoMan))
achievement("Halfway Helper", "As Roll, defeat all eight Robot Masters without taking damage [Normal]", 50, DamagelessRobotMastersClear(RequiresRoll))
achievement("Mr. Perfect", "As Mega Man, complete the entire game without taking damage [Normal]", 100, DamagelessGameClear(RequiresMegaManOrMan))
achievement("Perfect Blues", "As Proto Man, complete the entire game without taking damage [Normal]", 100, DamagelessGameClear(RequiresProtoMan))
achievement("Ms. Perfect", "As Roll, complete the entire game without taking damage [Normal]", 100, DamagelessGameClear(RequiresRoll))
// #endregion

// #region Leaderboards -------------------------------------------------------------------------------------------------------------------
// @param requiredCharacters {1: RequiresMegaManOrMan} - Which characters are required to start the timer
function StartLeaderboard(requiresCharacter = 1) {
    return
        once(
            CanonicalGameState() == STATE_STAGE_SELECT
            && WeaponsEarnedA() == 0x00
            && WeaponsEarnedB() == 0x00
        )
        && IsUsingRequiredCharacters(requiresCharacter)
        && IsUsingOnlyAllowedModifiers()
        && RequireNewFileWithoutPasswords()
}

function SubmitTime() {
    return
        CurrentStage() == STAGE_ADDRESS_MAP[Wily4]
        && CurrentScreen() == WILY_CAPSULE_CURRENT // BOSS_SCREENS[Wily4]["current"]
        && never(PlayerDead())
        && IsBossKilled()
}

leaderboard(
    "Mega Man Game Clear",
    "New game, default settings",
    start = StartLeaderboard(RequiresMegaMan),
    cancel = CanonicalGameState() == STATE_MM4_TITLE_SCREEN,
    submit = SubmitTime(),
    value = repeated(TimeSpan(), always_true()),
    format = "FRAMES"
)

leaderboard(
    "Proto Man Game Clear",
    "New game, default settings",
    start = StartLeaderboard(RequiresProtoMan),
    cancel = CanonicalGameState() == STATE_MM4_TITLE_SCREEN,
    submit = SubmitTime(),
    value = repeated(TimeSpan(), always_true()),
    format = "FRAMES"
)

leaderboard(
    "Roll Game Clear",
    "New game, default settings",
    start = StartLeaderboard(RequiresRoll),
    cancel = CanonicalGameState() == STATE_MM4_TITLE_SCREEN,
    submit = SubmitTime(),
    value = repeated(TimeSpan(), always_true()),
    format = "FRAMES"
)

// Subset Leaderboards
leaderboard(
    "Mr. Perfect",
    "New game, default settings",
    start = StartLeaderboard(RequiresMegaMan),
    cancel = 
        CanonicalGameState() == STATE_LEVEL && CurrentHealth() < prev(CurrentHealth())
        || CanonicalGameState() == STATE_MM4_TITLE_SCREEN
    ,
    submit = SubmitTime(),
    value = repeated(TimeSpan(), always_true()),
    format = "FRAMES"
)

leaderboard(
    "Ms. Perfect",
    "New game, default settings",
    start = StartLeaderboard(RequiresRoll),
    cancel = 
        CanonicalGameState() == STATE_LEVEL && CurrentHealth() < prev(CurrentHealth())
        || CanonicalGameState() == STATE_MM4_TITLE_SCREEN
    ,
    submit = SubmitTime(),
    value = repeated(TimeSpan(), always_true()),
    format = "FRAMES"
)

leaderboard(
    "Perfect Blues",
    "New game, default settings",
    start = StartLeaderboard(RequiresProtoMan),
    cancel = 
        CanonicalGameState() == STATE_LEVEL && CurrentHealth() < prev(CurrentHealth())
        || CanonicalGameState() == STATE_MM4_TITLE_SCREEN
    ,
    submit = SubmitTime(),
    value = repeated(TimeSpan(), always_true()),
    format = "FRAMES"
)
// #endregion

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
    0x09: "Square Machine",
    0x0A: "Cockroach Twins",
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

// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && (CanonicalGameState() == STATE_ENDING_ONE || CanonicalGameState() == STATE_ENDING_TWO),

    "{0} • {1} • Watching the Ending",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels)
)
rich_presence_conditional_display(
    (CanonicalGameState() == STATE_ENDING_ONE || CanonicalGameState() == STATE_ENDING_TWO),
    "{0} • {1} • Watching the ending",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels)
)

// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && CanonicalGameState() == STATE_CREDITS,

    "{0} • {1} • Viewing the credits. Thanks for Playing! 🎉",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels)
)
rich_presence_conditional_display(
    CanonicalGameState() == STATE_CREDITS,
    "{0} • {1} • Viewing the credits. Thanks for playing! 🎉",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels)
)

// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && CanonicalGameState() == STATE_STAGE_SELECT,

    "{0} • {1} • {2}/8 • {3} {4} • Stage Select screen",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
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

// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && CanonicalGameState() == STATE_LEVEL_INTRO,

    "Watching the Intro to {0}'s stage",
    rich_presence_lookup("Stage", CurrentStage(), stageLabels, "a bad guy")
)
rich_presence_conditional_display(
    CanonicalGameState() == STATE_LEVEL_INTRO,
    "Watching the intro to {0}'s stage",
    rich_presence_lookup("Stage", CurrentStage(), stageLabels, "a bad guy")
)

// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() < STAGE_ADDRESS_MAP[Cossack1] 
    && (CurrentCheckpoint() == CHECKPOINT_NONE || CurrentCheckpoint() == CHECKPOINT_MID),

    "{0} • {1} • {2}/8 • {3} {4} • {5} {6}'s Stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Checkpoint Label", CurrentCheckpoint(), checkpointLabels, "In"),
    rich_presence_lookup("Stage", CurrentStage(), stageLabels, "a bad guy")
)
rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() < STAGE_ADDRESS_MAP[Cossack1] 
    && (CurrentCheckpoint() == CHECKPOINT_NONE || CurrentCheckpoint() == CHECKPOINT_MID),

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
// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == STAGE_ADDRESS_MAP[Wily3]
    && CurrentStage() == STAGE_ADDRESS_MAP[Wily3] 
    && (CurrentCheckpoint() == CHECKPOINT_END)
    && any_of(bossRushEnemyRooms, r => CurrentScreen() == r),

    "{0} • {1} • {2}/8 • {3} {4} • Fighting {5} in the boss rush",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Boss Rush Enemy Label", CurrentScreen(), bossRushEnemyLabels, "a bad guy")
)
rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == STAGE_ADDRESS_MAP[Wily3]
    && CurrentStage() == STAGE_ADDRESS_MAP[Wily3] 
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

// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() == STAGE_ADDRESS_MAP[Wily3] 
    && (CurrentCheckpoint() == CHECKPOINT_END),

    "{0} • {1} • {2}/8 • {3} {4} • In the boss rush of Dr. Wily's third stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)
rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() == STAGE_ADDRESS_MAP[Wily3] 
    && (CurrentCheckpoint() == CHECKPOINT_END),

    "{0} • {1} • {2}/8 • {3} {4} • In the Boss Rush of Dr. Wily's third stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() == STAGE_ADDRESS_MAP[Wily3] 
    && CurrentCheckpoint() == CHECKPOINT_FINISHED_BOSS_RUSH,

    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily Machine IV",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)
rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() == STAGE_ADDRESS_MAP[Wily3] 
    && CurrentCheckpoint() == CHECKPOINT_FINISHED_BOSS_RUSH,

    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily Machine 4",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() == STAGE_ADDRESS_MAP[Wily4] 
    && BossActive() == BOSS_ACTIVE_WILY_CAPSULE,

    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily's Capsule",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)
rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() == STAGE_ADDRESS_MAP[Wily4] 
    && BossActive() == BOSS_ACTIVE_WILY_CAPSULE,

    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily Capsule",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

// anticheat
rich_presence_conditional_display(
    once(IframeTimer() != 0 && CurrentHealth() == MAX_HEALTH)
    && (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() >= STAGE_ADDRESS_MAP[Cossack1] 
    && (CurrentCheckpoint() == CHECKPOINT_NONE || CurrentCheckpoint() == CHECKPOINT_MID),

    "{0} • {1} • {2}/8 • {3} {4} • {5} {6}'s {7}",
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
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) 
    && CurrentStage() >= STAGE_ADDRESS_MAP[Cossack1] 
    && (CurrentCheckpoint() == CHECKPOINT_NONE || CurrentCheckpoint() == CHECKPOINT_MID),

    "{0} • {1} • {2}/8 • {3} {4} • {5} {6}'s {7}",
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
