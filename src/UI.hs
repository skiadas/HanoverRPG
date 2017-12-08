{-|
Module      : UI
Description : The UI module
Copyright   : (c) Alexander Martens, 2017
                  Patrick Conboy, 2017
License     : MIT
Maintainer  : conboyp19@hanover.edu

The UI module communicates with the user by writing fancy ANSI graphics to 
the terminal and accepting user input in the form of text. The Game Module will
call functions with the required parameters to display information to the user.
Game runs the game loop and requests user input at times.

To Install Deps:
cabal update
cabal install ansi-terminal

-}
module UI
(
    drawFirstScreen,
    displayEvent,
    promptUserName,
    promptUserExit,
    promptUserMovement,
    promptUserAction,
    drawEnemyStat,
    drawHeroStat

) where

-- Module starts here.
import Prelude hiding (Either(..))
import System.Console.ANSI
import System.IO
import Data.Char
import Control.Monad
import Combat.ActionOptions

-- Coordinates for a string on the terminal. 
type Coords = (String, Int, Int)
inventory :: Coords 
inventory = ("Inventory: ", 8,0)

-- IMPORT FROM GAME
data Event = Win | Lose | WinGame | LoseGame
data Movement = Forwards | Backwards | Left | Right

-- Display Event
displayEvent :: Event -> IO()
displayEvent Win = drawEvent "You Win"
displayEvent Lose = drawEvent "You Lose"
displayEvent WinGame = drawEvent "You Have Defeated The Biggest Game On Hanove. Yippee ki-yay"
displayEvent LoseGame = drawEvent "You Have Lost The Game"

-- Draw The Starting Data. Sets Custom Color
drawFirstScreen :: IO()
drawFirstScreen = do 
    setTitle "Battle! For The Point"
    setSGR [ SetConsoleIntensity BoldIntensity
            , SetColor Foreground Dull Red
            , SetColor Background Dull Black ]
    drawScreen

-- Ask The User For Their Name
promptUserName :: IO String
promptUserName = do
    prompt "Enter Your Name: "
    getLine

-- Ask The User If They Want To Exit
promptUserExit :: IO Bool
promptUserExit = do
    prompt "Do You Want To Exit? "
    commands <- getLine

    if commands == "yes" || commands == "y"
        then do
            handleExit
            return True
        else return False

    -- let comTuple = processCommand commands
    -- -- return comTuple

-- Ask The User Where They Want To Go
promptUserMovement :: IO Movement
promptUserMovement = do
    prompt "Which Direction Do You Wish To Move? (Forwards[f], Backwards[b], Left[L], Right[r] ) "
    commands <- getLine

    return (stringToMovement (map toLower commands))

-- Ask The User What Action They Want To Take?
promptUserAction :: Unit -> Unit -> IO Action
promptUserAction u1 u2 = do
    prompt "Do You Want To Heal or Attack? "
    commands <- getLine
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD

    case commands of
        "attack" -> return Attack(u1, u2)
        "a" -> return Attack(u1, u2)
        "heal" -> return Heal(u1, u2)
        "h" -> return Heal(u1, u2)

prompt :: String -> IO()
prompt p = do 
    showCursor
    drawString (p, 15, 0)

stringToMovement :: String -> Movement
stringToMovement "f" = Forwards
stringToMovement "b" = Backwards
stringToMovement "l" = Left
stringToMovement "r" = Right
stringToMovement "forwards" = Forwards
stringToMovement "backwards" = Backwards
stringToMovement "left" = Left
stringToMovement "right" = Right

drawHeroStat :: IO()
drawHeroStat = do
    drawStat ("Health", health, 0,0)
    drawStat ("Attack", dex, 1,0)
    drawStat ("Defence", stamina, 2,0)
    drawStat ("Speed", stamina, 3,0)

=======
>>>>>>> 812882a8fb793956d2b8a83e21f3992ef7da3aae
>>>>>>> 2f57f3a01506edc1420d90babef51d550e2b97dd
>>>>>>> 9011ecea178a210d18eb9a3026ba487e21bac948

    case commands of
        "attack" -> return Attack(u1, u2)
        "a" -> return Attack(u1, u2)
        "heal" -> return Heal(u1, u2)
        "h" -> return Heal(u1, u2)

-- Prompt the user for string
prompt :: String -> IO()
prompt p = do 
    showCursor
    drawString (p, 15, 0)

-- Convert user input to Movement Types
stringToMovement :: String -> Movement
stringToMovement "f" = Forwards
stringToMovement "b" = Backwards
stringToMovement "l" = Left
stringToMovement "r" = Right
stringToMovement "forwards" = Forwards
stringToMovement "backwards" = Backwards
stringToMovement "left" = Left
stringToMovement "right" = Right

-- Take in thje hero information and display it to the user
drawHeroStat :: IO()
drawHeroStat = do
    drawStat ("Health", health, 0,0)
    drawStat ("Attack", dex, 1,0)
    drawStat ("Defence", stamina, 2,0)
    drawStat ("Speed", stamina, 3,0)

<<<<<<< HEAD
-- Take in an enemy stat and display it to the user
=======
<<<<<<< HEAD
-- Take in an enemy stat and display it to the user
=======
<<<<<<< HEAD
-- Take in an enemy stat and display it to the user
=======
>>>>>>> f7a4dbbdcbc618a5529020026d0eabc8caed5d40
>>>>>>> 812882a8fb793956d2b8a83e21f3992ef7da3aae
>>>>>>> 2f57f3a01506edc1420d90babef51d550e2b97dd
>>>>>>> 9011ecea178a210d18eb9a3026ba487e21bac948
drawEnemyStat :: IO()
drawEnemyStat = do
    drawStat ("Enemy Health", health, 0, 40)
    drawStat ("Enemy Attack", dex, 1, 40)
    drawStat ("Enemy Defence", stamina, 2, 40)
    drawStat ("Enemy Speed", stamina,32, 40)

--caluculate bar width max 50 --int or string?
calculateStat :: Int -> String
calculateStat stat = replicate (stat `div` 2) '█'

--test data TODO: replace with real state
health::Int
health = 100
dex::Int
dex = 50
stamina::Int
stamina = 50
progress::Int
progress = 75
combat::Bool
combat = True
event1::String
event1 = "old mcdonald died"
event2::String
event2 = "I got more food"
event3::String
event3 = "healed for 10 bucks"
event4::String
event4 = ""

--Method to draw all information to the screen...
--Where all the UI magics will be made 😁
drawScreen ::IO()
drawScreen = do
    clearScreen
    drawStat ("Health", health, 0,0)
    drawStat ("Attack", dex, 1,0)
    drawStat ("Defence", stamina, 2,0)
    drawStat ("Speed", stamina, 3,0)
    -- when combat $ drawStat ("Enemy Health", health, 0, 40)
    -- when combat $ drawStat ("Enemy Attack", dex, 1, 40)
    -- when combat $ drawStat ("Enemy Defence", stamina, 2, 40)
    -- when combat $ drawStat ("Enemy Speed", stamina,32, 40)

    drawString (replicate 80 '*', 4, 0)
    -- drawString ("Progress: " ++ show progress ++ " " ++ calculateStat progress, 5,0)
    drawString ("Part 1: ", 6,0)
    drawString ("Part 2: ", 6,20)
    drawString ("Part 3: ", 6,40)
    
    drawString inventory

    drawString ("Slot 1: ", 9,0)
    drawString ("Slot 2: ", 10,0)
    drawString ("Slot 3: ", 11,0)
    drawString ("Slot 4: ", 12,0)
    drawString ("Slot 5: ", 13,0)

    drawString ("Slot 6: ", 9,20)
    drawString ("Slot 7: ", 10,20)
    drawString ("Slot 8: ", 11,20)
    drawString ("Slot 9: ", 12,20)
    drawString ("Slot 10: ",13,20)

    drawString ("Slot 11: ", 9,40)
    drawString ("Slot 12: ", 10,40)
    drawString ("Slot 13: ", 11,40)
    drawString ("Slot 14: ", 12,40)
    drawString ("Slot 15: ", 13,40)

    drawString ("Slot 16: ", 9,60)
    drawString ("Slot 17: ", 10,60)
    drawString ("Slot 18: ", 11,60)
    drawString ("Slot 19: ", 12,60)
    drawString ("Slot 20: ", 13,60)

    drawString (replicate 80 '*', 14, 0)
    drawString ("Past Events: ", 15,0)
    unless (null event1) $ drawString (event1, 16, 5)
    unless (null event2) $ drawString (event2, 17, 5)
    unless (null event3) $ drawString (event3, 18, 5)
    unless (null event4) $ drawString (event4, 19, 5)

drawStat :: (String, Int, Int, Int) -> IO()
drawStat (statName, stat, x, y) = do
        drawString (statString, x,y)
        -- drawString (statBar, x,statLength)
                where   statString = statName ++ ": " ++ show stat
                        d = length (show stat)
        --                 statStringLength = length statString
        --                 whitespace = replicate (statStringLength - 15) '.'
        --                 statLength = length whitespace + statStringLength
        --                 statBar = " " ++ calculateStat stat

--Method to draw a string at a certain position on the screen
--Params: string: string to draw
--Params: x: where to draw
--Params: y: where to draw
drawString :: (String, Int, Int) -> IO()
drawString (string, x, y) = do
    setCursorPosition x y
    putStr string

drawEvent :: String -> IO()
drawEvent string = do
    setCursorPosition 22 0
    putStr string

--     putStrLn "\n"

--     executeCommand comTuple
--     case comTuple of
--         (Exit, Void) -> handleExit
--         _    -> normalGameLoop

--     if not warning && not firstrun then putStrLn "Enter The Command: "
--                                     else if firstrun then putStrLn "What Is Your Name: "
--                                     else putStrLn "YOU MUST ENTER A VALID COMMAND: "
--     commands <- getLine

--     let comTuple | not firstrun  = processCommand commands
--                  |otherwise = processName commands
-- 

--   -- reset the SGR and give a thank you message/¿massage?
handleExit :: IO()
handleExit = do
    setSGR [Reset]
    clearScreen
    setCursorPosition 0 0
    showCursor
    putStrLn "Thanks for playing!!! 😂😂😂"