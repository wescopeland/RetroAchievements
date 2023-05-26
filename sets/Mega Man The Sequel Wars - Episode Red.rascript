// ~Homebrew~ Mega Man: The Sequel Wars - Episode Red
// #ID = 24453

// Memory -------------------------------------------------------------------------------------------------------------------------
function TotalLivesLeft() => byte(0x01A0)
function CurrentXPosition() => byte(0x0388)
function BossActive() => byte(0x2651)
function CurrentHealth() => byte(0x26DE)
function IsDemoPlaying() => byte(0x2604)

function CurrentDifficulty() => byte(0x26EC)
DIFFICULTY_EASY = 0x00
DIFFICULTY_MEDIUM = 0x01
DIFFICULTY_HARD = 0x02

function CurrentCheckpoint() => byte(0x2879)
CHECKPOINT_NONE = 0x00
CHECKPOINT_MID = 0x01
CHECKPOINT_END = 0x02
CHECKPOINT_FINISHED_BOSS_RUSH = 0x03

function CurrentCharacter() => byte(0x287F)
CHAR_MEGAMAN = 0x00
CHAR_PROTOMAN = 0x01
CHAR_ROLL = 0x02
CHAR_MAN = 0x03

function IsPlayerLocked() => byte(0x28A4)

WEPUNLOCKED_1 = 0x296A
WEPUNLOCKED_2 = 0x296B
WEAPONS_EARNED = [
    bit1(WEPUNLOCKED_1), // Skull Man
    bit2(WEPUNLOCKED_1), // Drill Man
    bit3(WEPUNLOCKED_1), // Toad Man
    bit4(WEPUNLOCKED_1), // Dust Man
    bit5(WEPUNLOCKED_1), // Ring Man
    bit6(WEPUNLOCKED_1), // Dive Man
    bit7(WEPUNLOCKED_1), // Pharaoh Man
    bit0(WEPUNLOCKED_2)  // Bright Man
]

function CanonicalGameState() => byte(0x29FD)
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
STATE_ENDING_ONE = 0x1A
STATE_ENDING_TWO = 0x1B

function CurrentStage() => byte(0x2E55)
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

ENTITY_I_ADDR = 0x306A


// Utils --------------------------------------------------------------------------------------------------------------------------
BOSS_ACTIVE_WILY_CAPSULE = 0x0A
BOSS_CORRIDOR_RIGHT_DOOR_POS = 0xFA
COSSACK_ONE = 0x08
MAX_HEALTH = 0x1C
WILY_THREE = 0x0E
WILY_FOUR = 0x0F

function PlayerDead() => CurrentHealth() == 0
function PlayerTouchingBossEntranceDoor() => CurrentXPosition() >= BOSS_CORRIDOR_RIGHT_DOOR_POS - 1

function BossHealth() {
    BossActivePointer = BossActive() * (16 * 2)
    return byte(ENTITY_I_ADDR + BossActivePointer + 4)
}


// Achievement Functions ----------------------------------------------------------------------------------------------------------
function BossKill(bossKey) {
    start = once(PlayerTouchingBossEntranceDoor())
    cancel = never(PlayerDead())

    return
        start
        && cancel
        && CurrentDifficulty() >= DIFFICULTY_MEDIUM
        && CurrentStage() == STAGE_ADDRESS_MAP[bossKey]
        && CurrentCheckpoint() == CHECKPOINT_END
        && trigger_when(
            (BossHealth() == 0 && prev(BossHealth()) > 0)
            && (once(IsPlayerLocked() == 0 && prev(IsPlayerLocked()) == 1))
        )
}

function BossDoorDamageless(bossKey, requiredCharacter) {
    start = 
        (
            once(CanonicalGameState() == STATE_LEVEL && prev(CanonicalGameState()) == STATE_LEVEL_INTRO)
            || once(CurrentHealth() == MAX_HEALTH && prev(CurrentHealth()) == 0 && CurrentCheckpoint() == CHECKPOINT_NONE)
        )
        once(CurrentStage() == STAGE_ADDRESS_MAP[bossKey])

    cancel = never(IsDemoPlaying() == 1) && never(CurrentHealth() < MAX_HEALTH)

    return
        start
        && cancel
        && CurrentCharacter() == requiredCharacter
        && CurrentDifficulty() >= DIFFICULTY_MEDIUM
        && trigger_when(CurrentCheckpoint() == CHECKPOINT_END)
}


// Achievements -------------------------------------------------------------------------------------------------------------------

// TODO: some kind of invalid settings detected icon that persists?

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

// @see CurrentStage()
doctorVillainLabels = {
    0x08: "Cossack",
    0x09: "Cossack",
    0x0A: "Cossack",
    0x0B: "Cossack",
    0x0C: "Wily",
    0x0D: "Wily",
    0x0E: "Wily",
    0x0F: "Wily"
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
    rich_presence_value("Lives", TotalLivesLeft()),
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
    rich_presence_value("Lives", TotalLivesLeft()),
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
    rich_presence_value("Lives", TotalLivesLeft()),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == WILY_THREE && CurrentCheckpoint() == CHECKPOINT_FINISHED_BOSS_RUSH,
    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily Machine 4",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_value("Lives", TotalLivesLeft()),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() == WILY_FOUR && BossActive() == BOSS_ACTIVE_WILY_CAPSULE,
    "{0} • {1} • {2}/8 • {3} {4} • Fighting Wily Capsule",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_value("Lives", TotalLivesLeft()),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives")
)

rich_presence_conditional_display(
    (CanonicalGameState() == STATE_LEVEL || CanonicalGameState() == STATE_PAUSE_MENU_OPEN) && CurrentStage() >= COSSACK_ONE && (CurrentCheckpoint() == CHECKPOINT_NONE || CurrentCheckpoint() == CHECKPOINT_MID),
    "{0} • {1} • {2}/8 • {3} {4} • {5} {6}'s {7} stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_value("Lives", TotalLivesLeft()),
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
    rich_presence_value("Lives", TotalLivesLeft()),
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
    CanonicalGameState() == STATE_WEAPON_GET,
    "{0} • {1} • {2}/8 • {3} {4} • Getting {5}'s weapon",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_value("Defeated Bosses", sum_of(range(0, 8), b => bit(b, 0x269A))),
    rich_presence_value("Lives", TotalLivesLeft()),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_lookup("Stage", CurrentStage(), stageLabels, "a bad guy")
)

rich_presence_conditional_display(
    CanonicalGameState() == STATE_COSSACK_WILY_LEVEL_INTRO_SCREEN,
    "{0} • {1} • Preparing to enter a Dr. {2} stage",
    rich_presence_lookup("Character", CurrentCharacter(), characterLabels),
    rich_presence_lookup("Difficulty", CurrentDifficulty(), difficultyLabels),
    rich_presence_lookup("Villain Name", CurrentStage(), doctorVillainLabels, "Cossack")
)

rich_presence_display("Playing Mega Man 4")
