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

 -- Needs Fixed, Possible Block types: S (Start), G (Goal)
data Type = X | O | I
data Weather = Rain | Wind | Snow | Clear
data Floor = 1 | 2 | 3

type Map = ([Block], Location, Weather) -- Grid Map, each Block is a place the player can move to
type Block = (Type, Type, Type, Type, Type) -- Current block Type, Up, Right, Down, Left
type Location = (Num, Num)

-- returns the starting map from the JSON file
initMap :: Map
initMap = (JSON.map, JSON.spawn, JSON.weather)

-- returns the weather variable
getWeather :: Map -> Weather
getWeather (_, _, weather) = weather

-- returns the players current Location
getLocation :: Map -> Location
getLocation (_, Location, _) = location

-- returns the map variable
getMap :: Map
getMap (map, _, _) = Map

-- Not Working !!! Needs to correctly search the JSON file in order to update the weather
-- Takes in the current map and a Location, and returns a new Map with the updated Location and Weather
updateMap :: Map -> Location -> Map
updateMap (map, loc, weather) (x, y)) = (map, (x,y), JSON.weather[x][y]

-- Not Working !!! Needs to get the Block that the player is in, based on the given Map & Location, then return whether the player is on an 'Inside' Block
-- Takes in the current map and returns a Bool based on if the player is currently Inside (ie. on an I Block)
isInside :: Map -> Bool
isInside (map, loc, _ ) = map[x][y] == I

