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
import Combat.Action 
import Unit
module Combat
(
	updateUnit
) where

actionValue :: Unit -> Action -> Double
actionValue source (Attack (source, target)) = -(attack*speed)/10 
    where attack = getAttack source
          speed  = getSpeed source
actionValue source (Heal (source, target))   = 10.0      

getTargetHealth :: Unit -> Double
getTargetHealth target = getHealth target --Can we rewrite this so it doesn't take a parameter?


updateUnit :: Unit -> Unit -> Action -> Unit 
updateUnit source target action = health + effect
    where effect = actionValue source action
          health = getTargetHealth target





