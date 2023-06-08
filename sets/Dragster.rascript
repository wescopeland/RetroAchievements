// Dragster
// #ID = 14402

// $0000: game 1= 0 game 2=1
function Game1() => byte(0x000000)

// $0033: timer player 1
function TimerPlayer1() => byte(0x000033)

// $0034: timer player 2
function TimerPlayer2() => byte(0x000034)

// $0035: player 1 milliseconds counter
function Player1MillisecondsCounter() => byte(0x000035)

// $0036: player 2 milliseconds counter
function Player2MillisecondsCounter() => high4(0x000036)
function Player2MillisecondsCounter() => byte(0x000036)

// $003A: player 1 distance tracker 61=end
function Player1DistanceTracker61End() => byte(0x00003A)

// $003B: player 2 distance tracker 61=end
function Player2DistanceTracker61End() => byte(0x00003B)

// $003E: another game distance tracker? when race ends its always at 02.
function AnotherGameDistanceTrackerWhenRaceEndsItsAlwaysAt02() => byte(0x00003E)

// $003F: player 2 another game distance tracker? when race ends its always at 02.
function Player2AnotherGameDistanceTrackerWhenRaceEndsItsAlwaysAt02() => byte(0x00003F)

// $0048: wheelie player 1
function WheeliePlayer1() => byte(0x000048)

// $0049: wheelie player 2
function WheeliePlayer2() => byte(0x000049)

// $004C: clutch as well player 1 second number is gear also acts as a check between game 1 and 2
function ClutchAsWellPlayer1SecondNumberIsGearAlsoActsAsACheckBetweenGame1And2() => byte(0x00004C)

// $004D: clutch player 2 second number gear
function ClutchPlayer2SecondNumberGear() => byte(0x00004D)

// $004E: blown engine player 1
function BlownEnginePlayer1() => byte(0x00004E)

// $004F: blown engine player 2
function BlownEnginePlayer2() => byte(0x00004F)

// $0052: player 1 disable controls
function Player1DisableControls() => byte(0x000052)

// $0053: player 2 disable car
function Player2DisableCar() => byte(0x000053)

// $0054: player 1 early 1d engine blown 01
function Player1Early1dEngineBlown01() => byte(0x000054)

// $0055: player 2 early 1d engine blown 01
function Player2Early1dEngineBlown01() => byte(0x000055)

function AchievedTime(seconds = 5, millisecondsAsHex = 0x57) {
    return
        (
            Player1DistanceTracker61End() == 97
            && Player1DisableControls() == 1
            && Player1Early1dEngineBlown01() == 0
            && AnotherGameDistanceTrackerWhenRaceEndsItsAlwaysAt02() == 2
            && TimerPlayer1() == 5
            && Player1MillisecondsCounter() <= 0x71
        )
        || (
            Player2DistanceTracker61End() == 97
            && Player2DisableCar() == 1
            && Player2Early1dEngineBlown01() == 0
            && Player2AnotherGameDistanceTrackerWhenRaceEndsItsAlwaysAt02() == 2
            && TimerPlayer2() == 5
            && Player2MillisecondsCounter() <= 0x71
        )
}

achievement(
    title = "Expert Dragster Driver",
    description = "Achieve a time of 5.71 seconds or less in either game 1 or 2.",
    points = 10,
    trigger = AchievedTime(5, 0x71)
)

achievement(
    title = "Elite Dragster Driver",
    description = "Achieve a time of 5.67 seconds or less in either game 1 or 2.",
    points = 25,
    trigger = AchievedTime(5, 0x67)
)

achievement(
    title = "World Class Dragster Driver",
    description = "Achieve a time of 5.61 seconds or less in either game 1 or 2.",
    points = 25,
    trigger = AchievedTime(5, 0x61)
)
