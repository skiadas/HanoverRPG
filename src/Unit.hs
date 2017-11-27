
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
    type Attack = Int
    type Defense = Int
    type Speed = Int
	data Unit = (Name, HP, Attack, Defense, Speed, Death, pType)
	data Death = False | True
	data IsPlayer = False | True


) where

-- Module starts here.
