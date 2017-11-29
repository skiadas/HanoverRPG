
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
 createUnit,
 changeHealth,
 changeAttack,
 changeDefense,
 changeSpeed,
 getName,
 getHealth,
 getAttack,
 getDefense,
 getSpeed

) where


type Username = String
type HP = Int
type Attack = Int --A stat that influences damage done in battle
type Defense = Int --A stat that influences how much damage is taken in battle
type Speed = Int --A stat that influences avoid chance and turn order
data Attributes = Attributes (HP,Attack,Defense,Speed)
data Unit = Unit (Username, Attributes, Death, IsPlayer) --The collection of important stats
type Death = Bool --Is a unit dead or not. Defaults to alive
type IsPlayer = Bool  --Is it a player or not. Defaults to Enemy

-- Module starts here.

--Given a unit returns that unit's name
getName :: Unit -> String
getName (Unit (pName, _, _, _)) = pName

--given a unit's attributes, returns its HP
getHealth :: Attributes -> Int
getHealth (Attributes (hp, _, _, _)) = hp

--given a unit's attributes, returns its Attack
getAttack :: Attributes -> Int
getAttack (Attributes (_, atk, _, _)) = atk

--given a unit's attributes, returns its Defense
getDefense :: Attributes -> Int
getDefense (Attributes (_, _, def, _)) = def

--given a unit's attributes, returns its Speed
getSpeed :: Attributes -> Int 
getSpeed (Attributes (_, _, _, spd)) = spd

createUnit :: Username -> HP -> Attack -> Defense -> Speed -> IsPlayer -> Unit
createUnit unitName maxHP atk def spd player = (Unit (unitName, (Attributes (maxHP, atk, def, spd)), False, player))

--given a set of attributes, and a new HP stat, returns those attributes with the updated stat
changeHealth :: Attributes -> Int -> Attributes
changeHealth (Attributes (oldHP, atk, def, spd)) newHP = (Attributes (newHP, atk, def, spd))

--given a set of attributes, and a new Attack, returns those attributes with the updated stat
changeAttack :: Attributes -> Int -> Attributes
changeAttack (Attributes (hp, oldAtk, def, spd)) newAtk = (Attributes (hp, newAtk, def, spd))

--given a set of attributes, and a new Defense, returns those attributes with the updated stat
changeDefense :: Attributes -> Int -> Attributes
changeDefense (Attributes (hp, atk, oldDef, spd)) newDef = (Attributes (hp, atk, newDef, spd))

--given a set of attributes, and a new Speed, returns those attributes with the updated stat
changeSpeed :: Attributes -> Int -> Attributes
changeSpeed (Attributes (hp, atk, def, oldSpd)) newSpd = (Attributes (hp, atk, def, newSpd))










