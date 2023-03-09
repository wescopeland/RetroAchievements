// Crazy Kong
// #ID = 15758
// https://retroachievements.org/game/15758

// CHANGELOG
// MARCH 9 2023 - Fix bugs with Heat Seeker I and Barrel Bounce accidental unlock,
//                add pluralization to life count rich presence indicator,
//                update no hammer leaderboard to submit when a hammer is grabbed

// $0005: [8-bit] Game State
//        0x01 = Attract Mode
//        0x02 = Credits Added
//        0x03 = Playing
function GameState() => byte(0x0005)
AttractMode = 0x01
CreditsAdded = 0x02
GamePlaying = 0x03

// $0010: [8-bit] Current Joystick Input
//        0x01 = Right
//        0x02 = Left
//        0x04 = Up
//        0x08 = Down
function CurrentJoystickInput() => byte(0x0010)
JoystickRight = 0x01
JoystickLeft  = 0x02
JoystickUp    = 0x04
JoystickDown  = 0x08 

// $000A: [8-bit] Playing State
//        0x07 = Game start cutscene
//        0x0A = Showing "How High Can You Try" screen
//        0x0B = Stage is drawn, but player isn't shown yet
//        0x0C = Playing
//        0x0D = Death animation is running
//        0x10 = Game over is shown
//        0x16 = Stage Victory animation is running
function PlayingState() => byte(0x000A)
GameStartCutscene = 0x07
GameOver          = 0x10
HowHighScreen     = 0x0A
PlayerPlaying     = 0x0C
Dying             = 0x0D
Victory           = 0x16

// $000F: [8-bit] Player Count
//        0x00 = One player mode
//        0x01 = Two player mode
function PlayerCount() => byte(0x000F)
OnePlayer = 0x00
TwoPlayer = 0x01

function StartingLives()     => byte(0x0020)                    // $0020: [8-bit] Starting Lives (DIP)
function BonusLifeAt()       => byte(0x0021)                    // $0021: [8-bit] Bonus Life At (DIP)
function ObjectsJumpedOver() => byte(0x0060)                    // $0060: [8-bit] Number of Objects Jumped Over

// $00B2: [8-bit] Score (BCD)
function ScoreX00000() => high4(0x00B4)
function Score0X0000() => low4(0x00B4)
function Score00X000() => high4(0x00B3)
function Score000X00() => low4(0x00B3)
function Score0000X0() => high4(0x00B2)
function Score00000X() => low4(0x00B2)
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

function MarioX()                          => byte(0x0203)      // $0203: [8-bit] Mario X (left 0x15 to right 0xEA)
function MarioY()                          => byte(0x0205)      // $0205: [8-bit] Mario Y (top 0x30 to bottom 0xF0)
function MarioIsClimbingLadder()           => byte(0x0215)      // $0215: [8-bit] Mario is currently climbing a ladder
function MarioIsJumpingOrFalling()         => byte(0x0216)      // $0216: [8-bit] Mario is jumping or falling
function MarioIsUsingHammer()              => byte(0x0217)      // $0217: [8-bit] Mario is currently using hammer
function TotalLivesLeft()                  => byte(0x0228)      // $0228: [8-bit] Total Lives Left
function CurrentLevel()                    => byte(0x0229)      // $0229: [8-bit] Current Level; 0x01 = L=01, 0x16 = L=22
function CurrentExactStage()               => byte(0x022F)      // $022F: [8-bit] Current Exact Stage
function RivetsRemaining()                 => byte(0x0290)      // $0290: [8-bit] Total Rivets Remaining on Screen
function LeftTopRivetIsAvailable()         => byte(0x0292)      // $0292: [8-bit] Left Top Rivet Available; 01 = Available
function RightTopRivetIsAvailable()        => byte(0x0293)      // $0293: [8-bit] Right Top Rivet Available; 01 = Available
function LeftSecondRivetIsAvailable()      => byte(0x0294)      // $0294: [8-bit] Left 2nd Top Rivet Available; 01 = Available
function RightSecondRivetIsAvailable()     => byte(0x0295)      // $0295: [8-bit] Right 2nd Top Rivet Available; 01 = Available
function LeftMiddleRivetIsAvailable()      => byte(0x0296)      // $0296: [8-bit] Left Middle Rivet Available; 01 = Available
function RightMiddleRivetIsAvailable()     => byte(0x0297)      // $0297: [8-bit] Right Middle Rivet Available; 01 = Available
function LeftBottomRivetIsAvailable()      => byte(0x0298)      // $0298: [8-bit] Left Bottom Rivet Available; 01 = Available
function RightBottomRivetIsAvailable()     => byte(0x0299)      // $0299: [8-bit] Right Bottom Rivet Available; 01 = Available

// $022E: [8-bit] Current Stage Kind
//        0x01 = Barrel
//        0x02 = Conveyor
//        0x03 = Spring
//        0x04 = Rivet
function CurrentStageKind() => byte(0x022E)
Barrel   = 0x01
Conveyor = 0x02
Spring   = 0x03
Rivet    = 0x04

function CurrentJumpPointsAward()  => byte(0x0342)              // $0342: [8-bit] Current Jump Points Award
function HammerIsHittingObject()   => byte(0x0350)              // $0350: [8-bit] Hammer Hit an Object
function CurrentInternalTimeLeft() => byte(0x0387)              // $0387: [8-bit] Current Internal Time Left
function CurrentBonusTimer()       => byte(0x038C)              // $038C: [8-bit] Current Bonus Timer (Decimal); 0x68 = 6800, 0x70 = 7000

// $040D: [8-bit] Springboard Fireball Current Action
function SpringboardFireballCurrentAction() => byte(0x040D)
FireballClimbingDown = 0x04
FireballClimbingUp   = 0x08

function SpringboardFireballXPosition() => byte(0x040E)         // $040E: [8-bit] Springboard Fireball X Position
function SpringboardFireballYPosition() => byte(0x040F)         // $040F: [8-bit] Springboard Fireball Y Position
function HammerOneIsAvailable()         => byte(0x0680)         // $0680: [8-bit] Hammer One is Available; 01 = Available
function HammerOneIsActive()            => byte(0x0681)         // $0681: [8-bit] Hammer One is Active; 01 = Active
function HammerTwoIsAvailable()         => byte(0x0690)         // $0690: [8-bit] Hammer Two is Available
function HammerTwoIsActive()            => byte(0x0691)         // $0691: [8-bit] Hammer Two is Active
function BarrelOneCurrentAction()       => byte(0x0702)         // $0702: [8-bit] Barrel One Current Action; 03, 05 = Rolling Down Ladder
function BarrelOneXPosition()           => byte(0x0703)         // $0703: [8-bit] Barrel One X Position
function BarrelOneYPosition()           => byte(0x0705)         // $0705: [8-bit] Barrel One Y Position
function BarrelTwoCurrentAction()       => byte(0x0722)         // $0722: [8-bit] Barrel Two Current Action; 03, 05 = Rolling Down Ladder
function BarrelTwoXPosition()           => byte(0x0723)         // $0723: [8-bit] Barrel Two X Position
function BarrelTwoYPosition()           => byte(0x0725)         // $0725: [8-bit] Barrel Two Y Position
function BarrelThreeCurrentAction()     => byte(0x0742)         // $0742: [8-bit] Barrel Three Current Action: 03, 05 = Rolling Down Ladder
function BarrelThreeXPosition()         => byte(0x0743)         // $0743: [8-bit] Barrel Three X Position
function BarrelThreeYPosition()         => byte(0x0745)         // $0745: [8-bit] Barrel Three Y Position
function BarrelFourCurrentAction()      => byte(0x0762)         // $0762: [8-bit] Barrel Four Current Action: 03, 05 = Rolling Down Ladder
function BarrelFourXPosition()          => byte(0x0763)         // $0763: [8-bit] Barrel Four X Position
function BarrelFourYPosition()          => byte(0x0765)         // $0765: [8-bit] Barrel Four Y Position
function HatIsVisible()                 => byte(0x0A0C)         // $0A0C: [8-bit] Hat is Visible on Screen; 01 = Visible
function PurseIsVisible()               => byte(0x0A10)         // $0A10: [8-bit] Purse is Visible on Screen; 01 = Visible
function ParasolIsVisible()             => byte(0x0A14)         // $0A14: [8-bit] Parasol is Visible on Screen; 01 = Visible
function LevelCounter0X()               => byte(0x35A3)         // $35A3: [8-bit] Level Counter 0X
function LevelCounterX0()               => byte(0x35C3)         // $35C3: [8-bit] Level Counter X0
function LevelCounter() {
    return (
        LevelCounterX0() * 10
        + LevelCounter0X()
    )
}

BarrelRollingDownA = 0x03
BarrelRollingDownB = 0x05

// --------------------------------------------------------
// Helper Functions
// --------------------------------------------------------

// Game state functions
function GameStart() => prev(GameState()) == CreditsAdded && GameState() == GamePlaying
function InGame() => GameState() == GamePlaying && PlayingState() == PlayerPlaying
function OnePlayerMode() => PlayerCount() == OnePlayer
function TwoPlayerMode() => PlayerCount() == TwoPlayer
function GameOver() => PlayingState() == GameOver
function ScreenCleared() => PlayingState() == Victory
function Dead() => PlayingState() == Dying

// Prize functions
function HasCollectedOneItem() => HatIsVisible() == 0 || PurseIsVisible() == 0 || ParasolIsVisible() == 0
function HasCollectedAllItems() => HatIsVisible() == 0 && PurseIsVisible() == 0 && ParasolIsVisible() == 0

// Dip settings functions
function DefaultSettings() => StartingLives() <= 0x03 && BonusLifeAt() <= 0x07 && OnePlayerMode()

// --------------------------------------------------------
// Achievements Functions
// --------------------------------------------------------

function IsUsingDefaultSettings() {
    start = once(GameState() == AttractMode)

    cancel = 
        never(InGame() && TwoPlayerMode()) 
        && never(InGame() && StartingLives() > 0x03)
        && never(InGame() && BonusLifeAt() > 0x07)

    return start && cancel && trigger_when(DefaultSettings() && GameState() == GamePlaying)
}

function StageKindCleared(stageKind) {
    start = once(InGame())

    cancel = never(GameOver())

    return (
        start
        && cancel
        && CurrentStageKind() == stageKind
        && ScreenCleared()
    )
}

function Progress(level, stageKind) {
    start = once(InGame() && DefaultSettings())
    
    cancel = never(GameOver())
    
    return (
        start 
        && cancel 
        && CurrentLevel() == level 
        && CurrentStageKind() == stageKind 
        && ScreenCleared()
    )
}

function KillScreenProgress() {
    start = once(InGame() && DefaultSettings() && CurrentLevel() >= 18)
    
    cancel = never(GameOver())
    
    return (
        start
        && cancel
        && trigger_when(
            CurrentLevel() == 22
            && CurrentStageKind() == Barrel
            && CurrentBonusTimer() == 0x37
            && CurrentInternalTimeLeft() == 0x00
            && PlayingState() == Dying
        )
    )
}

function ExtraLifeEarned() {
    start = once(InGame() && DefaultSettings())

    cancel = never(GameOver())

    return start && cancel && Score() >= 7000
}

function HammerlessProgress(level, stageKind) {
    start = once(InGame() && DefaultSettings())
    
    cancel = never(GameOver()) && disable_when(MarioIsUsingHammer() == 1, GameStart())
    
    return (
        start
        && cancel
        && trigger_when(CurrentLevel() == level && CurrentStageKind() == stageKind && ScreenCleared())
    )
}

function DeathlessProgress(level, stageKind) {
    start = once(InGame() && DefaultSettings() && CurrentLevel() >= level - 2)
    
    cancel = never(Dead()) && disable_when(Dead(), GameStart())
    
    return (
        start 
        && cancel
        && trigger_when(CurrentLevel() == level && CurrentStageKind() == stageKind && ScreenCleared())
    )
}

function EarnedScore(score) {
    start = once(InGame() && DefaultSettings())
    
    cancel = never(GameOver())
    
    return start && cancel && Score() >= score
}

function DeathlessEarnedScore(score) {
    start = once(InGame() && DefaultSettings())
    
    cancel = never(Dead()) && disable_when(Dead(), GameStart())
    
    return (
        start
        && cancel
        && InGame()
        && trigger_when(Score() >= score)
    )
}

function LeechFirstFireball() {
    start = once(InGame() && CurrentLevel() == 1 && CurrentStageKind() == Barrel && DefaultSettings())

    cancel = never(PlayingState() != PlayerPlaying) && never(Dead()) && never(CurrentLevel() != 1)

    return (
        start
        && cancel
        && disable_when(PlayingState() == PlayerPlaying && MarioY() <= 0xD3) // Climbed the first ladder
        && CurrentBonusTimer() == 0x45
        && MarioIsJumpingOrFalling() == 0x01
        && Score() > prev(Score())
    )
}

function BarrelBounce() {
    return (
        disable_when(PlayingState() == PlayerPlaying && MarioY() <= 0xD3) // Climbed the first ladder
        && DefaultSettings() 
        && InGame() 
        && CurrentLevel() == 1
        && CurrentStageKind() == Barrel
        && Score() == 100 
        && CurrentBonusTimer() == 0x47
    ) 
}

function PointsBeforeFirstLadder() {
    start = once(InGame() && DefaultSettings() && CurrentLevel() == 1 && CurrentStageKind() == Barrel)
    
    cancel = never(GameState() != GamePlaying) || never(Dead()) || never(PlayingState() == HowHighScreen)
    
    return (
        start
        && cancel
        && disable_when(MarioIsClimbingLadder() == 1, PlayingState() == HowHighScreen)
        && trigger_when(
            tally(10,
                prev(Score()) < Score(),
                
                // For every 300 point jump, add 2 more to hit counter.
                prev(Score()) == Score() - 300,
                prev(Score()) == Score() - 300,
                
                // For every 500 point jump, add 4 more to hit counter.
                prev(Score()) == Score() - 500,
                prev(Score()) == Score() - 500,
                prev(Score()) == Score() - 500,
                prev(Score()) == Score() - 500
            )
        )
    )
}

function SmashesWithHammer(smashes, stageKind, isHammerActive) {
    start = once(InGame() && DefaultSettings() && CurrentStageKind() == stageKind && isHammerActive == 1)
    
    cancel = never(isHammerActive == 0) && never(CurrentStageKind() != stageKind) && never(Dead())
    
    return (
        start
        && cancel
        && trigger_when(
            tally(smashes,
                prev(HammerIsHittingObject()) < HammerIsHittingObject()
            )
        )
    )
}

function SmashesWithAnyHammer(smashes, stageKind) {
    start = once(InGame() && DefaultSettings() && (HammerOneIsActive() == 1) || (HammerTwoIsActive() == 1))
    
    cancel = never(HammerOneIsActive() == 0 && HammerTwoIsActive() == 0) && never(CurrentStageKind() != stageKind) && never(Dead())
    
    return (
        start
        && cancel
        && trigger_when(
            tally(smashes,
                prev(HammerIsHittingObject()) < HammerIsHittingObject()
            )
        )
    )
}

function TimerFinish(stageKind, neededTime) {
    start = once(InGame() && CurrentStageKind() == stageKind && DefaultSettings())

    cancel = never(GameOver()) && never(CurrentStageKind() != stageKind)

    return (
        start
        && cancel
        && CurrentLevel() >= 0x04
        && CurrentBonusTimer() >= neededTime
        && trigger_when(ScreenCleared())
    )
}

function ClimbOilCan() {
    start = once(InGame() && CurrentStageKind() == Barrel && DefaultSettings())

    cancel = never(GameOver())

    return (
        start
        && cancel
        && MarioIsJumpingOrFalling() != 0x01
        && MarioX() >= 0x1D
        && MarioX() <= 0x31
        && MarioY() >= 0xE7
        && MarioY() <= 0xE9
    )
}

function GhostHammerGrab(stageKind) {
    start = once(
        InGame() 
        && DefaultSettings()
        && CurrentStageKind() == stageKind 
        && (HammerOneIsActive() == 0x01 || HammerOneIsAvailable() == 0x00)
    )

    cancel = (
        never(Dead()) 
        && never(GameOver()) 
        && never(PlayingState() != PlayerPlaying)
        && never(CurrentStageKind() != stageKind)
        && never(HammerOneIsActive() == 0x01 && HammerTwoIsAvailable() == 0x00)
        && never(HammerTwoIsActive() == 0x01 && HammerOneIsAvailable() == 0x01)
        && never(HammerTwoIsAvailable() == 0x00 && HammerOneIsAvailable() == 0x00)
    )

    return (
        start
        && cancel
        && trigger_when(HammerTwoIsActive() == 0x01)
    )
}

function ClearedWithAllPrizes(stageKind) {
    start = once(InGame() && CurrentStageKind() == stageKind && DefaultSettings())

    cancel = never(GameOver()) && never(CurrentStageKind() != stageKind)

    return (
        start
        && cancel
        && HasCollectedOneItem()
        && trigger_when(
            HasCollectedAllItems()
            && ScreenCleared()
        )
    )
}

function LeechElevatorFireball() {
    start = once(InGame() && CurrentStageKind() == Spring && DefaultSettings())

    cancel = never(Dead()) && never(GameOver()) && never(CurrentStageKind() != Spring)

    return (
        start
        && cancel
        && MarioX() <= 0x45
        && MarioIsJumpingOrFalling() == 0x01
        && CurrentJumpPointsAward() == 0x01
        && (
            SpringboardFireballCurrentAction() == FireballClimbingUp
            || SpringboardFireballCurrentAction() == FireballClimbingDown
        )
    )
}

function BarrelIsRollingOverhead(marioX, marioY, barrelX, barrelY) {
    return (barrelX == marioX) && (barrelY < marioY) && (marioY - barrelY <= 19)
}

function LadderTrick(times) {
    start = once(InGame() && CurrentStageKind() == Barrel && MarioIsClimbingLadder() == 1 && DefaultSettings())
    
    cancel = 
        never(Dead()) 
        && never(GameOver()) 
        && never(MarioIsClimbingLadder() == 0)
        && never(HammerOneIsActive() == 0x01)
        && never(HammerTwoIsActive() == 0x01)
    
    return (
        start
        && cancel
        && tally(
            times,
            BarrelIsRollingOverhead(MarioX(), MarioY(), BarrelOneXPosition(), BarrelOneYPosition()),
            BarrelIsRollingOverhead(MarioX(), MarioY(), BarrelTwoXPosition(), BarrelTwoYPosition()),
            BarrelIsRollingOverhead(MarioX(), MarioY(), BarrelThreeXPosition(), BarrelThreeYPosition()),
            BarrelIsRollingOverhead(MarioX(), MarioY(), BarrelFourXPosition(), BarrelFourYPosition())
        )
    )
}

function SpringLeech() {
    start = once(
        InGame() 
        && CurrentStageKind() == Spring 
        && DefaultSettings()
        && MarioX() > 0xA8
    )
    
    cancel = 
        never(Dead()) 
        && never(GameOver()) 
        && never(MarioX() <= 0xA8)
    
    return (
        start
        && cancel
        && trigger_when(MarioIsJumpingOrFalling() == 0x01 && Score() > prev(Score()))
    )
}

function StarPattern() {
    start = once(InGame() && CurrentStageKind() == Rivet && DefaultSettings())
    
    cancel = 
        never(Dead() 
        && never(GameOver()))
        && never(RightTopRivetIsAvailable() == 0)
        && never(RightSecondRivetIsAvailable() == 0)
        && never(RightMiddleRivetIsAvailable() == 0)
        && never(RightBottomRivetIsAvailable() == 0)
    
    return (
        start
        && cancel
        && once(
            LeftBottomRivetIsAvailable() == 0 
            && LeftTopRivetIsAvailable() == 0
            && LeftSecondRivetIsAvailable() == 0
            && LeftMiddleRivetIsAvailable() == 1
            && RivetsRemaining() == 0x05
        )
        && RivetsRemaining() == 0x04
        && MarioIsUsingHammer() == 1
        && LeftMiddleRivetIsAvailable() == 0
    )
}

function BarrelSteers(steerCount) {
    start = once(InGame() && CurrentStageKind() == Barrel && DefaultSettings())
    
    cancel = never(Dead()) && never(GameOver()) && never(CurrentStageKind() != Barrel)
    
    return (
        start
        && cancel
        && tally(
            steerCount,
            (
                CurrentJoystickInput() == JoystickLeft
                && BarrelOneXPosition() < MarioX()
                && (BarrelOneCurrentAction() == BarrelRollingDownA && prev(BarrelOneCurrentAction()) != BarrelRollingDownA)
            ),
            (
                CurrentJoystickInput() == JoystickLeft
                && BarrelOneXPosition() < MarioX()
                && (BarrelOneCurrentAction() == BarrelRollingDownB && prev(BarrelOneCurrentAction()) != BarrelRollingDownB)
            ),
            (
                CurrentJoystickInput() == JoystickLeft
                && BarrelTwoXPosition() < MarioX()
                && (BarrelTwoCurrentAction() == BarrelRollingDownA && prev(BarrelTwoCurrentAction()) != BarrelRollingDownA)
            ),
            (
                CurrentJoystickInput() == JoystickLeft
                && BarrelTwoXPosition() < MarioX()
                && (BarrelTwoCurrentAction() == BarrelRollingDownB && prev(BarrelTwoCurrentAction()) != BarrelRollingDownB)
            ),
            (
                CurrentJoystickInput() == JoystickLeft
                && BarrelThreeXPosition() < MarioX()
                && (BarrelThreeCurrentAction() == BarrelRollingDownA && prev(BarrelThreeCurrentAction()) != BarrelRollingDownA)
            ),
            (
                CurrentJoystickInput() == JoystickLeft
                && BarrelThreeXPosition() < MarioX()
                && (BarrelThreeCurrentAction() == BarrelRollingDownB && prev(BarrelThreeCurrentAction()) != BarrelRollingDownB)
            ),
            (
                CurrentJoystickInput() == JoystickLeft
                && BarrelFourXPosition() < MarioX()
                && (BarrelFourCurrentAction() == BarrelRollingDownA && prev(BarrelFourCurrentAction()) != BarrelRollingDownA)
            ),
            (
                CurrentJoystickInput() == JoystickLeft
                && BarrelFourXPosition() < MarioX()
                && (BarrelFourCurrentAction() == BarrelRollingDownB && prev(BarrelFourCurrentAction()) != BarrelRollingDownB)
            ),
            (
                CurrentJoystickInput() == JoystickRight
                && BarrelOneXPosition() > MarioX()
                && (BarrelOneCurrentAction() == BarrelRollingDownA && prev(BarrelOneCurrentAction()) != BarrelRollingDownA)
            ),
            (
                CurrentJoystickInput() == JoystickRight
                && BarrelOneXPosition() > MarioX()
                && (BarrelOneCurrentAction() == BarrelRollingDownB && prev(BarrelOneCurrentAction()) != BarrelRollingDownB)
            ),
            (
                CurrentJoystickInput() == JoystickRight
                && BarrelTwoXPosition() > MarioX()
                && (BarrelTwoCurrentAction() == BarrelRollingDownA && prev(BarrelTwoCurrentAction()) != BarrelRollingDownA)
            ),
            (
                CurrentJoystickInput() == JoystickRight
                && BarrelTwoXPosition() > MarioX()
                && (BarrelTwoCurrentAction() == BarrelRollingDownB && prev(BarrelTwoCurrentAction()) != BarrelRollingDownB)
            ),
            (
                CurrentJoystickInput() == JoystickRight
                && BarrelThreeXPosition() > MarioX()
                && (BarrelThreeCurrentAction() == BarrelRollingDownA && prev(BarrelThreeCurrentAction()) != BarrelRollingDownA)
            ),
            (
                CurrentJoystickInput() == JoystickRight
                && BarrelThreeXPosition() > MarioX()
                && (BarrelThreeCurrentAction() == BarrelRollingDownB && prev(BarrelThreeCurrentAction()) != BarrelRollingDownB)
            ),
            (
                CurrentJoystickInput() == JoystickRight
                && BarrelFourXPosition() > MarioX()
                && (BarrelFourCurrentAction() == BarrelRollingDownA && prev(BarrelFourCurrentAction()) != BarrelRollingDownA)
            ),
            (
                CurrentJoystickInput() == JoystickRight
                && BarrelFourXPosition() > MarioX()
                && (BarrelFourCurrentAction() == BarrelRollingDownB && prev(BarrelFourCurrentAction()) != BarrelRollingDownB)
            )
        )
    )
}

achievement("DEFAULT SETTINGS CHECK", "Lives = 3, Bonus Life = 7000, One Player Mode", 0, IsUsingDefaultSettings(), 293496, "", "", "325542")

achievement("How High Can You Try", "Clear 1-1", 5, Progress(1, Barrel), 293497, "", "", "325543")
achievement("Only 20 More Loops Left", "Clear 1-4", 5, Progress(1, Rivet), 293499, "", "", "325545")
achievement("Novice of the Arcade", "Clear 2-4", 5, Progress(2, Rivet), 293500, "", "", "325546")
achievement("Student of the Arcade", "Clear 3-4", 10, Progress(3, Rivet), 293501, "", "", "325547")
achievement("Enthusiast of the Arcade", "Clear 4-4", 10, Progress(4, Rivet), 293502, "", "", "325548")
achievement("Adept of the Arcade", "Clear 5-4", 10, Progress(5, Rivet), 293503, "", "", "325549")

achievement("Veteran of the Arcade", "Clear 4-4 on your very first life", 25, DeathlessProgress(4, Rivet), 293504, "", "", "325550")

achievement("Prodigy of the Arcade", "Score 200,000 points", 25, EarnedScore(200000), 293505, "", "", "325551")
achievement("Master of the Arcade", "Score 400,000 points", 25, EarnedScore(400000), 293506, "", "", "325552")

achievement("Oil Can Antics", "Jump to the top of the oil can on any barrel board", 5, ClimbOilCan(), 293507, "", "", "325553")

achievement("Barrel Bounce", "Leech the first falling barrel on 1-1", 5, BarrelBounce(), 293508, "", "", "325554")

achievement("Hammered Out I", "Successfully finish a barrel board after using both hammers", 5, StageKindCleared(Barrel) && HammerOneIsAvailable() == 0x00 && HammerTwoIsAvailable() == 0x00, 293509, "", "", "325555")
achievement("Hammered Out II", "Successfully finish a conveyor board after using both hammers", 5, StageKindCleared(Conveyor) && HammerOneIsAvailable() == 0x00 && HammerTwoIsAvailable() == 0x00, 293510, "", "", "325556")

achievement("Barrel Manipulator I", "By pointing the joystick towards barrels as they rolled over ladder tops, you forced (\"steered\") 10 of them down the ladders.", 2, BarrelSteers(10), 293511, "", "", "325557")
achievement("Barrel Manipulator II", "Use the ladder trick to dodge 2 barrels in a row (Note: the ladder trick is when you climb a ladder and wait at the top, which forces barrels to roll by)", 3, LadderTrick(2), 293512, "", "", "325558")
achievement("Barrel Manipulator III", "Use the ladder trick to dodge 8 barrels in a row", 5, LadderTrick(8), 293513, "", "", "325559")
achievement("Barrel Manipulator IV", "Steer barrels down ladders 45 times on any barrel screen", 10, BarrelSteers(45), 293515, "", "", "325561")

achievement("Conveyor Collector", "Collect all three of Pauline's items on any conveyor board and finish the stage", 5, ClearedWithAllPrizes(Conveyor), 293516, "", "", "325562")
achievement("Spring Scavenger", "Collect all three of Pauline's items on any spring board and finish the stage", 5, ClearedWithAllPrizes(Spring), 293517, "", "", "325563")
achievement("Rivet Retriever", "Collect all three of Pauline's items on any rivet board and finish the stage", 5, ClearedWithAllPrizes(Rivet), 293518, "", "", "325564")

achievement("Barrel Vaulting Pro", "Make corrupted graphics appear by leaping over three obstacles in a single jump", 10, InGame() && ObjectsJumpedOver() >= 3 && DefaultSettings(), 293519, "", "", "325565")

achievement("Proper Rivet Form", "Execute the Star Pattern on any rivet board (Bottom left -> Top 2 left -> Take left hammer -> Run across) [Watch: https://youtu.be/85flrK1vivI?t=7620]", 10, StarPattern(), 293520, "", "", "325587")

achievement("Heat Seeker I", "Leech the fireball on 1-1 for 100 points as it jumps out of the oil can", 5, LeechFirstFireball(), 293521, "", "", "325567")
achievement("Heat Seeker II", "Score 1,000 points before climbing a single ladder", 10, PointsBeforeFirstLadder(), 293522, "", "", "325568")
achievement("Heat Seeker III", "Score 1,000 points before climbing a single ladder and before the bonus timer hits 4300", 25, PointsBeforeFirstLadder() && CurrentBonusTimer() > 0x43, 293523, "", "", "325569")

achievement("Super Smasher I", "Get 3 smashes with a single bottom hammer on any barrel board", 5, SmashesWithHammer(3, Barrel, HammerTwoIsActive()), 293524, "", "", "325570")
achievement("Super Smasher II", "Get 4 smashes with a single top hammer on any barrel board", 5, SmashesWithHammer(4, Barrel, HammerOneIsActive()), 293525, "", "", "325571")
achievement("Super Smasher III", "Get 6 smashes with a single bottom hammer on any barrel board", 10, SmashesWithHammer(6, Barrel, HammerTwoIsActive()), 293526, "", "", "325572")
achievement("Super Smasher IV", "Get 7 smashes with a single top hammer on any barrel board", 10, SmashesWithHammer(7, Barrel, HammerOneIsActive()), 293527, "", "", "325573")
achievement("Super Smasher V", "Get 5 smashes with a single middle hammer on any conveyor board", 10, SmashesWithHammer(5, Conveyor, HammerTwoIsActive()), 293528, "", "", "325574")
achievement("Super Smasher VI", "Get 5 smashes with a single hammer on any rivet board", 25, SmashesWithAnyHammer(5, Rivet), 293529, "", "", "325575")

achievement("Turbo Barrel", "Finish a barrel board with at least 6800 left on the timer", 10, TimerFinish(Barrel, 0x68), 293530, "", "", "325576")
achievement("Turbo Conveyor", "Finish a conveyor board with at least 6800 left on the timer", 25, TimerFinish(Conveyor, 0x68), 293531, "", "", "325577")
achievement("Turbo Spring", "Finish a spring board with at least 6700 left on the timer", 50, TimerFinish(Spring, 0x67), 293532, "", "", "325578")
achievement("Turbo Rivet", "Finish a rivet board with at least 5000 left on the timer", 50, TimerFinish(Rivet, 0x50), 293533, "", "", "325579")

achievement("Barrel Phantom Hammer", "On any barrel board, grab the top hammer first and the bottom hammer second", 10, GhostHammerGrab(Barrel), 293534, "", "", "325580")
achievement("Rivet Phantom Hammer", "On any rivet board, grab the left hammer first and the middle hammer second", 5, GhostHammerGrab(Rivet), 293535, "", "", "325581")
achievement("Conveyor Phantom Hammer", "On any conveyor board, grab the left hammer first and the middle hammer second", 5, GhostHammerGrab(Conveyor), 293536, "", "", "325582")

achievement("Elevator Elite", "On any spring board, leech the fireball for 100 points while riding the elevator (Note: Points are more likely to be awarded if left or right are held near the top of your jump)", 5, LeechElevatorFireball(), 293537, "", "", "325583")
achievement("Spring Board Elite", "Leech a spring for 100 points on the right-hand side of any spring board", 5, SpringLeech(), 293538, "", "", "325584")

achievement("The Hammerless Hero", "Reach L=05 without using a single hammer", 50, HammerlessProgress(4, Rivet), 293539, "", "", "325585")
achievement("Legend of the Arcade", "Put all the skills you've learned to use: reach 22-1 and survive until the game gives up", 100, KillScreenProgress(), 293540, "", "", "325586")

// --------------------------------------------------------
// Rich Presence
// --------------------------------------------------------

exactStages = {
    0x65: "1",
    0x66: "2",
    0x67: "3",
    0x68: "4",
    0x69: "1",
    0x6A: "2",
    0x6B: "3",
    0x6C: "4",
    0x6D: "1",
    0x6E: "2",
    0x6F: "3",
    0x70: "4",
    0x71: "1",
    0x72: "2",
    0x73: "3",
    0x74: "4",
    0x75: "1",
    0x76: "2",
    0x77: "3",
    0x78: "4"
}

levelTens = {
    0x00: "0",
    0x01: "1"
}

levelOnes = {
    0x00: "0",
    0x01: "1",
    0x02: "2",
    0x03: "3",
    0x04: "4",
    0x05: "5",
    0x06: "6",
    0x07: "7",
    0x08: "8",
    0x09: "9"
}

livesLabels = {
    0x01: "life"
}

rich_presence_conditional_display(GameState() == AttractMode, "Attract Mode")
rich_presence_conditional_display(GameState() == CreditsAdded, "Coined Up")
rich_presence_conditional_display(!DefaultSettings(), "Playing casually with non-default settings")
rich_presence_display(
    "L={0}{1}-{2} | {3} {4} | {5} points",
    rich_presence_lookup("Level Tens", LevelCounterX0(), levelTens),
    rich_presence_lookup("Level Ones", LevelCounter0X(), levelOnes),
    rich_presence_lookup("Stage", CurrentExactStage(), exactStages, "1"),
    rich_presence_value("Lives", TotalLivesLeft()),
    rich_presence_lookup("Lives Label", TotalLivesLeft(), livesLabels, "lives"),
    rich_presence_value("Score", Score())
)

// --------------------------------------------------------
// Leaderboards
// --------------------------------------------------------

leaderboard(
    "High Score",
    "High score on default settings (3 lives, 7k bonus)",
    DefaultSettings() && GameState() == GamePlaying && OnePlayerMode(),
    always_false(),
    GameOver(),
    Score()
)

leaderboard(
    "High Score (no hammer)",
    "High score on default settings, no hammers allowed",
    DefaultSettings() && GameState() == GamePlaying && OnePlayerMode(),
    always_false(),
    MarioIsUsingHammer() == 1 || GameOver(),
    Score()
)
