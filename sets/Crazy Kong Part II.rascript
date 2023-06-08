// Crazy Kong Part II
// #ID = 24388

// #region Memory -------------------------------------------------------------------------------------------------------------------------
function ThinGameState() => byte(0x0005)
AttractMode = 0x01
CreditsAdded = 0x02
GamePlaying = 0x03

function ExtendedGameState() => byte(0x000A)
GameStartCutscene = 0x07
GameOver = 0x10
HowHighScreen = 0x0A
PlayerPlaying = 0x0C
Dying = 0x0D
Victory = 0x16

function IsTwoPlayerMode() => byte(0x000F)

function IsJumpButtonPressed() => bit4(0x0011)

function StartingLives() => byte(0x0020)
function BonusLifeAt() => byte(0x0021)
function ObjectsJumpedOver() => byte(0x0060)

function PlayerOneScore() => bcd(tbyte(0x00B2))
function PlayerOneScoreX00000() => high4(0x00B4)
function PlayerOneScore0X0000() => low4(0x00B4)
function PlayerOneScore00X000() => high4(0x00B3)
function PlayerOneScore000X00() => low4(0x00B3)
function PlayerOneScore0000X0() => high4(0x00B2)
function PlayerOneScore00000X() => low4(0x00B2)
function PlayerOneScoreComputed() {
    return (
        PlayerOneScoreX00000() * 100000
        + PlayerOneScore0X0000() * 10000
        + PlayerOneScore00X000() * 1000
        + PlayerOneScore000X00() * 100
        + PlayerOneScore0000X0() * 10
        + PlayerOneScore00000X()
    )
}

function MarioX() => byte(0x0203)
function MarioY() => byte(0x0205)
function IsMarioClimbingLadder() => byte(0x0215)
function IsMarioJumpingOrFalling() => byte(0x0216)
function IsMarioActivelyUsingHammer() => byte(0x0217)
function IsMarioHoldingHammerWhileJumpingOrFalling() => byte(0x0218)
function IsMarioCurrentlyFalling() => byte(0x021F)
function TotalLivesLeft() => byte(0x0228)
function CurrentLevel() => byte(0x0229)

function CurrentStageKind() => byte(0x022E)
Barrel = 0x01
Conveyor = 0x02
Spring = 0x03
Rivet = 0x04

function CurrentJumpPointsAward() => byte(0x0342)
function IsHammerHittingObject() => byte(0x0350)
function CurrentInternalTimeLeft() => byte(0x0387)
function CurrentBonusTimerXX00() => byte(0x038C)

function SpringboardFireballCurrentAction() => byte(0x040D)
FireballClimbingDown = 0x04
FireballClimbingUp = 0x08

function BarrelOneXPosition() => byte(0x0703)
function BarrelOneYPosition() => byte(0x0705)
function BarrelTwoXPosition() => byte(0x0723)
function BarrelTwoYPosition() => byte(0x0725)
function BarrelThreeXPosition() => byte(0x0743)
function BarrelThreeYPosition() => byte(0x0745)
function BarrelFourXPosition() => byte(0x0763)
function BarrelFourYPosition() => byte(0x0765)
function IsHatVisible() => byte(0x0A0C) 
function IsPurseVisible() => byte(0x0A10)
function IsParasolVisible() => byte(0x0A14)
function LevelCounter0X() => byte(0x3583)
function LevelCounterX0() => byte(0x35A3)
function LevelCounter() => (LevelCounterX0() * 10) + LevelCounter0X()
// #endregion

// #region Utils --------------------------------------------------------------------------------------------------------------------------
function InGame() => ThinGameState() == GamePlaying
function IsUsingDefaultSettings() => (StartingLives() <= 3 && BonusLifeAt() <= 7 && IsTwoPlayerMode() == 0)
function GameStarted() => InGame() && IsUsingDefaultSettings()
function GameOver() => ExtendedGameState() == GameOver
function ScreenCleared() => ExtendedGameState() == Victory
function Dead() => ExtendedGameState() == Dying

function HasCollectedOneItem()  => IsHatVisible() == 0 || IsPurseVisible() == 0 || IsParasolVisible() == 0
function HasCollectedAllItems() => IsHatVisible() == 0 && IsPurseVisible() == 0 && IsParasolVisible() == 0 

function DefaultSettingsCheck() {
    start = once(ThinGameState() == AttractMode)
    return start && trigger_when(GameStarted())
}

function Progress(level, stageKind) {
    start = once(GameStarted())
    cancel = never(GameOver())
    
    return
        start
        && cancel
        && CurrentLevel() == level
        && CurrentStageKind() == stageKind
        && ScreenCleared()
} 

function DeathlessProgress(level, stageKind) {
    start = once(GameStarted() && CurrentLevel() >= level - 2)
    cancel = never(Dead()) && disable_when(Dead(), ThinGameState() == 3 && prev(ThinGameState()) != 3)
    
    return 
        start
        && cancel
        && trigger_when(CurrentLevel() == level && CurrentStageKind() == stageKind && ScreenCleared())
}

function NoJumpBarrelBoard() {
    start = once(GameStarted()) && once(CurrentStageKind() == Barrel)
    cancel = never(GameOver()) && never(CurrentStageKind() != Barrel) && never(IsMarioJumpingOrFalling() == 1)
    
    return
        start
        && cancel
        && ScreenCleared()
}

function EarnedScore(score) {
    start = once(GameStarted())
    cancel = never(GameOver())
    
    return start && cancel && PlayerOneScore() >= score
}

function BarrelBounce() {
    start = once(GameStarted())
    cancel = disable_when(ExtendedGameState() == PlayerPlaying && MarioY() <= 0xD3, ExtendedGameState() == HowHighScreen)

    return 
        start
        && cancel
        && CurrentLevel() == 1
        && CurrentStageKind() == Barrel
        && PlayerOneScore() == 100
        && CurrentBonusTimerXX00() == 0x47
}

function ClearedWithAllPrizes(stageKind) {
    start = once(GameStarted() && CurrentStageKind() == stageKind)
    cancel = 
        never(GameOver()) 
        && never(CurrentStageKind() != stageKind) 
        && never(ExtendedGameState() != Victory && ExtendedGameState() != PlayerPlaying)
    
    return
        start
        && cancel
        && once(ExtendedGameState() == PlayerPlaying)
        && HasCollectedOneItem()
        && trigger_when(HasCollectedAllItems() && ScreenCleared())
}

function ObjectsJumpedCount(count) {
    return once(GameStarted()) && ObjectsJumpedOver() >= count
}

function IsBarrelRollingOverhead(marioX, marioY, barrelX, barrelY) {
    return (barrelX == marioX) && (barrelY < marioY) && (marioY - barrelY <= 19)
}

function LadderTrick(times) {
    start = once(GameStarted() && CurrentStageKind() == Barrel)
    
    cancel =
        never(Dead())
        && never(IsMarioClimbingLadder() == 0)
        && never(IsMarioActivelyUsingHammer() == 1)
        
    return
        start
        && cancel
        && tally(
            times,
            IsBarrelRollingOverhead(MarioX(), MarioY(), BarrelOneXPosition(), BarrelOneYPosition()),
            IsBarrelRollingOverhead(MarioX(), MarioY(), BarrelTwoXPosition(), BarrelTwoYPosition()),
            IsBarrelRollingOverhead(MarioX(), MarioY(), BarrelThreeXPosition(), BarrelThreeYPosition()),
            IsBarrelRollingOverhead(MarioX(), MarioY(), BarrelFourXPosition(), BarrelFourYPosition())
        )
}

function KillScreenProgress() {
    start = once(GameStarted() && CurrentLevel() >= 18)
    cancel = never(GameOver())
    
    return
        start
        && cancel
        && trigger_when(
            CurrentLevel() == 2
            && CurrentStageKind() == Rivet
            && CurrentBonusTimerXX00() == 0x37
            && CurrentInternalTimeLeft() == 0
            && ExtendedGameState() == Dying
        )
}

function PointsBeforeFirstLadder(bonusTimerCutoff) {
    start = once(GameStarted() && CurrentLevel() == 1 && CurrentStageKind() == Barrel)
    cancel = never(ThinGameState() != GamePlaying) || never(Dead()) || never(ExtendedGameState() == HowHighScreen)
    
    return
        start
        && cancel
        && CurrentBonusTimerXX00() > bonusTimerCutoff
        && disable_when(IsMarioClimbingLadder() == 1, ExtendedGameState() == HowHighScreen)
        && trigger_when(
            tally(10,
                prev(PlayerOneScoreComputed()) < PlayerOneScoreComputed(),
                
                // For every 300 point jump, add 2 more to hit counter.
                prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 300,
                prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 300,
                
                // For every 500 point jump, add 4 more to hit counter.
                prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
                prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
                prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
                prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500
            )
        )
}

function PointsBeforeStageClear(pointsNeeded, stageKind) {
    start = once(GameStarted() && CurrentStageKind() == stageKind)
    cancel = never(ThinGameState() != GamePlaying) || never(Dead()) || never(ExtendedGameState() == HowHighScreen)
    
    return
        start
        && cancel
        && tally(((pointsNeeded - 3000) / 100),
            prev(PlayerOneScoreComputed()) < PlayerOneScoreComputed(),
            
            // Earned 300 points, add 2 more to hit counter.
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 300,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 300,
            
            // Earned 500 points, add 4 more to hit counter.
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
            
            // Earned 800 points, add 7 more to hit counter.
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
            prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800
        ) && trigger_when(
                tally(pointsNeeded / 100,
                    prev(PlayerOneScoreComputed()) < PlayerOneScore(),
            
                    // Earned 300 points, add 2 more to hit counter.
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 300,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 300,
            
                    // Earned 500 points, add 4 more to hit counter.
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 500,
            
                    // Earned 800 points, add 7 more to hit counter.
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800,
                    prev(PlayerOneScoreComputed()) == PlayerOneScoreComputed() - 800
            )
        )
}

function TimerFinish(stageKind, neededTime) {
    start = once(GameStarted() && CurrentStageKind() == stageKind)
    cancel = never(GameOver()) && never(CurrentStageKind() != stageKind)
    
    return
        start
        && cancel
        && CurrentLevel() >= 0x04
        && CurrentBonusTimerXX00() >= neededTime
        && trigger_when(ScreenCleared())
}

function FloorSkipper(count) {
    start = once(GameStarted())
    cancel = never(GameOver())
    
    return
        start
        && cancel
        && repeated(count,
            IsMarioJumpingOrFalling() == 1
            && prev(ExtendedGameState()) == PlayerPlaying
            && ExtendedGameState() == Victory
        )
}
// #endregion


// #region Achievements -------------------------------------------------------------------------------------------------------------------
achievement("DEFAULT SETTINGS CHECK", "Lives = 3, Bonus Life = 7000, One Player Mode", 0, DefaultSettingsCheck())

achievement("How High Can You Try", "Clear 1-1", 5, Progress(1, Barrel))
achievement("Only 20 More Loops Left", "Clear 1-4", 5, Progress(1, Rivet))
achievement("Novice of the Arcade", "Clear 2-4", 5, Progress(2, Rivet))
achievement("Student of the Arcade", "Clear 3-4", 10, Progress(3, Rivet))
achievement("Enthusiast of the Arcade", "Clear 4-4", 10, Progress(4, Rivet))
achievement("Adept of the Arcade", "Clear 5-4", 10, Progress(5, Rivet))

achievement("Veteran of the Arcade", "Clear 4-4 on your very first life", 25, DeathlessProgress(4, Rivet))

achievement("Prodigy of the Arcade", "Score 200,000 points", 25, EarnedScore(200000))
achievement("Connoisseur of the Arcade", "Score 400,000 points", 25, EarnedScore(400000))
achievement("Master of the Arcade", "Score 600,000 points", 50, EarnedScore(600000))

achievement("Barrel Bounce II", "Leech the first falling barrel on 1-1", 5, BarrelBounce())

achievement("Floor Skipper I", "Perform the floor skip on any barrel stage", 5, FloorSkipper(1))
achievement("Floor Skipper II", "Perform the floor skip four times in a single game", 10, FloorSkipper(4))
achievement("Floor Skipper III", "Perform the floor skip twelve times in a single game", 25, FloorSkipper(12))

achievement("Conveyor Collector II", "Collect all three of Pauline's items on any conveyor board and finish the stage", 5, ClearedWithAllPrizes(Conveyor))
achievement("Spring Scavenger II", "Collect all three of Pauline's items on any spring board and finish the stage", 5, ClearedWithAllPrizes(Spring))
achievement("Rivet Retriever II", "Collect all three of Pauline's items on any rivet board and finish the stage", 5, ClearedWithAllPrizes(Rivet))

achievement("Barrel Board Elite", "Clear a barrel board without ever pressing jump", 5, NoJumpBarrelBoard())

achievement("Barrel Vaulting Pro II", "Make corrupted graphics appear by leaping over three obstacles in a single jump", 10, ObjectsJumpedCount(3))
achievement("Barrel Vaulting Pro III", "Take advantage of barrel grouping mechanics and leap over four obstacles in a single jump", 10, ObjectsJumpedCount(4))

achievement("Barrel Manipulator V", "Use the ladder trick to dodge 2 barrels in a row (Note: the ladder trick is when you climb a ladder and wait at the top, which forces a barrel to roll by)", 2, LadderTrick(2))
achievement("Barrel Manipulator VI", "Use the ladder trick to dodge 8 barrels in a row", 3, LadderTrick(8))

achievement("Heat Seeker IV", "Score 1,000 points before climbing a single ladder", 10, PointsBeforeFirstLadder(0))
achievement("Heat Seeker V", "Score 1,000 points before climbing a single ladder and before the bonus timer hits 4300", 25, PointsBeforeFirstLadder(0x43))

achievement("Barrel Buster I", "Score at least 10,000 points on any barrel board before clearing it", 25, PointsBeforeStageClear(10000, Barrel))
achievement("Barrel Buster II", "Score at least 15,000 points on any barrel board before clearing it", 50, PointsBeforeStageClear(15000, Barrel))
achievement("Conveyor Buster", "Score at least 5,500 points on any conveyor board before clearing it", 25, PointsBeforeStageClear(5500, Conveyor))

achievement("Turbo Barrel II", "Finish a barrel board with at least 7600 left on the timer", 10, TimerFinish(Barrel, 0x76))
achievement("Turbo Conveyor II", "Finish a conveyor board with at least 6800 left on the timer", 25, TimerFinish(Conveyor, 0x68))
achievement("Turbo Spring II", "Finish a spring board with at least 6800 left on the timer", 50, TimerFinish(Spring, 0x68))
achievement("Turbo Rivet II", "Finish a rivet board with at least 5100 left on the timer", 50, TimerFinish(Rivet, 0x51))

achievement("Kill Screen I", "Reach 22-1", 25, Progress(21, Rivet))
achievement("Kill Screen II", "Reach 22-2", 25, Progress(22, Barrel))
achievement("Kill Screen III", "Reach 22-3", 25, Progress(22, Conveyor))
achievement("Legend of the Arcade II", "Reach 22-4 and survive until the game gives up", 100, KillScreenProgress())
// #endregion

// #region Rich Presence ------------------------------------------------------------------------------------------------------------------
livesLabels = {
    0x01: "life"
}

rich_presence_conditional_display(ThinGameState() == AttractMode, "Attract Mode")
rich_presence_conditional_display(ThinGameState() == CreditsAdded, "Coined Up")
rich_presence_conditional_display(ExtendedGameState() == GameStartCutscene, "Watching the intro cutscene")
rich_presence_conditional_display(!IsUsingDefaultSettings(), "Playing casually with modified settings")
rich_presence_display(
    "L={0}{1}-{2} • {3} {4} • {5} points",
    rich_presence_value("Level Counter X0", LevelCounterX0()),
    rich_presence_value("Level Counter 0X", LevelCounter0X()),
    rich_presence_value("Stage Indicator", CurrentStageKind()),
    rich_presence_value("Lives Count", TotalLivesLeft()),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_value("Score", PlayerOneScore())
)
// #endregion


// #region Leaderboards -------------------------------------------------------------------------------------------------------------------
leaderboard(
    "High Score",
    "Default settings (3 lives, 7k bonus)",
    IsUsingDefaultSettings() && InGame(),
    always_false(),
    GameOver(),
    PlayerOneScore()
)

leaderboard(
    "First Life",
    "Highest score on your very first Jumpman",
    IsUsingDefaultSettings() && InGame(),
    always_false(),
    Dead(),
    PlayerOneScore()
)

leaderboard(
    "1-1",
    "Points clearing 1-1 on your first life",
    IsUsingDefaultSettings() && InGame() && CurrentLevel() == 1 && CurrentStageKind() == Barrel,
    Dead(),
    ScreenCleared(),
    PlayerOneScore()
)

leaderboard(
    "Heat Seeker",
    "Points before touching a ladder on your first life",
    IsUsingDefaultSettings() && InGame() && CurrentLevel() == 1 && CurrentStageKind() == Barrel,
    always_false(),
    Dead() || IsMarioClimbingLadder() == 1,
    PlayerOneScore()
)
// #endregion