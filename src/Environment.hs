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
import Data.List

module Environment
(
	-- Location,
	-- Map (...),
	-- Block,

	-- initMap,
	-- getMap,
	-- getLocation,
	-- updateMap
) where

-- Module starts here

data Location = "Scenic Drive" | "Library" | "CC" | "Parker" | "Point"

locations :: [Location]
locations = ["Scenic Drive", "Library", "CC", "Parker", "Point"]

indLocation :: Location -> Location
indLocation currLocation = elemIndex currLocation locations

findLocation :: Location -> Location
findLocation currLocation = locations !! ((indLocation currLocation) + 1)

 -- Needs Fixed, Possible Block types: S (Start), G (Goal)
-- data Type = X | O | I
-- data Floor = 1 | 2 | 3

-- type Map = ([Block], Location, Weather) -- Grid Map, each Block is a place the player can move to
-- type Block = (Type, Type, Type, Type, Type) -- Current block Type, Up, Right, Down, Left
-- type Location = (Num, Num)

-- returns the starting map from the JSON file
-- initMap :: Map
-- initMap = ....

-- returns the players current Location
-- getLocation :: Map -> Location
-- getLocation (_, Location, _) = location

-- returns the map variable
-- getMap :: Map
-- getMap (map, _, _) = Map

-- Not Working !!! Needs to correctly search the JSON file in order to update the weather
-- Takes in the current map and a Location, and returns a new Map with the updated Location and Weather
-- updateMap :: Map -> Location -> Map
-- updateMap (map, loc, weather) (x, y)) = ....


