// Galaxian
// #ID = 12139

// Memory
function Credits() => byte(0x0002)

function GameState() => byte(0x0005)
AttractMode = 0x01
CreditInserted = 0x02
GamePlaying = 0x03

function IsGamePlaying() => byte(0x0006)

function CurrentPlayer() => byte(0x000D)
PlayerOne = 0x00
PlayerTwo = 0x01

function ShotYPosition() => byte(0x009F)
function IsLeftPressed() => bit2(0x0010)
function IsRightPressed() => bit3(0x0010)
function IsFirePressed() => bit4(0x0010)
function IsPlayerOneStartPressed() => bit0(0x0011)
function IsPlayerTwoStartPressed() => bit1(0x0011)

function PlayerCurrentXPosition() => byte(0x009D)

function PlayerOneCurrentScore() => bcd(tbyte(0x00A2))
function PlayerOneScoreRolloverDigits() => byte(0x00A4)
function ScoreX00000() => high4(0x00A4)
function Score0X0000() => low4(0x00A4)
function Score00X000() => high4(0x00A3)
function Score000X00() => low4(0x00A3)
function Score0000X0() => high4(0x00A2)
function Score00000X() => low4(0x00A2)
function ComputedScore() {
    return (
        ScoreX00000() * 100000
        + Score0X0000() * 10000
        + Score00X000() * 1000
        + Score000X00() * 100
        + Score0000X0() * 10
        + Score00000X()
    )
}

function IsPlayerPlayingGame() => byte(0x00AB)
function BonusLifeAwardedAt() => byte(0x00AC)
function IsTwoPlayerGame() => byte(0x000E)
function CurrentLevel() => byte(0x021C)
function TotalLivesRemaining() => byte(0x021D)

// Helper functions
function CurrentWave() => CurrentLevel() + 1 // CurrentLevel is 0-indexed
function GameStarted() => repeated(5, BonusLifeAwardedAt() == 7 && IsTwoPlayerGame() == 0 && GameState() == GamePlaying && PlayerOneCurrentScore() == 0 && CurrentWave() == 1 && TotalLivesRemaining() == 3)
function GameOver() => prev(IsGamePlaying()) == 1 && IsGamePlaying() == 0
function Dead() => GameState() == GamePlaying && TotalLivesRemaining() == prev(TotalLivesRemaining()) - 1
function HasAnyDeaths() => (PlayerOneCurrentScore() < 7000 && TotalLivesRemaining() < 3) || (PlayerOneCurrentScore() >= 7000 && TotalLivesRemaining() < 4)
function ZeroLives() => TotalLivesRemaining() == 0
function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames

// Achievement Functions
function DefaultSettingsCheck() {
    start = once(GameState() == AttractMode)
    
    return start && trigger_when(GameStarted())
}

function EarnedScore(score) {
    start = once(GameStarted())
    cancel = never(GameOver())
    
    return start && cancel && PlayerOneCurrentScore() >= score
}

function EarnedScoreWithTrigger(score, triggerScore) {
    start = once(GameStarted())
    cancel = never(TotalLivesRemaining() == 0)
    
    return (
        start
        && cancel
        && PlayerOneCurrentScore() >= triggerScore
        && trigger_when(PlayerOneCurrentScore() >= score)   
    )
}

function ReachedWave(wave) {
    start = once(GameStarted())
    cancel = never(GameOver())
    
    return start && cancel && CurrentWave() == wave
}

function ReachedWaveWithTrigger(unlockWave, showIconWave) {
    start = once(GameStarted())
    cancel = never(TotalLivesRemaining() == 0)
    
    return (
        start
        && cancel
        && once(CurrentWave() == showIconWave)
        && trigger_when(CurrentWave() == unlockWave)
    )
}

function DeathlessReachedWave(wave) {
    start = once(GameStarted())
    cancel = never(HasAnyDeaths()) && never(TotalLivesRemaining() == 0)
   
    return (
        start
        && cancel
        && once(CurrentWave() == wave - 1)
        && trigger_when(CurrentWave() == wave)
    )
}

function ReachedWaveWithNoMiss(wave) {
    start = once(GameStarted()) && once(PlayerOneCurrentScore() > 0)
    cancel = never(ShotYPosition() == 0xEB) && never(TotalLivesRemaining() == 0)
    
    return (
        start
        && cancel
        && once(CurrentWave() == wave - 1)
        && trigger_when(CurrentWave() == wave)
    )
}

function DeathlessTime(time, showAlertTime) {
    start = once(GameStarted())
    cancel = never(HasAnyDeaths())
    
    return (
        start
        && cancel
        && repeated(showAlertTime, GameState() == GamePlaying)
        && trigger_when(repeated(time, GameState() == GamePlaying))
    )
}

function PerfectWaveOne() {
    start = once(GameStarted())
    cancel = never(TotalLivesRemaining() == 0) && never(CurrentWave() != 1)
    
    return (
        start
        && cancel
        && trigger_when(PlayerOneCurrentScore() == 4640)
    )
}

function FormationKill() {
    return ComputedScore() == prev(ComputedScore()) + 800
}

// Achievements
achievement("SETTINGS CHECK", "Lives = 3. Single player.", 0, DefaultSettingsCheck())

achievement("First Flight", "Score 1,000 points", 5, EarnedScore(1000))
achievement("Bonus Life", "Score 7,000 points and earn an extra life", 5, EarnedScore(7000))
achievement("Formation Kill", "Get an 800 point bonus by eliminating a diving flagship last in its formation", 5, FormationKill())

achievement("Pathfinder I", "Clear Wave 1", 5, ReachedWave(2))
achievement("Pathfinder II", "Clear Wave 2", 5, ReachedWaveWithTrigger(3, 2))
achievement("Pathfinder III", "Clear Wave 3", 10, ReachedWaveWithTrigger(4, 3))
achievement("Pathfinder IV", "Clear Wave 4", 10, ReachedWaveWithTrigger(5, 4))
achievement("Pathfinder V", "Clear Wave 5", 10, ReachedWaveWithTrigger(6, 5))

achievement("Pristine Victory", "Finish Wave One with a perfect score of 4,640 points", 25, PerfectWaveOne())

achievement("Minute Survivor I", "Survive for one minute on your first life", 5, DeathlessTime(TimeSpan(1, 0, 0), TimeSpan(0, 45, 0)))
achievement("Minute Survivor II", "Survive for two minutes on your first life", 10, DeathlessTime(TimeSpan(2, 0, 0), TimeSpan(1, 30, 0)))
achievement("Minute Survivor III", "Survive for three minutes on your first life", 10, DeathlessTime(TimeSpan(3, 0, 0), TimeSpan(2, 30, 0)))

achievement("Sharpshooter I", "Clear Wave 1 without missing a shot", 10, ReachedWaveWithNoMiss(2))
achievement("Sharpshooter II", "Clear Wave 1 and Wave 2 without missing a shot", 25, ReachedWaveWithNoMiss(3))

achievement("High Scorer I", "Score 20,000 points", 10, EarnedScoreWithTrigger(20000, 15000))
achievement("High Scorer II", "Score 40,000 points", 25, EarnedScoreWithTrigger(40000, 32000))
achievement("High Scorer III", "Score 80,000 points", 50, EarnedScoreWithTrigger(80000, 72000))

achievement("Perfect Pathfinder I", "Clear Wave 1 on your first life", 10, DeathlessReachedWave(2))
achievement("Perfect Pathfinder II", "Clear Wave 2 on your first life", 10, DeathlessReachedWave(3))
achievement("Perfect Pathfinder III", "Clear Wave 3 on your first life", 10, DeathlessReachedWave(4))
achievement("Perfect Pathfinder IV", "Clear Wave 4 on your first life", 25, DeathlessReachedWave(5))
achievement("Perfect Pathfinder V", "Clear Wave 5 on your first life", 50, DeathlessReachedWave(6))

achievement("Big Flag I", "Reach Wave 10", 25, ReachedWaveWithTrigger(10, 8))
achievement("Big Flag II", "Reach Wave 20", 50, ReachedWaveWithTrigger(20, 17))

// Rich Presence
livesLabels = {
    0x01: "life"
}

rich_presence_conditional_display(
    GameState() != AttractMode && GameState() != CreditInserted && GameState() != GamePlaying,
    "Booting up"
)

rich_presence_conditional_display(
    GameState() == AttractMode,
    "Viewing the title screen"
)

rich_presence_conditional_display(
    GameState() == CreditInserted,
    "Coined up"
)

rich_presence_display(
    "Wave {0} • {1} points • {2} {3}",
    rich_presence_value("Current Wave", CurrentWave()),
    rich_presence_value("Score", PlayerOneCurrentScore()),
    rich_presence_value("Lives", TotalLivesRemaining()),
    rich_presence_lookup("Lives Label", TotalLivesRemaining(), livesLabels, "lives")
)

// Leaderboards
leaderboard(
    "High Score",
    "Single player, any settings",
    GameState() == GamePlaying && prev(GameState()) != GamePlaying && IsTwoPlayerGame() == 0 && PlayerOneCurrentScore() == 0 && CurrentWave() == 1,
    always_false(),
    prev(GameState()) == 3 && GameState() != 3,
    PlayerOneCurrentScore()
)

leaderboard(
    "First Life",
    "Highest score on your very first life",
    GameState() == GamePlaying && prev(GameState()) != GamePlaying && IsTwoPlayerGame() == 0 && PlayerOneCurrentScore() == 0 && CurrentWave() == 1,
    always_false(),
    TotalLivesRemaining() == prev(TotalLivesRemaining()) - 1,
    PlayerOneCurrentScore()
)
