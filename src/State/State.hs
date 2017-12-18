--State.State.hs




module State.State
(
	blankGame,
	getUnits,
	getEnviro,
	getInv,
	updateEnvironment,
	unitHelper,
	updateUnit,
	inventoryHelper,
	updateInventory,
	addUnit

) where

import Unit.hs
import Environment.hs
import State.hs
import Inventory.hs

data Units = [Unit]
data Enviro = (Weather, Location)
data Inv = [Equipment]

type State = (Units, Enviro, Inv)

-- create a blank game to start
blankGame :: State
blankGame = ([], (Clear, (0,0)), [])

-- get units from current state
getUnits :: State -> Units
getUnits (u, _, _) = u

-- get environment from current state
getEnviro :: State -> Enviro
getEnviro (_, e, _) = e

-- get inventory from current state
getInv :: State -> Inv
getInv (_, _, i) = i

-- update environment and return a new state
updateEnvironment :: Enviro -> State -> State
updateWeather (weather, location) (u, e, i) = (getUnits u e i, (weather, location), getInv u e i)

-- updates the current unit to the new unit
-- used in updateUnit function
unitHelper :: Unit -> Units -> Units
unitHelper un (u:us) | un.getName == u.getName = u = un 
					 | otherwise = updateUnit un us

-- update unit and return a new state
updateUnit :: Unit -> State -> State
updateUnit u (u, e, i) = (unitHelper u, getEnviro u e i, getInv u e i) 

-- updates the current inventory to the new inventory
-- used in updateInv function			
--inventoryHelper :: Units -> Inv 
--inventoryHelper (u:us) = --need getEnvironment from unit

-- update inventory and return a new state
updateInventory :: Inv -> State -> State
updateInventory (e:es) (u, e, i) = (getUnits u e i, getEnviro u e i, i ) 

-- add a unit to the list of units we are storing
addUnit :: Unit -> State -> State
addUnit u (u, e, i) = (u:getUnits u e i, getEnviro u e i, getInv u e i)


