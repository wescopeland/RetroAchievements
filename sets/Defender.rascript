// Defender
// #ID = 15020
// https://retroachievements.org/game/15020

function AttackWaveCompletedText1() => byte(0x7B50)
function AttackWaveCompletedText2() => byte(0x7B53)
function AttackWaveCompletedText3() => byte(0x7C50)
function AttackWaveCompletedText4() => byte(0x7C51)
function AttackWaveCompletedText5() => byte(0x7C52)
function AttackWaveCompletedText6() => byte(0x7C53)
function AttackWaveCompletedText7() => byte(0x7C54)
function AttackWaveCompletedText8() => byte(0x7C55)
function AttackWaveCompletedText9() => byte(0x7C56)
Showing = 0x11

// NOTE: These are unused - they cause RATools to blow up and dump all the achievement logic.
function AttackWaveCompletedTextCondensed2() => word(0x7C50)
function AttackWaveCompletedTextCondensed3() => tbyte(0x7C54)

function Credits() => byte(0xE237)
function IsFireButtonPressed() => bit0(0xE27B)
function isThrustButtonPressed() => bit1(0xE27B)
function IsSmartBombButtonPressed() => bit2(0xE27B)
function IsHyperspaceButtonPressed() => bit3(0xE27B)
function IsReverseButtonPressed() => bit6(0xE27B)
function IsDownPressed() => bit7(0xE27B)
function IsUpPressed() => bit0(0xE27D)

function CurrentPlayer() => byte(0xE28B)
PlayerOne = 0x01
PlayerTwo = 0x02

function PlayerCount() => byte(0xE28C)
OnePlayer = 0x01
TwoPlayer = 0x02

function CurrentSoundInstruction() => word(0xE2B0)
KilledBaiter = 0x01D5
LanderCapturedHumanoid = 0x10D5
PlayerCaughtHumanoid = 0xDBD4
HumanoidReturnedToGround = 0xE0D4
HumanoidKilled = 0xE5D4

function IsGamePlayable()     => byte(0xE2B7)                   // $E2B7: [8-bit] Is game playable? (boolean)

function GameState() => byte(0xE2BA)
GameMaybePlaying = 0x00
FreeSpace = 0x02
PlanetSpaceSpawning = 0x05
FreeSpaceSpawning = 0x07
PlayerWarpingInFromHyperspace = 0x50
PlayerKilled = 0x58
WaveCompletedScreenOrHyperspace = 0x77
BootChecksRunning = 0x88
GameStartingOrPlayerExploding = 0x7F
TitleScreen = 0xFB
Bootup = 0xFD
AttractMode = 0xD9
MaybeGameOver = 0xFF

function CurrentShipDirection() => byte(0xE2BB)
ShipRight = 0x03
ShipLeft = 0xFD

function HumanoidsRemaining() => byte(0xE2FA)                   // $E2FA: [8-bit] Humanoids Remaining
AllHumanoidsRemaining = 0x0A

function LandersRemaining() => byte(0xE312)
function MutantsRemaining() => byte(0xE315)
function BaiterSpawnTimer() => byte(0xE318)
function BaitersRemaining() => byte(0xE319)

// $E3C3: Player 1 Score (BCD)
function ScoreX00000() => high4(0xE3C3)
function Score() => bcd(tbyte_be(0xE3C3))

function BonusScoreXX0000()             => byte(0xE3C6)         // $E3C6: [8-bit] Player 1 Next Life Interval (BCD)
function BonusScore00XX00()             => byte(0xE3C7)         // $E3C7: [8-bit] Player 1 Next Life Interval (BCD)
function PlayerOneLives()               => byte(0xE3C9)         // $E3C9: [8-bit] Player 1 On-screen Lives Remaining
function PlayerOneCurrentWave()         => byte(0xE3CA)         // $E3CA: [8-bit] Player 1 Current Wave
function PlayerOneSmartBombsRemaining() => byte(0xE3CB)         // $E3CB: [8-bit] Player 1 Smart Bombs Remaining

// --------------------------------------------------------
// Helper Functions
// --------------------------------------------------------

// Game state functions
function OnePlayerMode() => PlayerCount() == OnePlayer
function TwoPlayerMode() => PlayerCount() == TwoPlayer
function PlanetSpaceSpawning() => GameState() == PlanetSpaceSpawning
function PlayerOneActive() => CurrentPlayer() == PlayerOne
function GameOver() => GameState() == MaybeGameOver
function Dead() => GameState() == PlayerKilled
// function ShowingWaveCompletedScreen() => GameState() == WaveCompletedScreenOrHyperspace && LandersRemaining() == 0

function ShowingWaveCompletedScreen() => (
    AttackWaveCompletedText1() == Showing
    && AttackWaveCompletedText2() == Showing
    && AttackWaveCompletedText3() == Showing
    && AttackWaveCompletedText4() == Showing
    && AttackWaveCompletedText5() == Showing
    && AttackWaveCompletedText6() == Showing
    && AttackWaveCompletedText7() == Showing
    && AttackWaveCompletedText8() == Showing
    && AttackWaveCompletedText9() == Showing
)

// Bonuses are awarded every 10,000 points
// Game starts with 3 lives and 3 smart bombs (same variable)
function DefaultSettings() => (
    BonusScoreXX0000() == 0x01    
    && BonusScore00XX00() == 0x00
    && never(
        PlayerOneCurrentWave() == 01
        && Score() == 0
        && PlayerOneSmartBombsRemaining() != 3
    )
)

// --------------------------------------------------------
// Achievements Functions
// --------------------------------------------------------

function IsUsingDefaultSettings() {
    start = once(GameState() == TitleScreen)
    
    cancel =
        never(PlanetSpaceSpawning() && TwoPlayerMode())
        && never(PlanetSpaceSpawning() && BonusScoreXX0000() != 0x01)
        && never(PlanetSpaceSpawning() && BonusScore00XX00() != 0x00)
        && never(PlanetSpaceSpawning() && Score() == 0 && PlayerOneSmartBombsRemaining() != 3)
    
    return start && cancel && trigger_when(DefaultSettings() && PlayerOneActive())
}

function Progress(waveNumber) {
    triggerWaveNumber = waveNumber
    if (waveNumber != 1) {
        triggerWaveNumber = waveNumber + 1
    }

    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(GameOver())
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == triggerWaveNumber
        && ShowingWaveCompletedScreen()
    )
}

function DeathlessProgressNoTrigger(waveNumber) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(Dead(), PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0)
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == waveNumber
        && ShowingWaveCompletedScreen()
    )
}

function DeathlessProgress(waveNumber) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(Dead(), PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0)
    
    return (
        start
        && cancel
        && once(PlayerOneCurrentWave() == waveNumber && prev(PlayerOneCurrentWave()) == waveNumber - 1)
        && trigger_when(PlayerOneCurrentWave() == waveNumber + 1 && ShowingWaveCompletedScreen())
    )
}

function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames
function DeathlessTime(time, showAlertTime) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = (
        never(Dead())
        && never(PlayerOneLives() == 0)
        && never(
            GameState() != WaveCompletedScreenOrHyperspace
            && GameState() != GameStartingOrPlayerExploding
            && PlayerOneLives() < prev(PlayerOneLives())
        )
    )
    
    return (
        start
        && cancel
        && repeated(showAlertTime, PlayerOneActive())
        && trigger_when(repeated(time, PlayerOneActive()))
    )
}

function ProgressTime(waveNumber, time) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(GameOver()) && never(repeated(time, PlayerOneActive()))
    
    return start && cancel && ShowingWaveCompletedScreen() && PlayerOneCurrentWave() == waveNumber
}

function NoVerticalMovementProgress(waveNumber) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(
        IsUpPressed() == 1 || IsDownPressed() == 1,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    ) && disable_when(GameOver(), PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0)
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == waveNumber
        && trigger_when(ShowingWaveCompletedScreen())
    )
}

// This function has no trigger_when().
function WaveOneHumanoidsRemainingProgress(neededHumanoids) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(HumanoidsRemaining() < neededHumanoids && PlayerOneCurrentWave() < 1)
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == 1
        && ShowingWaveCompletedScreen()
        && HumanoidsRemaining() == neededHumanoids
    )
} 

function HumanoidsRemainingProgress(waveNumber, neededHumanoids) {
    triggerWaveNumber = 1
    if (waveNumber != 1) {
        triggerWaveNumber = waveNumber + 1
    }

    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(HumanoidsRemaining() < neededHumanoids && PlayerOneCurrentWave() <= waveNumber)
    
    return (
        start
        && cancel
        && once(PlayerOneCurrentWave() == waveNumber)
        && trigger_when(PlayerOneCurrentWave() == triggerWaveNumber && ShowingWaveCompletedScreen() && HumanoidsRemaining() >= neededHumanoids)
    )
}

function NoTriggerWithoutButtonProgress(waveNumber, buttonPressCondition) {
    triggerWaveNumber = 1
    if (waveNumber != 1) {
        triggerWaveNumber = waveNumber + 1
    }
    
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(
        buttonPressCondition == 0x01,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    ) && disable_when(GameOver(), PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0)
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == triggerWaveNumber
        && ShowingWaveCompletedScreen()
    )
}

function WithoutButtonProgress(waveNumber, buttonPressCondition) {
    triggerWaveNumber = 1
    if (waveNumber != 1) {
        triggerWaveNumber = waveNumber + 1
    }

    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(
        buttonPressCondition == 0x01,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    ) && disable_when(GameOver(), PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0)
    
    return (
        start
        && cancel
        && once(PlayerOneCurrentWave() == waveNumber)
        && trigger_when(PlayerOneCurrentWave() == triggerWaveNumber && ShowingWaveCompletedScreen())
    )
}

function LimitedFireProgress(waveNumber, maxPressCount) {
    triggerWaveNumber = 1
    if (waveNumber != 1) {
        triggerWaveNumber = waveNumber + 1
    }

    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(
        repeated(
            maxPressCount + 1,
            IsFireButtonPressed() == 1 && prev(IsFireButtonPressed()) != 1
        ),
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    ) && disable_when(GameOver(), PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0)
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == triggerWaveNumber
        && trigger_when(ShowingWaveCompletedScreen())
    )
}

function NoBaiterProgress(waveNumber) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(
        BaitersRemaining() != 0,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    )
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == waveNumber + 1
        && trigger_when(ShowingWaveCompletedScreen())
    )
}

function EarnedScore(score) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(GameOver())
    
    anticheat = disable_when(
        PlayerOneCurrentWave() == 1 && Score() > 20000
    )
    
    return start && cancel && anticheat && Score() >= score
}

function DeathlessEarnedScore(score, showTriggerScore) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(Dead(), PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0)
    
    return (
        start
        && cancel
        && Score() >= showTriggerScore
        && trigger_when(Score() >= score)
    )
}

function DeathlessEarnedScoreNoTrigger(score) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(Dead(), PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0)
    
    return (
        start
        && cancel
        && Score() >= score
    )
}

function ReserveLives() {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(GameOver())
    
    return (
        start
        && cancel
        && GameState() != GameStartingOrPlayerExploding
        && GameState() != WaveCompletedScreenOrHyperspace
        && PlayerOneLives() > 5
    )
}

function CatchHumanoid() {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(GameOver())
    
    return start && cancel && CurrentSoundInstruction() == PlayerCaughtHumanoid
}

function ReturnHumanoidToGround() {
    start = once(PlayerOneActive())
    
    // FIXME: Is this okay?
    cancel = never(GameOver()) && never(PlanetSpaceSpawning())

    return (
        start
        && cancel
        && once(CurrentSoundInstruction() == PlayerCaughtHumanoid)
        && CurrentSoundInstruction() == HumanoidReturnedToGround
    )
}

function FirstHumanoidSurvival() {
    start = once(
        PlayerOneActive()
        && DefaultSettings()
        && PlayerOneCurrentWave() == 1
        && HumanoidsRemaining() == 1
    )
    
    cancel = disable_when(
        PlayerOneCurrentWave() >= 1 && HumanoidsRemaining() == 0,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    )
    
    return (
        start
        && cancel
        && trigger_when(
            ShowingWaveCompletedScreen()
            && prev(PlayerOneCurrentWave()) == 2 && PlayerOneCurrentWave() == 3
        )
    )
}

function HumanoidSurvival(targetWaveNumber) {
    start = once(
        PlayerOneActive() 
        && DefaultSettings() 
        && PlayerOneCurrentWave() == 2 
        && HumanoidsRemaining() == 1
    )
    
    cancel = disable_when(
        PlayerOneCurrentWave() > 1 && HumanoidsRemaining() == 0,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    )
    
    return (
        start
        && cancel
        && once(PlayerOneCurrentWave() == targetWaveNumber)
        && trigger_when(
            ShowingWaveCompletedScreen() 
            && prev(PlayerOneCurrentWave()) == targetWaveNumber && PlayerOneCurrentWave() == (targetWaveNumber + 1)
        )
    )
}

function FreeSpaceSurveyor() {
    start = once(
        PlayerOneActive()
        && DefaultSettings()
        && PlayerOneCurrentWave() == 2
        && HumanoidsRemaining() == 0
    )
    
    cancel = never(GameOver())
    
    anticheat = disable_when(
        PlayerOneCurrentWave() == 1 && Score() > 20000
    )
    
    return (
        start
        && cancel
        && anticheat
        && trigger_when(
            ShowingWaveCompletedScreen() && PlayerOneCurrentWave() == 5
        )
    )
}

function HellInSpace() {
    start = once(
        PlayerOneActive()
        && DefaultSettings()
        && PlayerOneCurrentWave() == 2
        && HumanoidsRemaining() == 0
    )
    
    cancel = never(GameOver()) && disable_when(
        PlayerOneCurrentWave() >= 2 && IsSmartBombButtonPressed() == 1,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    )
    
    anticheat = disable_when(
        PlayerOneCurrentWave() == 1 && Score() > 20000
    )
    
    return (
        start
        && cancel
        && anticheat
        && trigger_when(
            ShowingWaveCompletedScreen() && PlayerOneCurrentWave() == 5
        )
    )
}


achievement("DEFAULT SETTINGS CHECK", "Lives = 3, Bonus Life = 10000, One Player Mode. Reset the game once on bootup to begin playing.", 0, IsUsingDefaultSettings())

achievement("First Flight", "Clear Wave One", 5, Progress(1))
achievement("Skyward Sentry", "Clear Wave Two", 5, Progress(2))
achievement("Star Patrol", "Clear Wave Three", 5, Progress(3))
achievement("Aerial Adept", "Clear Wave Four", 10, Progress(4))
achievement("Cosmic Captain", "Clear Wave Five", 10, Progress(5))
achievement("Galactic Gatekeeper", "Clear Wave Six", 10, Progress(6))
achievement("Stellar Sentinel", "Clear Wave Seven", 25, Progress(7))
achievement("Celestial Champion", "Clear Wave Eight", 50, Progress(8))

achievement("Flawless First Flight", "Clear Wave One on your first life", 5, DeathlessProgressNoTrigger(1))
achievement("Flawless Skyward Sentry", "Clear Wave Two on your first life", 10, DeathlessProgress(2))
achievement("Flawless Star Patrol", "Clear Wave Three on your first life", 10, DeathlessProgress(3))
achievement("Flawless Aerial Adept", "Clear Wave Four on your first life", 25, DeathlessProgress(4))
achievement("Flawless Cosmic Captain", "Clear Wave Five on your first life", 25, DeathlessProgress(5))

achievement("Full House I", "Clear Wave 1 with 10 humanoids remaining", 5, WaveOneHumanoidsRemainingProgress(10))
achievement("Full House II", "Clear Wave 2 with 10 humanoids remaining", 5, HumanoidsRemainingProgress(2, 10))
achievement("Full House III", "Clear Wave 3 with 10 humanoids remaining", 10, HumanoidsRemainingProgress(3, 10))
achievement("Full House IV", "Clear Wave 4 with 10 humanoids remaining", 10, HumanoidsRemainingProgress(4, 10))
achievement("Full House V", "Clear Wave 5 with 10 humanoids remaining", 25, HumanoidsRemainingProgress(5, 10))

achievement("Score and Soar", "Earn an extra life and smart bomb by scoring 10,000 points", 5, EarnedScore(10000))

achievement("Continuity Cache", "Hold more than 5 lives in reserve", 10, ReserveLives())

achievement("Life Saver I", "Catch a humanoid", 3, CatchHumanoid())
achievement("Life Saver II", "Return a humanoid to the ground", 2, ReturnHumanoidToGround())

achievement("Space Invaders Tribute", "Clear a wave without pressing Up or Down", 10, NoVerticalMovementProgress(1))

achievement("No-Bomb Novice", "Clear Wave 1 without ever using a smart bomb", 5, NoTriggerWithoutButtonProgress(1, IsSmartBombButtonPressed()))
achievement("No-Bomb Newcomer", "Clear Wave 2 without ever using a smart bomb", 5, WithoutButtonProgress(2, IsSmartBombButtonPressed()))
achievement("No-Bomb Notable", "Clear Wave 3 without ever using a smart bomb", 10, WithoutButtonProgress(3, IsSmartBombButtonPressed()))
achievement("No-Bomb Natural", "Clear Wave 4 without ever using a smart bomb", 10, WithoutButtonProgress(4, IsSmartBombButtonPressed()))

achievement("Straight Shooter I", "Clear Wave 1 without ever using reverse", 5, WithoutButtonProgress(1, IsReverseButtonPressed()))
achievement("Straight Shooter II", "Clear Wave 2 without ever using reverse", 5, WithoutButtonProgress(2, IsReverseButtonPressed()))

achievement("Minimalist Marksman", "Clear Wave 1 without pressing Fire more than 5 times", 10, LimitedFireProgress(1, 5))

achievement("Baiter-Free Breeze", "Reach Wave 3 with no baiters ever spawning", 10, NoBaiterProgress(2))

achievement("Edge of Extinction I", "Begin Wave 2 with one humanoid remaining, and ensure it survives until reaching Wave 3", 5, FirstHumanoidSurvival())
achievement("Edge of Extinction II", "Begin Wave 2 with one humanoid remaining, and ensure it survives until reaching Wave 4", 10, HumanoidSurvival(3))
achievement("Edge of Extinction III", "Begin Wave 2 with one humanoid remaining, and ensure it survives until reaching Wave 5", 10, HumanoidSurvival(4))

achievement("One-Minute Warrior", "Survive for longer than 1 minute on your first life", 5, DeathlessTime(TimeSpan(1, 0, 0), TimeSpan(0, 30, 0)))
achievement("Two-Minute Warrior", "Survive for longer than 2 minutes on your first life", 10, DeathlessTime(TimeSpan(2, 0, 0), TimeSpan(1, 30, 0)))
achievement("Three-Minute Warrior", "Survive for longer than 3 minutes on your first life", 25, DeathlessTime(TimeSpan(3, 0, 0), TimeSpan(2, 30, 0)))
achievement("Four-Minute Warrior", "Survive for longer than 4 minutes on your first life", 50, DeathlessTime(TimeSpan(4, 0, 0), TimeSpan(3, 30, 0)))

achievement("Beat the Clock", "Reach Wave 4 within 2 minutes and 15 seconds", 10, ProgressTime(4, TimeSpan(2, 15, 0)))

achievement("Free Space Explorer", "Begin Wave 2 with no humanoids remaining, and reach Wave 5", 25, FreeSpaceSurveyor())
achievement("Unstoppable Force", "Score 200,000 points", 50, EarnedScore(200000))
achievement("Hell in Space", "Begin Wave 2 with no humanoids remaining, and reach Wave 5 without ever using a smart bomb", 100, HellInSpace())

// --------------------------------------------------------
// Rich Presence
// --------------------------------------------------------

livesLabels = {
    0x01: "life"
}

humanoidsLabels = {
    0x01: "humanoid"
}

rich_presence_conditional_display(
    GameState() == BootChecksRunning,
    "Config Menu - RESTART THE GAME TO PLAY"
)

rich_presence_conditional_display(
    GameState() == Bootup,
    "Game Booting"
)

rich_presence_conditional_display(
    GameState() == AttractMode || GameState() == TitleScreen,
    "Attract Mode"
)

rich_presence_conditional_display(
    GameOver(),
    "Game Over"
)

rich_presence_conditional_display(
    GameState() == GameStartingOrPlayerExploding,
    "Wave {0} • {1} points • {2} {3} • {4} {5}",
    rich_presence_value("Current Wave", PlayerOneCurrentWave()),
    rich_presence_value("Score", Score()), // TODO: rollovers?
    rich_presence_value("Lives", PlayerOneLives()),
    rich_presence_lookup("Lives Label", PlayerOneLives(), livesLabels, "lives"),
    rich_presence_value("Humanoids", HumanoidsRemaining()),
    rich_presence_lookup("Humanoids Label", HumanoidsRemaining(), humanoidsLabels, "humanoids")
)

rich_presence_display(
    "Wave {0} • {1} points • {2} {3} • {4} {5}",
    rich_presence_value("Current Wave", PlayerOneCurrentWave()),
    rich_presence_value("Score", Score()), // TODO: rollovers?
    rich_presence_value("Lives", PlayerOneLives() + 1), // Count the life currently in use
    rich_presence_lookup("Lives Label", PlayerOneLives() + 1, livesLabels, "lives"),
    rich_presence_value("Humanoids", HumanoidsRemaining()),
    rich_presence_lookup("Humanoids Label", HumanoidsRemaining(), humanoidsLabels, "humanoids")
)

// --------------------------------------------------------
// Leaderboards
// --------------------------------------------------------

// High Score leaderboard is not supported by RAScript syntax
// This is due to the way rollovers are being counted

leaderboard(
    "First Life",
    "Highest score on your very first ship",
    PlayerOneActive() && DefaultSettings(),
    always_false(),
    Dead(),
    Score()
)

leaderboard(
    "No Dead Humanoids",
    "Highest score before any humanoid losses",
    PlayerOneActive() && DefaultSettings(),
    always_false(),
    (prev(HumanoidsRemaining()) == 10 && HumanoidsRemaining() < 10) || GameOver(),
    Score()
)

leaderboard(
    "No Smart Bombs",
    "Highest score before any smart bomb use",
    PlayerOneActive() && DefaultSettings(),
    always_false(),
    IsSmartBombButtonPressed() == 1 || GameOver(),
    Score()
)
