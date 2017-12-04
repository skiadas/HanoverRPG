{-|
Module      : Combat
Description : The Combat module
Copyright   : (c) Kenny Jarnagin, 2017
                  Lucas Miller, 2017
License     : MIT
Maintainer  : jarnagink19@hanover.edu

Here is a longer description of this module, containing some
commentary with @some markup@. 
-}

module Combat
(
	updateUnit
) where

import Combat.ActionOptions
import Unit

actionValue :: Unit -> Action -> Int
actionValue source (Attack (source, target)) = -((attack*speed)/10) + defense
    where attack  = getAttack source
          speed   = getSpeed source
          defense = (getDefense target) % 2
actionValue source (Heal (source, _))   = 10

updateUnit :: Unit -> Unit -> Action -> Unit 
updateUnit source target action = health + effect
    where effect = actionValue source action
    	  health = getHealth target

--Need to find a way to implement IO to take a user's action to implement the action
--Documentation is required
