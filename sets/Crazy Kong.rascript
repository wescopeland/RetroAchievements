// Crazy Kong
// #ID = 15758
// https://retroachievements.org/game/15758

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

function CurrentJumpPointsAward() => byte(0x0342)               // $0342: [8-bit] Current Jump Points Award
function HammerIsHittingObject()  => byte(0x0350)               // $0350: [8-bit] Hammer Hit an Object
function CurrentBonusTimer()      => byte(0x038C)               // $038C: [8-bit] Current Bonus Timer (Decimal); 0x68 = 6800, 0x70 = 7000

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
function InGame() => GameState() == GamePlaying
function OnePlayerMode() => PlayerCount() == OnePlayer
function GameOver() => PlayingState() == GameOver
function ScreenCleared() => PlayingState() == Victory
function Dead() => PlayingState() == Dying

// Prize functions
function HasCollectedOneItem() => HatIsVisible() == 0 || PurseIsVisible() == 0 || ParasolIsVisible() == 0
function HasCollectedAllItems() => HatIsVisible() == 0 && PurseIsVisible() == 0 && ParasolIsVisible() == 0

// Dip settings functions
function DefaultSettings() => StartingLives() <= 0x03 && BonusLifeAt() <= 0x07

// --------------------------------------------------------
// Achievements Functions
// --------------------------------------------------------

function IsUsingDefaultSettings() {
    start = once(GameState() == AttractMode)

    cancel = never(InGame()) && never(GameState() == GamePlaying)

    return start && cancel && trigger_when(DefaultSettings() && GameState() == CreditsAdded)
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
    start = once(InGame() && OnePlayerMode() && DefaultSettings())
    
    cancel = never(GameOver())
    
    return (
        start 
        && cancel 
        && CurrentLevel() == level 
        && CurrentStageKind() == stageKind 
        && ScreenCleared()
    )
}

function ExtraLifeEarned() {
    start = once(InGame() && PlayingState() == PlayerPlaying && DefaultSettings())

    cancel = never(GameOver())

    return start && cancel && Score() >= 7000
}

function HammerlessProgress(level, stageKind) {
    start = once(InGame() && OnePlayerMode() && DefaultSettings())
    
    cancel = never(GameOver()) && disable_when(MarioIsUsingHammer() == 1, GameStart())
    
    return (
        start
        && cancel
        && InGame()
        && trigger_when(CurrentLevel() == level && CurrentStageKind() == stageKind && ScreenCleared())
    )
}

function DeathlessProgress(level, stageKind) {
    start = once(InGame() && OnePlayerMode() && DefaultSettings() && CurrentLevel() >= level - 2)
    
    cancel = never(Dead()) && disable_when(Dead(), GameStart())
    
    return (
        start 
        && cancel
        && trigger_when(CurrentLevel() == level && CurrentStageKind() == stageKind && ScreenCleared())
    )
}

function EarnedScore(score) {
    start = once(InGame() && OnePlayerMode() && DefaultSettings())
    
    cancel = never(GameOver())
    
    return start && cancel && Score() >= score
}

function DeathlessEarnedScore(score) {
    start = once(InGame() && OnePlayerMode() && DefaultSettings())
    
    cancel = never(Dead()) && disable_when(Dead(), GameStart())
    
    return (
        start
        && cancel
        && InGame()
        && trigger_when(Score() >= score)
    )
}

function LeechFirstFireball() {
    start = once(InGame() && CurrentLevel() == 1 && CurrentStageKind() == Barrel)

    cancel = never(GameState() != GamePlaying) && never(Dead()) && never(CurrentLevel() != 1)

    return (
        start
        && cancel
        && CurrentBonusTimer() == 0x45
        && MarioIsJumpingOrFalling() == 0x01
        && Score() > prev(Score())
    )
}

function PointsBeforeFirstLadder() {
    start = once(InGame() && OnePlayerMode() && CurrentLevel() == 1 && CurrentStageKind() == Barrel)
    
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
    start = once(InGame() && OnePlayerMode() && CurrentStageKind() == stageKind && isHammerActive == 1)
    
    cancel = never(isHammerActive == 0)
    
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
    start = once(InGame() && OnePlayerMode() && CurrentStageKind() == stageKind && (HammerOneIsActive() == 1) || (HammerTwoIsActive() == 1))
    
    cancel = never(HammerOneIsActive() == 0 && HammerTwoIsActive() == 0)
    
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
    start = once(InGame() && CurrentStageKind() == stageKind)

    cancel = never(GameOver())

    return (
        start
        && cancel
        && CurrentLevel() >= 0x04
        && CurrentBonusTimer() >= neededTime
        && trigger_when(ScreenCleared())
    )
}

function ClimbOilCan() {
    start = once(InGame() && CurrentStageKind() == Barrel)

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
        && PlayingState() == PlayerPlaying
        && CurrentStageKind() == stageKind 
        && (HammerOneIsActive() == 0x01 || HammerOneIsAvailable() == 0x00)
    )

    cancel = (
        never(Dead()) 
        && never(GameOver()) 
        && never(GameState() != GamePlaying)
        && never(HammerTwoIsActive() == 0x01 && HammerOneIsAvailable() == 0x01)
        && never(HammerTwoIsAvailable() == 0x00 && HammerOneIsAvailable() == 0x01)
    )

    return (
        start
        && cancel
        && trigger_when(HammerTwoIsActive() == 0x01)
    )
}

function ClearedWithAllPrizes(stageKind) {
    start = once(InGame() && CurrentStageKind() == stageKind && PlayingState() == PlayerPlaying && DefaultSettings())

    cancel = never(GameOver())

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
    start = once(InGame() && CurrentStageKind() == Spring)

    cancel = never(Dead()) && never(GameOver())

    return (
        start
        && cancel
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
    start = once(InGame() && CurrentStageKind() == Barrel && MarioIsClimbingLadder() == 1)
    
    cancel = never(Dead()) && never(GameOver()) && never(MarioIsClimbingLadder() == 0)
    
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
    start = once(InGame() && CurrentStageKind() == Spring && MarioIsJumpingOrFalling() == 0x01)
    
    cancel = never(Dead()) && never(GameOver()) && never(MarioIsJumpingOrFalling() != 0x01)
    
    return (
        start
        && cancel
        && MarioX() > 0xA8
        && Score() > prev(Score())
    )
}

function StarPattern() {
    start = once(InGame() && CurrentStageKind() == Rivet)
    
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
    start = once(InGame() && CurrentStageKind() == Barrel && PlayingState() == PlayerPlaying && DefaultSettings())
    
    cancel = never(Dead()) && never(GameOver())
    
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

achievement("Default settings check", "Description", 1, IsUsingDefaultSettings())

achievement("Clear 1-1", "Description", 5, Progress(1, Barrel))
achievement("Clear 1-4", "Description", 5, Progress(1, Rivet))
achievement("Clear 2-4", "Description", 5, Progress(2, Rivet))
achievement("Clear 3-4", "Description", 10, Progress(3, Rivet))
achievement("Clear 4-4", "Description", 10, Progress(4, Rivet))
achievement("Clear 5-4", "Description", 10, Progress(5, Rivet))
achievement("Clear 21-4", "Description", 100, Progress(21, Rivet))

achievement("Earn your only extra life", "Description", 5, ExtraLifeEarned())

achievement("Clear 4-4 on your first life", "Description", 25, DeathlessProgress(4, Rivet))

achievement("Score 100,000 points", "Description", 25, EarnedScore(100000))
achievement("Score 350,000 points", "Description", 25, EarnedScore(350000))

achievement("Reach L=05 without using a hammer", "Description", 50, HammerlessProgress(4, Rivet))

achievement("Jump over three objects", "Description", 10, InGame() && ObjectsJumpedOver() >= 3)

achievement("Leech the falling barrel on 1-1", "Description", 5, InGame() && Score() == 100 && CurrentBonusTimer() == 0x47)
achievement("Leech the fireball on 1-1 as it jumps from the oil can", "Description", 5, LeechFirstFireball())
achievement("Score 1000 points before touching a ladder", "Description", 10, PointsBeforeFirstLadder())
achievement("Score 1000 points before touching a ladder by 4300", "Description", 25, PointsBeforeFirstLadder() && CurrentBonusTimer() > 0x43)

achievement("Get 6 smashes with a single bottom hammer on the barrel board", "Description", 10, SmashesWithHammer(6, Barrel, HammerTwoIsActive()))
achievement("Get 7 smashes with a single top hammer on the barrel board", "Description", 10, SmashesWithHammer(7, Barrel, HammerOneIsActive()))
achievement("Get 4 smashes with the middle hammer on the pie factory", "Description", 10, SmashesWithHammer(4, Conveyor, HammerTwoIsActive()))

achievement("Get 5 smashes with any hammer on the rivet board", "Description", 25, SmashesWithAnyHammer(5, Rivet))

achievement("Turbo Barrel Finish a barrel board with at least 6800 left on the timer", "Description", 10, TimerFinish(Barrel, 0x68))
achievement("Finish a conveyor board with at least 6800 left on the timer", "Description", 25, TimerFinish(Conveyor, 0x68))
achievement("Finish a spring board with at least 6800 left on the timer", "Description", 25, TimerFinish(Spring, 0x68))
achievement("Turbo Rivet Finish a rivet board with at least 5200 left on the timer", "Description", 50, TimerFinish(Rivet, 0x52))

achievement("Climb the oil can on a barrel board", "Description", 5, ClimbOilCan())

achievement("On the barrel board, grab the top hammer first and the bottom hammer second", "Description", 10, GhostHammerGrab(Barrel))
achievement("On the rivet board, grab the left hammer first and the middle hammer second", "Description", 5, GhostHammerGrab(Rivet))
achievement("On the conveyor board, grab the left hammer first and the middle hammer second", "Description", 10, GhostHammerGrab(Conveyor))

achievement("Grab both hammers on a barrel stage and finish the board", "Description", 5, StageKindCleared(Barrel) && HammerOneIsAvailable() == 0x00 && HammerTwoIsAvailable() == 0x00)
achievement("Grab both hammers on a conveyor stage and finish the board", "Description", 5, StageKindCleared(Conveyor) && HammerOneIsAvailable() == 0x00 && HammerTwoIsAvailable() == 0x00)

achievement("Collect all items on the pie factory and finish", "Description", 5, ClearedWithAllPrizes(Conveyor))
achievement("Collect all items on the spring board and finish", "Description", 5, ClearedWithAllPrizes(Spring))
achievement("Collect all items on the rivet board and finish", "Description", 5, ClearedWithAllPrizes(Rivet))

achievement("Fireball leech on the spring board while riding the elevator", "Description", 5, LeechElevatorFireball())

achievement("Do the ladder trick 6 times during a single ladder climb", "Description", 5, LadderTrick(6))

achievement("Leech a spring on the right-hand side of the spring board", "Description", 5, SpringLeech())

achievement("Steer barrels 8 times on any barrel screen", "Description", 5, BarrelSteers(8))
achievement("Steer barrels 40 times on any barrel screen", "Description", 10, BarrelSteers(40))

achievement("Execute the star pattern on the rivet board", "Description", 10, StarPattern())

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

rich_presence_conditional_display(GameState() == AttractMode, "Attract Mode")
rich_presence_conditional_display(GameState() == CreditsAdded, "Coined up")
rich_presence_display(
    "L={0}{1}-{2} | {3} lives | {4} points",
    rich_presence_lookup("Level Tens", LevelCounterX0(), levelTens),
    rich_presence_lookup("Level Ones", LevelCounter0X(), levelOnes),
    rich_presence_lookup("Stage", CurrentExactStage(), exactStages, "1"),
    rich_presence_value("Lives", TotalLivesLeft()),
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
    MarioIsUsingHammer() == 1,
    GameOver(),
    Score()
)