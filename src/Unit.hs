
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
 Unit,
 createUnit,
 changeHealth,
 changeAttack,
 changeDefense,
 changeSpeed,
 HasSword,
 HasShield,
 HasArmor,
 Equipment,
 getUserName, 
 getHealth,
 getMaxHP,
 getAttack,
 getDefense,
 getSpeed,
 getWeapon,
 getShield,
 getArmor,
 getLiveAttack,
 getLiveDefense,
 getLiveSpeed,
 changeEquipment

) where

import Inventory 

type Username = String
type HP = Int
type MaxHP = Int
type Attack = Int --A stat that influences damage done in battle
type Defense = Int --A stat that influences how much damage is taken in battle
type Speed = Int --A stat that influences avoid chance and turn order
data Attributes = Attributes (HP,MaxHP,Attack,Defense,Speed)
data Unit = Unit (Username, Attributes,Equipment, Death, IsPlayer) --The collection of important stats
type Death = Bool --Is a unit dead or not. Defaults to alive
type IsPlayer = Bool  --Is it a player or not. Defaults to Enemy
data Equipment = Equipment(HasSword, HasShield, HasArmor, Storage)
type HasSword = Maybe Item
type HasShield = Maybe Item
type HasArmor = Maybe Item

-- Module starts here.

--Given a unit returns that unit's name
getUserName :: Unit -> String
getUserName (Unit (pName, _, _, _, _)) = pName

--given a unit's attributes, returns its HP
getHealth :: Unit -> Int
getHealth (Unit (_, Attributes(hp, _, _, _, _), Equipment(_,_,_,_), _ ,_)) = hp

getMaxHP :: Unit -> Int
getMaxHP (Unit (_, Attributes(_, maxHP, _, _, _),Equipment(_,_,_,_), _ ,_)) = maxHP
--given a unit's attributes, returns its Attack
getAttack :: Unit -> Int
getAttack (Unit (_, Attributes(_, _, atk, _, _), Equipment(_,_,_,_), _ ,_)) = atk

--given a unit's attributes, returns its Defense
getDefense :: Unit -> Int
getDefense (Unit (_, Attributes(_, _, _, def, _), Equipment(_,_,_,_),_ ,_)) = def

--given a unit's attributes, returns its Speed
getSpeed :: Unit -> Int 
getSpeed (Unit (_, Attributes(_, _, _, _, spd), Equipment(_,_,_,_), _ ,_)) = spd



createUnit :: Username -> HP -> Attack -> Defense -> Speed -> IsPlayer -> Unit
createUnit unitName maxHP atk def spd player = (Unit (unitName, (Attributes (maxHP, maxHP, atk, def, spd)),(Equipment(Nothing,Nothing,Nothing,storage)), False, player))

--given a set of attributes, and a new HP stat, returns those attributes with the updated stat
changeHealth :: Unit -> Int -> Unit
changeHealth (Unit (name, (Attributes (oldHP, maxHP, atk, def, spd)),(Equipment(sword,shield,armor,backpack)), death, player)) newHP = (Unit (name, Attributes (newHP, maxHP, atk, def, spd),(Equipment(sword,shield,armor,backpack)), death, player))

--given a set of attributes, and a new Attack, returns those attributes with the updated stat
changeAttack :: Unit -> Int -> Unit
changeAttack (Unit ( name, (Attributes (hp,maxHP, oldAtk, def, spd)),(Equipment(sword,shield,armor,backpack)),death, player)) newAtk = (Unit ( name, Attributes (hp,maxHP, newAtk, def, spd),(Equipment(sword,shield,armor,backpack)),death, player))

--given a set of attributes, and a new Defense, returns those attributes with the updated stat
changeDefense :: Unit -> Int -> Unit
changeDefense (Unit ( name, (Attributes (hp,maxHP, atk, oldDef, spd)),(Equipment(sword,shield,armor,backpack)), death, player)) newDef = (Unit ( name, Attributes (hp,maxHP, atk, newDef, spd),(Equipment(sword,shield,armor,backpack)), death, player))

--given a set of attributes, and a new Speed, returns those attributes with the updated stat
changeSpeed :: Unit -> Int -> Unit
changeSpeed (Unit (name, (Attributes (hp,maxHP, atk, def, oldSpd)),(Equipment(sword,shield,armor,backpack)), death, player)) newSpd = (Unit (name, Attributes (hp,maxHP, atk, def, newSpd),(Equipment(sword,shield,armor,backpack)), death, player))

getWeapon :: Unit -> Maybe Item
getWeapon (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(sword,shield,armor,backpack)), death, player)) = sword

getArmor :: Unit -> Maybe Item
getArmor (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(sword,shield,armor,backpack)), death, player)) = armor

getShield :: Unit -> Maybe Item
getShield (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(sword,shield,armor,backpack)), death, player)) = shield

getLiveAttack :: Unit -> Int
getLiveAttack (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Just shield, Just armor,backpack)), death, player)) = atk + getAttackEff sword + getAttackEff shield
getLiveAttack (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Just shield, Just armor,backpack)), death, player)) = atk + getAttackEff shield
getLiveAttack (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Nothing, Just armor,backpack)), death, player)) = atk + getAttackEff sword
getLiveAttack (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Just shield, Nothing,backpack)), death, player)) = atk + getAttackEff sword + getAttackEff shield
getLiveAttack (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Nothing, Just armor,backpack)), death, player)) = atk 
getLiveAttack (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Just shield, Nothing,backpack)), death, player)) = atk + getAttackEff shield
getLiveAttack (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Nothing, Nothing,backpack)), death, player)) = atk + getAttackEff sword
getLiveAttack (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Nothing, Nothing,backpack)), death, player)) = atk 

getLiveDefense :: Unit -> Int
getLiveDefense (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Just shield, Just armor,backpack)), death, player)) = def + getDefEff sword + getDefEff shield + getDefEff armor
getLiveDefense (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Just shield, Just armor,backpack)), death, player)) = def + getDefEff shield + getDefEff armor
getLiveDefense (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Nothing, Just armor,backpack)), death, player)) = def + getDefEff sword + getDefEff armor
getLiveDefense (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Just shield, Nothing,backpack)), death, player)) = def + getDefEff sword + getDefEff shield
getLiveDefense (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Nothing, Just armor,backpack)), death, player)) = def + getDefEff armor
getLiveDefense (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Just shield, Nothing,backpack)), death, player)) = def + getDefEff shield
getLiveDefense (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Nothing, Nothing,backpack)), death, player)) = def + getDefEff sword
getLiveDefense (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Nothing, Nothing,backpack)), death, player)) =  def

getLiveSpeed :: Unit -> Int
getLiveSpeed (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Just shield, Just armor,backpack)), death, player)) = spd + getSpeedEff sword + getSpeedEff shield + getSpeedEff armor
getLiveSpeed (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Just shield, Just armor,backpack)), death, player)) = spd + getSpeedEff shield + getSpeedEff armor
getLiveSpeed (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Nothing, Just armor,backpack)), death, player)) = spd + getSpeedEff sword + getSpeedEff armor
getLiveSpeed (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Just shield, Nothing,backpack)), death, player)) = spd + getSpeedEff sword + getSpeedEff shield
getLiveSpeed (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Nothing, Just armor,backpack)), death, player)) = spd + getSpeedEff armor
getLiveSpeed (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Just shield, Nothing,backpack)), death, player)) = spd + getSpeedEff shield
getLiveSpeed (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Just sword, Nothing, Nothing,backpack)), death, player)) = spd + getSpeedEff sword
getLiveSpeed (Unit (name, (Attributes (hp,maxHP, atk, def, spd)),(Equipment(Nothing, Nothing, Nothing,backpack)), death, player)) =  spd

changeEquipment :: Unit -> Unit
changeEquipment (Unit ( name, (Attributes (hp,maxHP, atk, oldDef, spd)),(Equipment(sword,shield,armor,backpack)), death, player)) = (Unit ( name, (Attributes (hp,maxHP, atk, oldDef, spd)),(Equipment(sword,shield,armor,backpack)), death, player))




