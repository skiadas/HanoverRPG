{-# LANGUAGE DeriveGeneric #-}
{-|
Module      : State
Description : The State module
Copyright   : (c) Jonathan Helmers, 2017
                  Hannah Mundt, 2017
License     : MIT
Maintainer  : mundth19@hanover.edu

This module collects all data and returns it to game.
It will use organizational data types to maintain 
data from other groups.
Maintains, updates and stores data from environment,
unit, and inventory.


-}




module State
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

import Data.Aeson
import Unit.hs
import Environment.hs
import Inventory.hs
import State.State
import GHC.Generics

-- Module starts here.

-- use JSON to read and write values from other files
-- makes it easier to store

data JSONUnit = JSONUnit {
    unit :: Unit (Username, Attributes, Equipment, Death, IsPlayer)
 } deriving (Generic, Show)

data JSONEnvironment = JSONEnvironment {
    weather :: Weather 
    location :: Location     
 } deriving (Generic, Show)

data JSONInventory = JSONInventory {
    equipment :: Equipment 
 } deriving (Generic, Show) 

data JSONState = JSONState {
    units :: [JSONUnit]
    environment :: JSONEnvironment
    inventory :: JSONInventory
 } deriving (Generic, Show)

-- change regular units, environment, and inventory to JSON

instance ToJSON JSONUnit where 
    toEncoding = genericToEncoding defaultOptions

instance FromJSON JSONUnit

instance ToJSON JSONEnvironment where
    toEncoding = genericToEncoding defaultOptions

instance FromJSON JSONEnvironment

instance ToJSON JSONInventory where
    toEncoding = genericToEncoding defaultOptions

instance FromJSON JSONInventory

instance ToJSON JSONState where
    toEncoding = genericToEncoding defaultOptions

instance FromJSON JSONState





