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
	updatedUnit
) where

amountOfDamage :: Unit -> Double
amountOfDamage source = error "Fix me" --(attack*speed)/10 is the formula used


updatedUnit :: Unit -> Double -> Unit
updatedUnit target = error "Fix me" --basically update the target's current state





