// Defender
// #ID = 15020
// https://retroachievements.org/game/15020

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
GameStartingOrPlayerExploding = 0x7F
TitleScreen = 0xFB
AttractMode = 0xD9
MaybeGameOver = 0xFF

function CurrentShipDirection() => byte(0xE2BB)
ShipRight = 0x03
ShipLeft = 0xFD

function HumanoidsRemaining() => byte(0xE2FA)                   // $E2FA: [8-bit] Humanoids Remaining
AllHumanoidsRemaining = 0x0A

function LandersRemaining() => byte(0xE312)
function BaitersRemaining() => byte(0xE319)

// $E3C3: Player 1 Score (BCD)
function ScoreX00000() => high4(0xE3C3)
function Score0X0000() => low4(0xE3C3)
function Score00X000() => high4(0xE3C4)
function Score000X00() => low4(0xE3C4)
function Score0000X0() => high4(0xE3C5)
function Score00000X() => low4(0xE3C5)
function Score() {
    return (
        ScoreX00000() * 100000
        + Score0X0000() * 10000
        + Score00X000() * 1000
        + Score000X00() * 100
        + Score0000X0() * 10
        + Score00000X()
    )
}

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
function ShowingWaveCompletedScreen() => GameState() == WaveCompletedScreenOrHyperspace && LandersRemaining() == 0

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

// Anti-cheat:
// When # of credits decreases, Game State should be 7F and smart bombs should be 03

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
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(GameOver())
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == waveNumber
        && trigger_when(ShowingWaveCompletedScreen())
    )
}

function DeathlessProgress(waveNumber) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(Dead(), PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0)
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == waveNumber
        && trigger_when(ShowingWaveCompletedScreen())
    )
}

function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames
function DeathlessTime(time, showAlertTime) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = (
        never(Dead())
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
    )
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == waveNumber
        && trigger_when(ShowingWaveCompletedScreen())
    )
}

function HumanoidsRemainingProgress(waveNumber, neededHumanoids) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(
        HumanoidsRemaining() < neededHumanoids,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    )
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == waveNumber
        && trigger_when(ShowingWaveCompletedScreen() && HumanoidsRemaining() >= neededHumanoids)
    )
}

function WithoutButtonProgress(waveNumber, buttonPressCondition) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(
        buttonPressCondition == 0x01,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    )
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == waveNumber
        && trigger_when(ShowingWaveCompletedScreen())
    )
}

function LimitedFireProgress(waveNumber, maxPressCount) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = disable_when(
        repeated(
            maxPressCount,
            IsFireButtonPressed() == 1 && prev(IsFireButtonPressed()) != 1
        ),
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    )
    
    return (
        start
        && cancel
        && PlayerOneCurrentWave() == waveNumber
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
    
    return start && cancel && Score() >= score
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

function HoldingHumanoids(count) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(GameOver()) && never(CurrentSoundInstruction() == HumanoidReturnedToGround)
    
    return (
        start
        && cancel
        && repeated(
            count, 
            prev(CurrentSoundInstruction()) != PlayerCaughtHumanoid && CurrentSoundInstruction() == PlayerCaughtHumanoid
        )
    )
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

function BaiterKill() {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(GameOver()) && never(Dead()) && never(ShowingWaveCompletedScreen())
    
    return (
        start
        && cancel
        && once(BaitersRemaining() >= 1)
        && trigger_when(
            BaitersRemaining() < prev(BaitersRemaining())
        )
    )
}

function WaveBaiterKills(killCount, showTriggerCount) {
    start = once(PlayerOneActive() && DefaultSettings())
    
    cancel = never(GameOver()) && never(Dead()) && never(ShowingWaveCompletedScreen())
    
    return (
        start
        && cancel
        && repeated(showTriggerCount, BaitersRemaining() < prev(BaitersRemaining()))
        && trigger_when(repeated(killCount, BaitersRemaining() < prev(BaitersRemaining())))
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
        HumanoidsRemaining() == 0,
        PlayerOneLives() == 3 && prev(PlayerOneLives()) == 0
    )
    
    return (
        start
        && cancel
        && trigger_when(
            ShowingWaveCompletedScreen() 
            && prev(PlayerOneCurrentWave()) == targetWaveNumber && PlayerOneCurrentWave() == (targetWaveNumber + 1)
        )
    )
}

achievement("DEFAULT SETTINGS CHECK", "Lives = 3, Bonus Life = 10000, One Player Mode", 1, IsUsingDefaultSettings())

achievement("Clear Wave One", "", 5, Progress(1))
achievement("Clear Wave Two", "", 5, Progress(2))
achievement("Clear Wave Three", "", 5, Progress(3))
achievement("Clear Wave Four", "", 5, Progress(4))
achievement("Clear Wave Five", "", 5, Progress(5))
achievement("Clear Wave Six", "", 5, Progress(6))
achievement("Clear Wave Seven", "", 5, Progress(7))
achievement("Clear Wave Eight", "", 5, Progress(8))

achievement("Clear Wave One on your first life", "", 5, DeathlessProgress(1))
achievement("Clear Wave Two on your first life", "", 5, DeathlessProgress(2))
achievement("Clear Wave Three on your first life", "", 5, DeathlessProgress(3))

achievement("Clear Wave 1 with 10 humanoids remaining", "", 5, HumanoidsRemainingProgress(1, 10))
achievement("Clear Wave 2 with 10 humanoids remaining", "", 5, HumanoidsRemainingProgress(2, 10))
achievement("Clear Wave 3 with 10 humanoids remaining", "", 5, HumanoidsRemainingProgress(3, 10))
achievement("Clear Wave 4 with 9 humanoids remaining", "", 5, HumanoidsRemainingProgress(4, 9))
achievement("Clear Wave 5 with 8 humanoids remaining", "", 5, HumanoidsRemainingProgress(5, 8))

achievement("Score 10,000 points", "", 5, EarnedScore(10000))
achievement("Score 200,000 points", "", 5, EarnedScore(200000))

achievement("Hold more than 5 lives in reserve", "", 5, ReserveLives())
achievement("Catch a humanoid", "", 5, CatchHumanoid())
achievement("Return a humanoid to the ground", "", 5, ReturnHumanoidToGround())

achievement("Score 5000 points without dying", "", 5, DeathlessEarnedScore(5000, 0))
achievement("Score 10,000 points without dying", "", 5, DeathlessEarnedScore(10000, 5000))
achievement("Score 20,000 points without dying", "", 5, DeathlessEarnedScore(20000, 10000))
achievement("Score 30,000 points without dying", "", 5, DeathlessEarnedScore(30000, 20000))

achievement("Kill a Baiter", "", 5, BaiterKill())
achievement("Kill three baiters in one wave", "", 5, WaveBaiterKills(3, 1))
achievement("Kill ten baiters in one wave", "", 5, WaveBaiterKills(10, 5))

achievement("Space Invaders Tribute", "Clear a wave without pressing Up or Down", 5, NoVerticalMovementProgress(1))

achievement("Hold 4 humanoids at once", "", 5, HoldingHumanoids(4))
achievement("Hold 10 humanoids at once", "", 5, HoldingHumanoids(10))

achievement("Clear Wave 2 and have never used a smart bomb", "", 5, WithoutButtonProgress(2, IsSmartBombButtonPressed()))
achievement("Clear Wave 4 and have never used a smart bomb", "", 5, WithoutButtonProgress(4, IsSmartBombButtonPressed()))

achievement("Clear Wave 1 and have never used reverse", "", 5, WithoutButtonProgress(1, IsReverseButtonPressed()))
achievement("Clear Wave 2 and have never used reverse", "", 5, WithoutButtonProgress(2, IsReverseButtonPressed()))
achievement("Clear Wave 3 and have never used reverse", "", 5, WithoutButtonProgress(3, IsReverseButtonPressed()))

achievement("Clear Wave 1 after pressing Fire 5 times or less", "", 5, LimitedFireProgress(1, 5))

achievement("Clear Wave 2 with no baiters ever spawning", "", 5, NoBaiterProgress(2))

achievement("Begin Wave 2 with one humanoid remaining, and ensure it survives until clearing Wave 2", "", 5, HumanoidSurvival(2))
achievement("Begin Wave 3 with one humanoid remaining, and ensure it survives until clearing Wave 3", "", 5, HumanoidSurvival(3))
achievement("Begin Wave 2 with one humanoid remaining, and ensure it survives until clearing Wave 4", "", 5, HumanoidSurvival(4))

achievement("Survive for longer than 1 minute on a life", "", 5, DeathlessTime(TimeSpan(1, 0, 0), TimeSpan(0, 30, 0)))
achievement("Survive for longer than 2 minutes on a life", "", 5, DeathlessTime(TimeSpan(2, 0, 0), TimeSpan(1, 30, 0)))
achievement("Survive for longer than 3 minutes on a life", "", 5, DeathlessTime(TimeSpan(3, 0, 0), TimeSpan(2, 30, 0)))

achievement("Reach Wave 4 within 2 minutes and 15 seconds", "", 5, ProgressTime(4, TimeSpan(2, 15, 0)))

// --------------------------------------------------------
// Rich Presence
// --------------------------------------------------------

// TODO: initial bootup config

livesLabels = {
    0x01: "life"
}

rich_presence_conditional_display(Credits() >= 1, "Coined Up")

rich_presence_conditional_display(
    GameState() == AttractMode || GameState() == TitleScreen,
    "Attract Mode"
)

rich_presence_display(
    "Wave {0} | {1} {2} | {3} points",
    rich_presence_value("Current Wave", PlayerOneCurrentWave()),
    rich_presence_value("Lives", PlayerOneLives()),
    rich_presence_lookup("Lives Label", PlayerOneLives(), livesLabels, "lives"),
    rich_presence_value("Score", Score()) // TODO: rollovers?
)
