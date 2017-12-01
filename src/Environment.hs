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
import State
module Environment
(
	Location,
	Map (...),
	Block,

	initMap,
	getWeather,
	getMap,
	getLocation,
	updateMap
) where

-- Module starts here.

data Weather = Rain | Wind | Snow | Clear
data Type = B | S | G | O | E | Q | Stairs {- Boundary | Start | Goal | Outside | Entrance/Exit | Quest Objective | Stairs -}
data Floor = 1 | 2 | 3

type Map = ([Block], Location, Weather) {- Grid Map, each Block is a place the player can move to -}
type Block = (Type, Type, Type, Type, Type) {- Current block Type, Up, Right, Down, Left -}
type Location = (Num, Num)


{-
Possible Variables:
    Num :: moves = 0
    [(Num, Num)] :: visited = []
-}
initMap :: Map
initMap = JSON.map
{- returns the weather variable -}
getWeather :: Map -> Weather
getWeather (_, _, weather)  = weather

{- returns the players current Location -}
getLocation :: Map -> Location
getLocation (_, Location, _)= location
{- returns the map variable-}
getMap :: Map
getMap (map, _, _) = Map

{- takes a location, and returns the World Map with the player Location updated -}
updateMap :: Map -> Location -> Map
updateMap (map, loc, weather) (x, y)) = (map, (x,y), JSON.weather[x][y]{- automatically calls inside updateMap function, checks if the player has gone Inside (ie. moved to an `E` Block) -}

isInside :: Location -> Bool
isInside (map, loc, _ ) = take y (take x map) == I --***Not Complete 

