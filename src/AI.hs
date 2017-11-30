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
    findLowestHp
) where

-- Module starts here.

--import Combat.action
--import Unit

-- A function that returns the AI unit with the least health.
findLowestHp:: [Unit] -> Unit
findLowestHp (x:[])                  = x
findLowestHp (x,y:rest) 
        |x.getHealth < y.getHealth   = findLowestHp (x:rest)
        |x.getHealth == y.getHealth  = findLowestHp (x:rest)
        |otherwise                   = findLowestHp (y:rest)

-- A function that looks for an Ai unit whose hp<50%
lessThan50PercentHp:: [Unit] -> Bool
lessThan50PercentHp []      = False
lessThan50PercentHp (x:xs)
    |x.getHealth <= half    = True
    |otherwise              = lessThan50PercentHp (xs)
        where half = (x.getMaxHealth)/2

-- A function that returns an Action for the AI to perform. 
chooseAction:: Unit -> [Unit] -> [Unit] -> Action
chooseAction ai (ais:friends) (player:rest) 
            |lessThan50PercentHp (ai:ais:friends) = Heal (ai, allie)
            |otherwise                            = Attack (ai, enemy) 
                where allie = findLowestHp (ai:ais:friends)
                      enemy = findLowestHp (player:rest)
