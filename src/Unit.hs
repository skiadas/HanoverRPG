
{-Module      : Unit
Description : The Unit module
Copyright   : (c) Collin Umphrey, 2017
                  Graham Wood, 2017
License     : Hanover College
Maintainer  : umphreyc19@hanover.edu

Here is a longer description of this module, containing some
commentary with @some markup@. 

Basic and advanced parts of units, including but not limited to:
Stats - HP, Attack, Defense, Speed, Intelligence(power of magic and defense of magic(maybe if we do magic))
Levels - Stat growths through levels, what level would be max, current level and experience.
Abilities - 
Classes - What each class can do

Attributes



-}
module Unit
(

    type Name = String
    type HP = Int
    type Attack = Int --A stat that influences damage done in battle
    type Defense = Int --A stat that influences how much damage is taken in battle
    type Speed = Int --A stat that influences avoid chance and turn order
    data Attributes (HP,Attack,Defense,Speed)
	data Unit = (Name, Attributes, Death, pType) --The collection of important stats
	data Death = False | True --Is a unit dead or not. Defaults to alive
	data IsPlayer = False | True --Is it a player or not. Defaults to Enemy


) where

-- Module starts here.

--Given a unit returns that unit's name
getName :: Unit -> String
getName (unitName, _, _, _, _, _, _) = unitName

--given a unit's attributes, returns its HP
getHealth :: Attributes -> Int
getName (hp, _, _, _) = hp

--given a unit's attributes, returns its Attack
getAttack :: Attributes -> Int
getAttack (_, atk, _, _) = atk

--given a unit's attributes, returns its Defense
getDefense :: Attributes -> Int
getDefense (_, _, def, _) = def

--given a unit's attributes, returns its Speed
getSpeed :: Attributes -> Int 
getSpeed (_, _, _, spd) = spd

createUnit :: String -> Int -> Int -> Int -> Int -> Bool -> Unit
createUnit unitName maxHP atk def spd player = (unitName, (maxHP, atk, def, spd), False, player)

--given a set of attributes, and a new HP stat, returns those attributes with the updated stat
changeHealth :: Attributes -> Int -> Attributes
createHeatlh (oldHP, atk, def, spd) newHP = (newHP, atk, def, spd)

--given a set of attributes, and a new Attack, returns those attributes with the updated stat
changeHealth :: Attributes -> Int -> Attributes
createHeatlh (hp, oldAtk, def, spd) newAtk = (hp, newAtk, def, spd)

--given a set of attributes, and a new Defense, returns those attributes with the updated stat
changeHealth :: Attributes -> Int -> Attributes
createHeatlh (hp, atk, oldDef, spd) newDef = (hp, atk, newDef, spd)

--given a set of attributes, and a new Speed, returns those attributes with the updated stat
changeHealth :: Attributes -> Int -> Attributes
createHeatlh (hp, atk, def, oldSpd) newSpd = (hp, atk, def, newSpd)









