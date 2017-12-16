{-|
Module      : Environment
Description : The Environment module
Copyright   : (c) Gage Hafl, 2017
                  Terriyon Veasy, 2017
License     : MIT
Maintainer  : haflg19@hanover.edu
              veasyt19@hanover.edu

The Environment module tracks the current Location of the player and provides the functionality to control this.
The players Location is defined by `data Location`. This can be tracked and modified with several methods:
    `path`, `locFromIndex`, `locFromName`, `spotFromIndex`, `spotFromName`, `nextLocation`, `prevLocation`.

Originally, the Environment module was going to track the game's map, however due to time constraints we were not able to implement this version of the Environment module.
We only found out on Wednesday of the last week of class that the game was switching up some things with how the player was moving throughout the map, which made the grid-map version of the Environment module useless.
So, we didn't really have enough time to fully flesh out our new Environment module, plus with the new design, there wasn't really much for us to do beyond this.
-}
import Data.List

module Environment
(
-- public datas and types
    -- The `Location` data-type represents all of the possible locations in the game for the player
    data Location = Scenic | Library | CC | Parker | Point deriving (Eq, Show),
    Spot,

-- public functions
    path,
    locFromIndex,
    locFromName,
    spotFromIndex,
    spotFromName,
    nextLocation,
    prevLocation
) where

-- The `Spot` type represents a tuple, which may look something like this: `(Parker, 3)`, containing:
--      a `Location` type along with the `Int` value representing the index of the location in the game map
type Spot = (Location, Int)

-- This function is used to track the Game's path for the Character
-- In this situation, the player would start at the `Location` Scenic, and then move to the Library `Location`
--      and then the CC, and then Parker, and then finally move to the Point `Location`
-- This function takes no arguments, and will return an array of `Location` values
path :: [Location]
path = [Scenic, Library, CC, Parker, Point]

-- The `locFromIndex` function takes an `Int` value, similar to the `spotFromIndex` function,
--      however, this function only returns the `Location` name rather than a `Spot` value
locFromIndex :: Int -> Location
locFromIndex ind = path !! ind

-- The `locFromName` function takes a `Location` value, similar to the `spotFromName` function,
--      however, this function only returns the `Int` value rather than a `Spot` value
locFromName :: Location -> Int
locFromName loc = ind
    where Just ind = elemIndex loc path

-- The `spotFromIndex` function will take an index and return the corresponding `Spot` type
-- So, if we use the path function above, then calling `spotFromInd 2` will return a `Spot` with a value of `(CC, 2)`
spotFromIndex :: Int -> Spot
spotFromIndex ind = (loc, ind)
    where loc = locFromIndex ind

-- The `spotFromName` function will take a `Location` and return the corresponding `Spot` type
-- So, if we use the path function above, then calling `spotFromName CC` will return `(CC, 2)`
spotFromName :: Location -> Spot
spotFromName loc = (loc, ind)
    where ind = locFromName loc

-- The `nextLocation` function takes in a `Spot` value and returns the `Spot` value that comes after it based on the `path` function
-- So, calling `nextLocation (CC, 2)` will return the `Spot` `(Parker, 3)`
nextLocation :: Spot -> Spot
nextLocation (_, ind) = spotFromIndex (ind + 1)

-- The `prevLocation` function takes in a `Spot` value and returns the `Spot` value that comes before it based on the `path` function
-- So, calling `prevLocation (CC, 2)` will return the `Spot` `(Library, 1)`
prevLocation :: Spot -> Spot
prevLocation (_, ind) = spotFromIndex (ind - 1)