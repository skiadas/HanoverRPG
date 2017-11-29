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
data Type = B | S | G | O | E | Q | Stairs {- Boundary | Start | Goal | Outside | Entrance/Exit | Quest Objective | Stairs -}
data Floor = 1 | 2 | 3

type Map = ([Block], Location) {- Grid Map, each Block is a place the player can move to -}
type Block = (Loc, Up, Left, Down, Right) {- (Current Type, Type if Up, Type if Right, Type if Down, Type if Left) -}
type Loc = (Type, String, Floor) {- (Name, Floor) -}
type Location = (Num, Num)
type Building = (String, [Map], Location) {- libraryMap = (JSON.library, [JSON.library.0, JSON.library.1, JSON.library.2], JSON.library.start) -}

Weather ::      weather = Clear
(Num, Num) ::   location = (0, 0) {- map.world.start -}
Map ::          worldMap = [[]] {- map.world.0 -}

{-
Possible Variables:
    Num :: moves = 0
    [(Num, Num)] :: visited = []
-}

{- returns the weather variable -}
getWeather :: Weather
getWeather = weather

{- returns the players current Location -}
getLocation :: Location
getLocation = location

{- changes weather variable, based on random number generation -}
changeWeather :: Weather
changeWeather |
    (Random.gen(10) < 3) = weather {- generate random num 0-3, 1 = Rain, 2 = Wind, 3 = Snow, 4 = Clear -}
    otherwise            = weather

{- takes a location, and returns the World Map with the player Location updated -}
updateLocation :: Location -> Map
updateMap (x, y) = map

{- automatically calls inside updateLocation function, checks if the player has gone Inside (ie. moved to an `E` Block) -}
goInside :: Location -> Building
goInside loc@(x, y) = (bd, JSON.bd, JSON.bd.start)
    where bd = JSON.world.buildings.find( (x, y) )

{- take the sections of the map from the JSON file and combine them into a larger array; the map -}
makeMap :: [[Num]] -> Maybe [[Num]] -> Maybe [[Num]] -> [[[Num]]]
makeMap a b c = a ++ b ++ c
