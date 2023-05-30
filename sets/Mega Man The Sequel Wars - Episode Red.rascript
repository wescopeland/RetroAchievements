// ~Homebrew~ Mega Man: The Sequel Wars - Episode Red
// #ID = 24453

// TODO: Make sure boss no hit & boss no special achievements work during boss rush
// TODO: be sure to mark missables
// TODO: be sure to credit users for achievement ideas
// TODO: link the RAScript in the code notes. explain the meaning of Symbol.
// TODO: achievement order
// TODO: better achievement names
// TODO: better achievement descriptions [specify settings similar to Mega Man 2 PCE]
// TODO: subset
// TODO: make sure total points is a nice number ending in 5 or 0

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
_UNSAFE_MEM_ESCAPEPODYPOS  = 0x31E8
_UNSAFE_MEM_TAKOTRASHHBOX  = 0x31EC
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
function Timer() => byte(_MEM_TIMER)
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
// FIXME: These keys should match the "BOSS_SCREENS" keys
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

function ScreenDarkness() => byte(_UNSAFE_MEM_SCREENDARKNESS)
function QuicksandTimer() => byte(_UNSAFE_MEM_QUICKSANDTIMER)
function WilyBossesHitboxState() => byte(_UNSAFE_MEM_TAKOTRASHHBOX)
function WilyEscapePodYPosition() => byte(_UNSAFE_MEM_ESCAPEPODYPOS)

function CurrentScreen() => byte(_MEM_CURSCREEN)
SCREEN_BOSS_RUSH_ROOM = 0x1E
// #endregion Memory

// #region Utils --------------------------------------------------------------------------------------------------------------------------
BOSS_ACTIVE_WILY_CAPSULE = 0x0A // @see BossActive()
MAX_HEALTH = 0x1C // @see BossHealth() and CurrentHealth()

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
    "WILY2": {"previous": [0x0A], "current": [0x0B]},
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

function IsJumping() {
    return IsJumpPressed() == 1 && CurrentYPosition() < prev(CurrentYPosition())
}

function IsShootingAnyWeapon() {
    return IsFirePressed() == 1 && IsPauseMenuOpen() == 0
}

function IsShootingSpecialWeapon() {
    return
        IsShootingAnyWeapon()
        && CurrentEquippedWeapon() != EQUIPPED_BUSTER
        && CurrentEquippedWeapon() != EQUIPPED_RCOIL
        && CurrentEquippedWeapon() != EQUIPPED_RJET
        && CurrentEquippedWeapon() != EQUIPPED_RMARINE
}

// @param requiredWeapon {0x00: EQUIPPED_BUSTER} - What weapon is required for this function to return falsy
function IsShootingWrongWeapon(requiredWeapon = 0x00) {
    return IsShootingAnyWeapon() && CurrentEquippedWeapon() != requiredWeapon
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
        wilyMachineHack = once(HighestVDPSpriteIndex() == WILY_MACHINE_FORM_TWO)
    }

    return
        wilyMachineHack
        && (BossHealth() <= bossDeadHealth && prev(BossHealth()) > bossDeadHealth)
        && (once(IsPlayerLocked() == 0 && prev(IsPlayerLocked()) == 1))
        && once(BossHealth() < MAX_HEALTH && prev(BossHealth()) == MAX_HEALTH)
        && (prev(BossActive()) != 0) // prevents a bug where the boss pointer points at Mega Man's health
}

// @param previousScreens - The screens associated with immediately before the boss fight.
// @param currentScreens - The screens associated with during the boss fight.
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
RequiresMan = 5

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
    }

    return condition
}

function RequireWithoutPasswords() {
    return disable_when(CanonicalGameState() == STATE_MM4_SETTINGS && prev(CanonicalGameState()) == STATE_ENTER_PASSWORD_SCREEN)
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
// #endregion Utils

// #region Achievement Functions ----------------------------------------------------------------------------------------------------------

function TakoTrashHitboxHidingSpot() {
    return
        CanonicalGameState() == STATE_LEVEL
        && CurrentStage() == STAGE_ADDRESS_MAP["Wily2"]
        && CurrentCheckpoint() == CHECKPOINT_END
        && WilyBossesHitboxState() == 0x02 // destroyed
        && CurrentXPosition() >= 0x06
        && CurrentXPositionB() == 0x0c
}

function WilyUmbrellaEasterEgg() {
    return
        CanonicalGameState() == STATE_LEVEL
        && CurrentStage() == STAGE_ADDRESS_MAP["Wily3"]
        && CurrentCheckpoint() == CHECKPOINT_FINISHED_BOSS_RUSH
        && WilyEscapePodYPosition() != 0x00
        && WilyBossesHitboxState() == 0x03 // umbrella enabled
}

function WireEasterEgg() {
    return CanonicalGameState() == STATE_WIRE_EASTER_EGG && prev(CanonicalGameState()) == STATE_LEVEL
}

// @param primeStage {STAGE_ADDRESS_MAP} - What stage this challenge lives on
// @param onlySpecificWeapon {0x00: EQUIPPED_BUSTER} - Are there any weapon restrictions while killing this boss // @see EQUIPPED_*
// @param allowETanks {0 or 1} - Can the player use E-Tanks while killing this boss
// @param allowFullArsenal {0 or 1} - Is full arsenal allowed while killing this boss
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param allowSliding {0 or 1} - Is sliding allowed while killing this boss
function FreePlayStageClear(
    primeStage = "Toad",
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

    cancel =
        never(PlayerDead() && CanonicalGameState() != STATE_FREE_PLAY_MENU && CanonicalGameState() != STATE_MM4_SETTINGS) 
        && never(CanonicalGameState() == STATE_LEVEL && IsFreePlayEnabled() == 0)
        && never(CurrentStage() != STAGE_ADDRESS_MAP[primeStage])
        && allowETanksClause
        && onlySpecificWeaponClause
        && allowSlidingClause

    return
        once(CurrentStage() == STAGE_ADDRESS_MAP[primeStage])
        && once(CurrentCheckpoint() == CHECKPOINT_NONE)
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
        && trigger_when(CurrentCheckpoint() == CHECKPOINT_END)
}

function DiveManMarineChallenge() {
    cancel =
        never(PlayerDead() && CanonicalGameState() != STATE_FREE_PLAY_MENU && CanonicalGameState() != STATE_MM4_SETTINGS)
        && never(CanonicalGameState() == STATE_LEVEL && IsFreePlayEnabled() == 0)
        && disable_when(
            CurrentHealth() < prev(CurrentHealth())
            && CurrentEquippedWeapon() == EQUIPPED_RMARINE
            && CurrentWeaponAmmo() < MAX_HEALTH,
            CanonicalGameState() == STATE_FREE_PLAY_MENU
        )
        && disable_when(
            IsShootingAnyWeapon() 
            && CurrentEquippedWeapon() == EQUIPPED_RMARINE 
            && CurrentScreen() == BOSS_SCREENS["DIVE_MAN"]["previous"][0],
            CanonicalGameState() == STATE_FREE_PLAY_MENU
        )
    
    return
        CurrentStage() == STAGE_ADDRESS_MAP["Dive"]
        && CurrentCheckpoint() == CHECKPOINT_END
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(RequiresMegaManOrMan)
        && trigger_when(CurrentEquippedWeapon() == EQUIPPED_RMARINE && CurrentWeaponAmmo() == 0)
}

// @param primeStage {STAGE_ADDRESS_MAP} - What stage this challenge lives on
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
    primeStage = "Toad",
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
    if (allowJumping == 0 && primeStage != "Wily4") {
        allowJumpingClause = disable_when(
            CanonicalGameState() == STATE_LEVEL && IsJumping(),
            FreePlayChallengeReset()
        )
    } else if (allowJumping == 0 && primeStage == "Wily4") {
        allowJumpingClause = disable_when(
            // unfortunately, the player has to traverse the level and must jump at least once before the boss
            CanonicalGameState() == STATE_LEVEL && CurrentScreen() == 0x14 && IsJumping(),
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

    allowDamageClause = always_true()
    if (allowDamage == 0) {
        allowDamageClause = disable_when(
            CanonicalGameState() == STATE_LEVEL && CurrentHealth() < prev(CurrentHealth()),
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

    cancel =
        never(PlayerDead() && CanonicalGameState() != STATE_FREE_PLAY_MENU && CanonicalGameState() != STATE_MM4_SETTINGS) 
        && never(CanonicalGameState() == STATE_LEVEL && IsFreePlayEnabled() == 0)
        && allowJumpingClause
        && allowSlidingClause
        && allowDamageClause
        && allowETanksClause
        && onlySpecificWeaponClause

    return
        CurrentStage() == STAGE_ADDRESS_MAP[primeStage]
        && CurrentCheckpoint() == primeCheckpoint
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
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

// @param screensMap {previous: [], current: []} - The screens associated with immediately before & during the boss fight.
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
    screensMap = {},
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
    start = HasTransitionedBetweenScreens(screensMap["previous"], screensMap["current"])
    cancel = never(PlayerDead())

    return
        start
        && cancel
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
    start = HasTransitionedBetweenScreens(BOSS_SCREENS["WILY3"]["previous"], BOSS_SCREENS["WILY3"]["current"])
    cancel = never(PlayerDead()) && never(CanonicalGameState() != STATE_LEVEL && CanonicalGameState() != STATE_PAUSE_MENU_OPEN)

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && IsBossKilled(bossDeadHealth = 0, bossLifeBarCount = 2)
        && CurrentEquippedWeapon() == EQUIPPED_WIRE
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

// @param screensMap {previous: [], current: []} - The screens associated with immediately before & during the boss fight.
// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param bossDeadHealth - At what health will victory be achieved? Some bosses like Cossack Catcher trigger a cutscene on 2HP.
// @param bossLifeBarCount - Does this boss have multiple forms? If so, we have to trigger the achievement on killing the final form.
function BossKillNoWeapons(screensMap = {}, requiredCharacters = 0x00, bossDeadHealth = 0, bossLifeBarCount = 1) {
    start = HasTransitionedBetweenScreens(screensMap["previous"], screensMap["current"])

    cancel = 
        never(PlayerDead()) 
        && never(IsShootingAnyWeapon())
        && never(TotalETanksLeft() < prev(TotalETanksLeft()))

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && IsUsingRequiredCharacters(requiredCharacters)
        && trigger_when(IsBossKilled(bossDeadHealth, bossLifeBarCount))
}

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
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

function BrightManStageLightsAlwaysOn() {
    start =
        once(CanonicalGameState() == STATE_LEVEL && prev(CanonicalGameState()) == STATE_LEVEL_INTRO)
        || once(CanonicalGameState() == STATE_LEVEL && CurrentHealth() == MAX_HEALTH && prev(CurrentHealth()) == 0 && CurrentCheckpoint() == CHECKPOINT_NONE)

    cancel =
        never(IsDemoPlaying() == 1)
        && never(Timer() == 0x02 && prev(Timer()) == 0x00)

    return
        start
        && cancel
        && IsUsingOnlyAllowedModifiers()
        && CurrentStage() == STAGE_ADDRESS_MAP["Bright"]
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
        && BossKill(BOSS_SCREENS["WILY4"], requiredCharacters = requiredCharacters, requiredDifficulty = requiredDifficulty)
}

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param requiredDifficulty {0x01: DIFFICULTY_MEDIUM} - The difficulty level required for the achievement to unlock.
function ContinuelessGameClear(requiredCharacters = 0x00, requiredDifficulty = 0x01) {
    cancel = disable_when(CanonicalGameState() == STATE_GAME_OVER)
    return cancel && GameClear(requiredCharacters, requiredDifficulty)
}

// @param requiredCharacters {0x00: RequiresAnyCharacter} - Which characters are required to unlock the achievement
// @param requiredDifficulty {0x01: DIFFICULTY_MEDIUM} - The difficulty level required for the achievement to unlock.
function DeathlessGameClear(requiredCharacters = 0x00, requiredDifficulty = 0x01) {
    cancel = disable_when(CanonicalGameState() == STATE_LEVEL && TotalLivesLeft() < prev(TotalLivesLeft()))
    return cancel && GameClear(requiredCharacters, requiredDifficulty)
}

// @param weaponKey - The weapon we'll be checking the player's inventory for to trigger the unlock (see: WEAPON_ADDRESS_MAP)
function GetWeapon(weaponKey = "Toad") {
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
        && CurrentStage() == STAGE_ADDRESS_MAP["Pharaoh"]
        && CurrentScreen() <= 0x0A // quicksand is visible
        && QuicksandTimer() == 0x02 // the timer is running
}

function PharaohManTurnOffLights() {
    return
        IsUsingOnlyAllowedModifiers()
        && CanonicalGameState() == STATE_LEVEL
        && CurrentStage() == STAGE_ADDRESS_MAP["Pharaoh"]
        && CurrentScreen() > 0x0A // player is underground
        && prev(ScreenDarkness()) == 0x01
        && ScreenDarkness() == 0x02 // it ultimately ticks up to 0x07
}

function DefaultSettingsCheck() {
    start = once(CanonicalGameState() == STATE_MM4_SETTINGS)

    cancel = 
        never(!IsUsingOnlyAllowedModifiers()) 
        && never(CanonicalGameState() != STATE_MM4_SETTINGS && CanonicalGameState() != STATE_STAGE_SELECT)

    return
        start
        && cancel
        && trigger_when(prev(CanonicalGameState()) == STATE_MM4_SETTINGS && CanonicalGameState() == STATE_STAGE_SELECT)
}

function RingManEddie() {
    return
        IsUsingOnlyAllowedModifiers()
        && CanonicalGameState() == STATE_LEVEL
        && CurrentStage() == STAGE_ADDRESS_MAP["Ring"]
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

// TODO: some kind of invalid settings detected icon that persists?
// maybe show this icon on the modifiers screen for MM4

achievement("DEFAULT SETTINGS CHECK", "TODO: describe the default settings here", 0, DefaultSettingsCheck())

achievement("Rain Flush", "Defeat Toad Man", 5, BossKill(BOSS_SCREENS["TOAD_MAN"]))
achievement("Flash Stopper", "Defeat Bright Man", 5, BossKill(BOSS_SCREENS["BRIGHT_MAN"]))
achievement("Pharaoh Shot", "Defeat Pharaoh Man", 5, BossKill(BOSS_SCREENS["PHARAOH_MAN"]))
achievement("Ring Boomerang", "Defeat Ring Man", 5, BossKill(BOSS_SCREENS["RING_MAN"]))
achievement("Dust Crusher", "Defeat Dust Man", 5, BossKill(BOSS_SCREENS["DUST_MAN"]))
achievement("Skull Barrier", "Defeat Skull Man", 5, BossKill(BOSS_SCREENS["SKULL_MAN"]))
achievement("Dive Missile", "Defeat Dive Man", 5, BossKill(BOSS_SCREENS["DIVE_MAN"]))
achievement("Drill Bomb", "Defeat Drill Man", 5, BossKill(BOSS_SCREENS["DRILL_MAN"]))

achievement("Mothraya", "Defeat Mothraya", 5, BossKill(BOSS_SCREENS["COSSACK1"]))
achievement("Square Machine", "Defeat the Square Machine", 5, BossKill(BOSS_SCREENS["COSSACK2"]))
achievement("Cockroach Twins", "Defeat the Cockroach Twins", 5, BossKill(BOSS_SCREENS["COSSACK3"]))
achievement("Cossack Catcher", "Defeat the Cossack Catcher", 5, BossKill(BOSS_SCREENS["COSSACK4"], bossDeadHealth = 0x02))

achievement("Metall Daddy", "Defeat Metall Daddy", 5, BossKill(BOSS_SCREENS["WILY1"]))
achievement("Tako Trash", "Defeat Tako Trash", 5, BossKill(BOSS_SCREENS["WILY2"]))
achievement("Wily Machine 4", "Defeat Wily Machine 4", 5, BossKill(BOSS_SCREENS["WILY3"], bossLifeBarCount = 2))

achievement("Mega Milestone", "As Mega Man, beat the game on Normal or greater on a new file without the use of passwords", 10, GameClear(RequiresMegaManOrMan, DIFFICULTY_MEDIUM))
achievement("Mega Perseverance", "As Mega Man, beat the game on Hard on a new file without the use of passwords", 25, GameClear(RequiresMegaManOrMan, DIFFICULTY_HARD))
achievement("Proto Progress", "As Proto Man, beat the game on Normal or greater on a new file without the use of passwords", 10, GameClear(RequiresProtoMan, DIFFICULTY_MEDIUM))
achievement("Proto Perseverance", "As Proto Man, beat the game on Hard on a new file without the use of passwords", 25, GameClear(RequiresProtoMan, DIFFICULTY_HARD))
achievement("Roll's Resolution", "As Roll, beat the game on Normal or greater on a new file without the use of passwords", 10, GameClear(RequiresRoll, DIFFICULTY_MEDIUM))
achievement("Roll's Perseverance", "As Roll, beat the game on Hard on a new file without the use of passwords", 25, GameClear(RequiresRoll, DIFFICULTY_HARD))

achievement("Toad-ally Unharmed", "Reach Toad Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Toad", RequiresAnyCharacter))
achievement("Spotless Luminary", "Reach Bright Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Bright", RequiresAnyCharacter))
achievement("Tomb Raider", "Reach Pharaoh Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Pharaoh", RequiresAnyCharacter))
achievement("Ring Leader", "Reach Ring Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Ring", RequiresAnyCharacter))
achievement("Dust-free Zone", "Reach Dust Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Dust", RequiresAnyCharacter))
achievement("No Bone to Pick", "Reach Skull Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Skull", RequiresAnyCharacter))
achievement("Surface Tension", "Reach Dive Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Dive", RequiresAnyCharacter))
achievement("Excavating Excellence", "Reach Drill Man's boss doors without taking damage or dying", 10, BossDoorDamageless("Drill", RequiresAnyCharacter))

achievement("Pond Skimming", "As Mega Man, defeat Toad Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["TOAD_MAN"], RequiresMegaManOrMan))
achievement("Mega Watt", "As Mega Man, defeat Bright Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["BRIGHT_MAN"], RequiresMegaManOrMan))
achievement("Busting the Curse", "As Mega Man, defeat Pharaoh Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["PHARAOH_MAN"], RequiresMegaManOrMan))
achievement("Circle of Victory", "As Mega Man, defeat Ring Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["RING_MAN"], RequiresMegaManOrMan))
achievement("Dust Buster", "As Mega Man, defeat Dust Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DUST_MAN"], RequiresMegaManOrMan))
achievement("Skull-busted", "As Mega Man, defeat Skull Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["SKULL_MAN"], RequiresMegaManOrMan))
achievement("Busting the Wave", "As Mega Man, defeat Dive Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DIVE_MAN"], RequiresMegaManOrMan))
achievement("Busting through the Bedrock", "As Mega Man, defeat Drill Man with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DRILL_MAN"], RequiresMegaManOrMan))

achievement("Rainy Defense", "As Proto Man, defeat Toad Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["TOAD_MAN"], RequiresProtoMan))
achievement("Shielding the Spotlight", "As Proto Man, defeat Bright Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["BRIGHT_MAN"], RequiresProtoMan))
achievement("Sphinx Shield Showdown", "As Proto Man, defeat Pharaoh Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["PHARAOH_MAN"], RequiresProtoMan))
achievement("Imperfect Circle", "As Proto Man, defeat Ring Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["RING_MAN"], RequiresProtoMan))
achievement("Shielded Dust-Off", "As Proto Man, defeat Dust Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DUST_MAN"], RequiresProtoMan))
achievement("Bone-proof Armor", "As Proto Man, defeat Skull Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["SKULL_MAN"], RequiresProtoMan))
achievement("Deep Dive Defense", "As Proto Man, defeat Dive Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DIVE_MAN"], RequiresProtoMan))
achievement("Excavator's End", "As Proto Man, defeat Drill Man with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DRILL_MAN"], RequiresProtoMan))

achievement("Cleaning up the Pond", "As Roll, defeat Toad Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["TOAD_MAN"], RequiresRoll))
achievement("Sweeping Away the Darkness", "As Roll, defeat Bright Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["BRIGHT_MAN"], RequiresRoll))
achievement("Dusting Off the Sphinx", "As Roll, defeat Pharaoh Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["PHARAOH_MAN"], RequiresRoll))
achievement("Cleaning the Ring Toss", "As Roll, defeat Ring Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["RING_MAN"], RequiresRoll))
achievement("Spotless Showdown", "As Roll, defeat Dust Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DUST_MAN"], RequiresRoll))
achievement("Sweeping the Bone Yard", "As Roll, defeat Skull Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["SKULL_MAN"], RequiresRoll))
achievement("Deep Sea Broom Brawl", "As Roll, defeat Dive Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DIVE_MAN"], RequiresRoll))
achievement("Dirt-free Drilling", "As Roll, defeat Drill Man with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["DRILL_MAN"], RequiresRoll))

achievement("Slippery Success", "Defeat Toad Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["TOAD_MAN"], RequiresAnyCharacter))
achievement("Untouched Illumination", "Defeat Bright Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["BRIGHT_MAN"], RequiresAnyCharacter))
achievement("Pyramid Scheme", "Defeat Pharaoh Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["PHARAOH_MAN"], RequiresAnyCharacter))
achievement("Flawless Ring Toss", "Defeat Ring Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["RING_MAN"], RequiresAnyCharacter))
achievement("Spotless Showdown", "Defeat Dust Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["DUST_MAN"], RequiresAnyCharacter))
achievement("Bone-Dry Victory", "Defeat Skull Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["SKULL_MAN"], RequiresAnyCharacter))
achievement("Torpedo Dodge Champion", "Defeat Dive Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["DIVE_MAN"], RequiresAnyCharacter))
achievement("Rock Solid Success", "Defeat Drill Man without taking damage", 5, BossKillDamageless(BOSS_SCREENS["DRILL_MAN"], RequiresAnyCharacter))

achievement("Wing Wipeout", "Defeat Mothraya without taking damage", 5, BossKillDamageless(BOSS_SCREENS["COSSACK1"], RequiresAnyCharacter))
achievement("Geometric Genius", "Defeat the Square Machine without taking damage", 5, BossKillDamageless(BOSS_SCREENS["COSSACK2"], RequiresAnyCharacter))
achievement("Roach Rebuke", "Defeat the Cockroach Twins without taking damage", 5, BossKillDamageless(BOSS_SCREENS["COSSACK3"], RequiresAnyCharacter))
achievement("Soviet Showdown", "Defeat the Cossack Catcher without taking damage", 5, BossKillDamageless(BOSS_SCREENS["COSSACK4"], RequiresAnyCharacter))

achievement("Ironed Out", "Defeat Metall Daddy without taking damage", 5, BossKillDamageless(BOSS_SCREENS["WILY1"], RequiresAnyCharacter))
achievement("Tako Trashed", "Defeat Tako Trash without taking damage", 5, BossKillDamageless(BOSS_SCREENS["WILY2"], RequiresAnyCharacter))
achievement("Outsmarted Contraption", "Defeat Wily Machine 4 without taking damage", 5, BossKillDamageless(BOSS_SCREENS["WILY3"], RequiresAnyCharacter, bossLifeBarCount = 2))
achievement("Foiled Again", "Defeat Wily Capsule without taking damage", 5, BossKillDamageless(BOSS_SCREENS["WILY4"], RequiresAnyCharacter))

achievement("Cold Yet Untouched", "Reach Cossack 1's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack1", RequiresAnyCharacter))
achievement("Frost-Free Fortress", "Reach Cossack 2's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack2", RequiresAnyCharacter))
achievement("Polar Performance", "Reach Cossack 3's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack3", RequiresAnyCharacter))
achievement("Ice-Free Invasion", "Reach Cossack 4's boss doors without taking damage or dying", 10, BossDoorDamageless("Cossack4", RequiresAnyCharacter))

achievement("Bug Buster", "As Mega Man, defeat Mothraya with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK1"], RequiresMegaManOrMan))
achievement("Straight-Angle Annihalator", "As Mega Man, defeat the Square Machine with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK2"], RequiresMegaManOrMan))
achievement("Insect Takedown", "As Mega Man, defeat the Cockroach Twins with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK3"], RequiresMegaManOrMan))
achievement("Russian Roulette", "As Mega Man, defeat the Cossack Catcher with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK4"], RequiresMegaManOrMan, bossDeadHealth = 0x02))

achievement("Moth Masher", "As Proto Man, defeat Mothraya with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK1"], RequiresProtoMan))
achievement("Quadrilateral Queller", "As Proto Man, defeat the Square Machine with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK2"], RequiresProtoMan))
achievement("Paired Pest Deflection", "As Proto Man, defeat the Cockroach Twins with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK3"], RequiresProtoMan))
achievement("Cold Conquest", "As Proto Man, defeat the Cossack Catcher with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK4"], RequiresProtoMan, bossDeadHealth = 0x02))

achievement("Swept Wings", "As Roll, defeat Mothraya with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK1"], RequiresRoll))
achievement("Shape Shifter's Nightmare", "As Roll, defeat the Square Machine with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK2"], RequiresRoll))
achievement("Infestation Inhibition", "As Roll, defeat the Cockroach Twins with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK3"], RequiresRoll))
achievement("Cossack's Cleanup Crew", "As Roll, defeat the Cossack Catcher with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["COSSACK4"], RequiresRoll, bossDeadHealth = 0x02))

achievement("Unscathed Approach", "Reach Wily 1's boss doors without taking damage or dying", 10, BossDoorDamageless("Wily1", RequiresAnyCharacter))
achievement("Aggressive Advancement", "Reach Wily 2's boss doors without taking damage or dying", 10, BossDoorDamageless("Wily2", RequiresAnyCharacter))

achievement("Weaponless Win", "As Mega Man, defeat Metall Daddy with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY1"], RequiresMegaManOrMan))
achievement("Dumpster Fire", "As Mega Man, defeat Tako Trash with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY2"], RequiresMegaManOrMan))
achievement("Classic Conquest", "As Mega Man, defeat Wily Machine 4 with only the M. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY3"], RequiresMegaManOrMan, bossLifeBarCount = 2))

achievement("Buster and Shield Showdown", "As Proto Man, defeat Metall Daddy with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY1"], RequiresProtoMan))
achievement("Deflected Garbage", "As Proto Man, defeat Tako Trash with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY2"], RequiresProtoMan))
achievement("Stellar Blues", "As Proto Man, defeat Wily Machine 4 with only the P. Buster [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY3"], RequiresProtoMan, bossLifeBarCount = 2))

achievement("Metall Mopped", "As Roll, defeat Metall Daddy with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY1"], RequiresRoll))
achievement("Trash Sweep", "As Roll, defeat Tako Trash with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY2"], RequiresRoll))
achievement("Wiped Clean", "As Roll, defeat Wily Machine 4 with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY3"], RequiresRoll, bossLifeBarCount = 2))

achievement("Buster Proficiency", "Without dying, defeat all 8 Robot Masters in the boss rush using only the M. Buster [No E-Tanks]", 25, BossRushNoSpecialWeapons(RequiresMegaManOrMan))
achievement("Shield Proficiency", "Without dying, defeat all 8 Robot Masters in the boss rush using only the P. Buster [No E-Tanks]", 25, BossRushNoSpecialWeapons(RequiresProtoMan))
achievement("Broom Proficiency", "Without dying, defeat all 8 Robot Masters in the boss rush using only the R. Broom [No E-Tanks]", 25, BossRushNoSpecialWeapons(RequiresRoll))

// FIXME: These should clearly state the no password & new file requirements
achievement("Mega Momentum [m]", "As Mega Man, beat the game on Normal or greater without ever using a continue", 10, ContinuelessGameClear(RequiresMegaManOrMan, DIFFICULTY_MEDIUM))
achievement("Mega Mastery [m]", "As Mega Man, beat the game on Hard without ever using a continue", 10, ContinuelessGameClear(RequiresMegaManOrMan, DIFFICULTY_HARD))
achievement("Proto Progress [m]", "As Proto Man, beat the game on Normal or greater without ever using a continue", 10, ContinuelessGameClear(RequiresProtoMan, DIFFICULTY_MEDIUM))
achievement("Proto Perfection [m]", "As Proto Man, beat the game on Hard without ever using a continue", 10, ContinuelessGameClear(RequiresProtoMan, DIFFICULTY_HARD))
achievement("Roll's Resolve [m]", "As Roll, beat the game on Normal or greater without ever using a continue", 10, ContinuelessGameClear(RequiresRoll, DIFFICULTY_MEDIUM))
achievement("Roll's Resilience [m]", "As Roll, beat the game on Hard without ever using a continue", 10, ContinuelessGameClear(RequiresRoll, DIFFICULTY_HARD))

// FIXME: These should clearly state the no password & new file requirements
achievement("Mega Maniac", "As Mega Man, beat the game on Hard without losing a life", 50, DeathlessGameClear(RequiresMegaManOrMan, DIFFICULTY_HARD))
achievement("Agent of Anarchy", "As Proto Man, beat the game on Hard without losing a life", 50, DeathlessGameClear(RequiresProtoMan, DIFFICULTY_HARD))
achievement("Maid of Mayhem", "As Roll, beat the game on Hard without losing a life", 50, DeathlessGameClear(RequiresRoll, DIFFICULTY_HARD))

achievement("Ancient Air-lift [m]", "Acquire the Balloon Adaptor on Pharaoh Man's stage", 5, GetWeapon("Balloon"))
achievement("Wire We Diving? [m]", "Acquire the Wire Adaptor on Dive Man's stage", 5, GetWeapon("Wire"))

// Idea credit: Lion Sum
achievement("Pharaoh's Flood", "Harden the quicksand in Pharaoh Man's stage with Rain Flush", 1, PharaohManHardenQuicksand())
// Idea credit: Lion Sum
achievement("Desert Blackout", "Turn off the lights in Pharaoh Man's stage with Rain Flush", 1, PharaohManTurnOffLights())

// Idea credit: Fox in Yellow Socks
achievement(
    "What is a man?",
    "Beat the game as Man - All settings and cheats are allowed!",
    10,
    RequireNewFileWithoutPasswords()
    && BossKill(
        BOSS_SCREENS["WILY4"],
        requiredDifficulty = DIFFICULTY_EASY,
        requiredCharacters = RequiresMan,
        allowInfiniteAmmo = 1,
        allowInfiniteLives = 1,
        allowAirSliding = 1,
        allowDoubleJump = 1,
        allowFullArsenal = 1,
        allowBurstChaser = 1
    )
)

// Idea credit: JackelZXA
achievement("Intergalactic Eddie", "Find Eddie on Ring Man's stage", 1, RingManEddie())

achievement("The Kremlin Crawl", "Unlock Dr. Cossack's stages by defeating all eight Robot Masters [No Passwords]", 10, RobotMastersClear())
achievement("9 Times the Charm", "Collect 9 lives", 5, NineLives())
achievement("Soda Popinski's Envy", "Collect 9 E-Tanks", 5, NineETanks())

achievement("Lumen-ating Path", "Reach Bright Man in his stage without turning the lights off", 5, BrightManStageLightsAlwaysOn())

// Idea credit: JackelZXA
achievement("Tako 'Bout Defense!", "As Proto Man, defeat Tako Trash using only the shield [No E-Tanks]", 5, BossKillNoWeapons(BOSS_SCREENS["WILY2"], RequiresProtoMan))

// Idea: Fox in Yellow Socks
achievement("Wired for Victory", "Deliver the killing blow to Wily Machine 4 with the Wire Adaptor", 5, WilyMachine4WireKill())

// Idea: Fox in Yellow Socks
achievement(
    "[Dev Team Challenge I] Bright Man",
    "[FREE PLAY MODE: Bright, Checkpoint 2] Defeat Bright Man damageless using only Rain Flush",
    25,
    FreePlayBossKill("Bright", CHECKPOINT_END, allowDamage = 0, onlySpecificWeapon = EQUIPPED_RFLUSH)
)

// Idea: Fox in Yellow Socks
achievement(
    "[Dev Team Challenge II] Dive Man",
    "[FREE PLAY MODE: Dive, Checkpoint 2] Start the fight against Dive Man with full Rush Marine ammo and spend all that ammo without taking damage",
    25,
    DiveManMarineChallenge()
)

// Idea: Fox in Yellow Socks
achievement(
    "[Dev Team Challenge III] Mothraya",
    "[FREE PLAY MODE: Cossack 1, Checkpoint 2] Defeat Mothraya damageless without jumping and with Full Arsenal enabled",
    25,
    FreePlayBossKill("Cossack1", CHECKPOINT_END, allowDamage = 0, allowJumping = 0, allowFullArsenal = MustBeEnabled)
)

// Idea: Fox in Yellow Socks
// solution: D.Missile
achievement(
    "[Dev Team Challenge IV] Cockroach Twins",
    "[FREE PLAY MODE: Cossack 3, Checkpoint 2] Defeat the Cockroach Twins without jumping and without E-Tanks",
    10,
    FreePlayBossKill("Cossack3", CHECKPOINT_END, allowJumping = 0, allowETanks = 0)
)

// Idea: Fox in Yellow Socks
// Solution: G.Attack + Blind spot on leftmost spot of screen
achievement(
    "[Dev Team Challenge V] Cossack Catcher",
    "[FREE PLAY MODE: Cossack 4, Checkpoint 2] Defeat Cossack Catcher damageless without jumping, without sliding, and with Full Arsenal enabled",
    25,
    FreePlayBossKill("Cossack4", CHECKPOINT_END, allowDamage = 0, allowJumping = 0, allowSliding = 0, allowFullArsenal = MustBeEnabled)
)

// Idea: Fox in Yellow Socks
// Solution: Ring Man weapon + Balloon item
achievement(
    "[Dev Team Challenge VI] Metall Daddy",
    "[FREE PLAY MODE: Wily 1, Checkpoint 2] Defeat Metall Daddy damageless and without sliding",
    25,
    FreePlayBossKill("Wily1", CHECKPOINT_END, allowSliding = 0, allowDamage = 0)
)

// Idea: Fox in Yellow Socks
// Solution: Stand near the middle and slide
achievement(
    "[Dev Team Challenge VII] Wily Capsule",
    "[FREE PLAY MODE: Wily 4, Checkpoint 1] Defeat Wily Capsule without jumping",
    25,
    FreePlayBossKill("Wily4", CHECKPOINT_NONE, allowJumping = 0)
)

// Idea: Fox in Yellow Socks
// solution: farm health from respawning enemies
achievement(
    "[Dev Team Challenge VIII] Toad Man's Stage",
    "[FREE PLAY MODE: Toad, Checkpoint 0] With Full Arsenal enabled, reach Toad Man's boss doors without dying, without E-Tanks, and only using the Mega Man 6 Power Adaptor",
    25,
    FreePlayStageClear("Toad", onlySpecificWeapon = EQUIPPED_MM6_POWERADAPTOR, allowETanks = 0, allowFullArsenal = MustBeEnabled, requiredCharacters = RequiresMegaManOrMan, allowSliding = 0)
)

// Idea: Fox in Yellow Socks
// solution: farm resources on mini bosses
achievement(
    "[Dev Team Challenge IX] Ring Man's Stage",
    "[FREE PLAY MODE: Ring, Checkpoint 0] Reach Ring Man's boss doors without dying, without E-Tanks, and only using the Pharaoh Shot",
    25,
    FreePlayStageClear("Ring", onlySpecificWeapon = EQUIPPED_PSHOT, allowETanks = 0)
)

// Idea: Fox in Yellow Socks
// Solution: fly to edges and pop around to destroy missiles
achievement(
    "[Dev Team Challenge X] Drill Man's Stage",
    "[FREE PLAY MODE: Drill, Checkpoint 0] With Full Arsenal enabled, reach Drill Man's boss doors without dying, without E-Tanks, and only using the Mega Man 6 Power Adaptor",
    25,
    FreePlayStageClear("Drill", onlySpecificWeapon = EQUIPPED_MM6_POWERADAPTOR, allowETanks = 0, allowFullArsenal = MustBeEnabled, requiredCharacters = RequiresMegaManOrMan, allowSliding = 0)
)

// Idea: JackelZXA, Fox in Yellow Socks // PUT THIS IN A SUBSET
// SUBSET achievement("R Wily Capsule Broom Only", "As Roll, defeat Wily Capsule with only the R. Broom [No E-Tanks]", 5, BossKillNoSpecialWeapons(BOSS_SCREENS["WILY4"], RequiresRoll))
// TODO: SUBSET!! 3 mr.perfect achievements

achievement("A Mega Surprise", "On Dr. Cossack's third stage, hold on to a platform with Wire for as long as possible during an autoscroll section", 1, WireEasterEgg())
achievement("Drilling a New Passage", "Use Drill Bomb on Tako Trash to vaporize his hitbox, then walk behind him", 1, TakoTrashHitboxHidingSpot())
achievement("A Splash of Ingenuity [m]", "Immediately after defeating Wily Machine 4, use Rain Flush on Dr. Wily's capsule before he can fly away", 1, WilyUmbrellaEasterEgg())

// TODO: Use Flash Stopper to skip a snail miniboss on Toad Man's stage (frijoles / FlashbackYT)

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
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() < STAGE_ADDRESS_MAP["Cossack1"] && (CurrentCheckpoint() == CHECKPOINT_NONE || CurrentCheckpoint() == CHECKPOINT_MID),
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
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == STAGE_ADDRESS_MAP["Wily3"]
    && CurrentStage() == STAGE_ADDRESS_MAP["Wily3"] 
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
    && CurrentStage() == STAGE_ADDRESS_MAP["Wily3"] 
    && (CurrentCheckpoint() == CHECKPOINT_END),

    "{0} • {1} • {2}/8 • {3} {4} • In the Boss Rush of Dr. Wily's third stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == STAGE_ADDRESS_MAP["Wily3"] && CurrentCheckpoint() == CHECKPOINT_FINISHED_BOSS_RUSH,
    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily Machine 4",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == STAGE_ADDRESS_MAP["Wily4"] && BossActive() == BOSS_ACTIVE_WILY_CAPSULE,
    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily Capsule",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_lookup("Lives", TotalLivesLeft(), livesCountLabels, "3"),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() >= STAGE_ADDRESS_MAP["Cossack1"] && (CurrentCheckpoint() == CHECKPOINT_NONE || CurrentCheckpoint() == CHECKPOINT_MID),
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