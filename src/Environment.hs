{-|
Module      : Environment
Description : The Environment module
Copyright   : (c) Gage Hafl, 2017
                  Terriyon Veasy, 2017
License     : MIT
Maintainer  : haflg19@hanover.edu
              veasyt19@hanover.edu

Here is a longer description of this module, containing some
commentary with @some markup@. FIX THIS
-}
module Environment
(


) where

-- Module starts here.

data Weather = Rain | Wind | Snow | Clear
data Type = B | I | O {- B = boundary, I = inside, O = outside -}
data Floor = 1 | 2 | 3

type Map = [[Block]] {- Grid Map, each Block is a place the player can move to -}
type Block = (Type, Up, Left, Down, Right) {- (Current Type, Type if Up, Type if Right, Type if Down, Type if Left) -}
type Building = (String, Floor) {- (Name, Floor) -}