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
module Combat
(
	updateUnit
) where

actionValue :: Unit -> Action -> Double
actionValue source (Attack (source, target)) = -(attack*speed)/10 
actionValue source (Heal (source, target))   = 10.0      


updateUnit :: Unit -> Unit -> Action -> Unit --Must update what a "Unit" is based on Unit.hs
updateUnit source (health, attack, defense, speed) action = health + effect
    where effect = actionValue source action





