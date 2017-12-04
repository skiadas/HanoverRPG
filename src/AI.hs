{-|
Module      : AI
Description : The AI module
Copyright   : (c) Brian Hayes,
                  Tyler Walker, 2017
License     : MIT
Maintainer  : sample@email.com

Here is a longer description of this module, containing some
commentary:
    This module is for the brains of all AI units within 
    the game, providing all AI units with actions and strategies
    for combating the UI units. This module is mostly internal. (Update at some point)

-}
module AI
(
    -- ** A data type
    AI, -- exporting module
    -- some functions
    findLowestHp,
    isBoss
) where

-- Module starts here.

import System.Random
import Combat.Action
import Unit

-- A function that returns the AI unit with the least health.
findLowestHp:: [Unit] -> Unit
findLowestHp (x:[])                  = x
findLowestHp (x,y:rest) 
        |getHealth x < getHealth y   = findLowestHp (x:rest)
        |getHealth x == getHealth y  = findLowestHp (x:rest)
        |otherwise                   = findLowestHp (y:rest)

-- A function that looks for an Ai unit whose hp<=75%
lessThan75PercentHp:: [Unit] -> Bool
lessThan75PercentHp []        = False
lessThan75PercentHp (x:xs)
    |getHealth x <= fourth    = True
    |otherwise                = lessThan75PercentHp (xs)
        where fourth = (3*(getMaxHP x))/4

-- A function that looks for an Ai unit whose hp<=50%
lessThan50PercentHp:: [Unit] -> Bool
lessThan50PercentHp []      = False
lessThan50PercentHp (x:xs)
    |getHealth x <= half    = True
    |otherwise              = lessThan50PercentHp (xs)
        where half = (getMaxHP x)/2

-- A function that returns an Action for the AI to perform. 
chooseAction:: Unit -> [Unit] -> [Unit] -> IO Action
chooseAction ai (ais:friends) (player:rest) = do
        x <- rollDice
        if lessThan50PercentHp (ai:ais:friends) && rollDice <= 35
            then return  Heal (ai, allie)
            else return  Attack (ai, enemy) 
                where allie = findLowestHp (ai:ais:friends)
                      enemy = findLowestHp (player:rest)

-- A function that returns an Action for a boss unit AI to perform, if there is one.
chooseBossAction:: Unit -> [Unit] -> IO Action
chooseBossAction self (player:rest) = error "stub"

-- A function that checks if a given Unit is a normal unit or a boss unit.
isBoss:: Unit 
isBoss ai = error "stub"

-- A helper function for chooseAction 
rollDice :: IO Int
rollDice = getStdRandom (randomR (1,100))