{-|
Module      : Inventory
Description : The Inventory module
Copyright   : (c) Jacob Hedrick, 2017
                  Chris Roe, 2017
License     : MIT
Maintainer  : sample@email.com

Here is a longer description of this module, containing some
commentary:
	This module creates and controls all items in the game. It will be used to create
	different classes of items (weapons, shields, armor, etc.), the different items
	in each class, and assign attrbutes to each of these items. We will also create and
	maintain the UI storage of items. This module is mainly opaque with many methods to 
	be used by other teams.

-}
module Inventory
(
    Storage, -- exporting the storage type
    Item, -- exporting the item type
    ItemType, --exporting the ItemType type
    storage, -- constructor for making a starting Storage
    numItems, -- returns the number of items in a storage object
    insertItem, -- inserts a new item into a storage object
    listStorage, -- list the Items in Storage by their names
    removeItem, -- removes the first occurance of a given Item in Storage
    getName, --returns the String name a given item
    getType, --returns the itemType a given item
    getHPEff, --returns the effect on HP of a given item
    getAttackEff, --returns the effect on Attack of a given item
    getDefEff, --returns the effect on Defense of a given item
    getSpeedEff, --returns the effect on speed of a given item
    getItem, --returns the attributes of a given Item
    findItem, -- given a storage and an item in returns a Maybe Item if the Item is in the storage
    sword, -- basic starting weapon of type Item
    shield, -- basic starting shield of type Item
    armour, -- basic starting armour of type Item
    bronzeSword, --weapon made of bronze
    silverSword, --weapon made of silver
    goldSword, --weapon made of gold
    bronzeShield, --shield made of bronze
    silverShield, --shield made of silver
    goldShield, --shield made of gold
    bronzeArmour, --armour made of bronze
    silverArmour, --armour made of silver
    goldArmour, --armour made of gold
    skiadasSword, --extremely powerful, magical weapon that increases all user attributes
    wiffleBat, -- useless weapon that could lead to drunken memories of fun and friendship
    catSuit, -- cat fur armour that gives the user to speed of Prof. Wilson's cats
    imageStacker, -- shield composed of C++ that disorients and confuses your oponant
    franksSpatula, -- weapon that seemless cuts through any enemy do to 25 years of burger grease

) where
-- Module starts here.
-- Definition for the Storage data type
-- A list of items in the units possession
-- List of all items that a unit can equip
data Storage = Stor [Item] 
-- Definition for the Item data type
-- An Item is a 6-tuple with values: (name, ItemType, HP, Attack, Defense, Speed)
type Item = (String, ItemType, Int, Int, Int, Int)
--Definition for the ItemType data type
--Has 3 values (Weapon, Shield, Armour) to describe what type an item is
data ItemType = Weapon|Shield|Armour deriving (Show)

--Pre-made items
sword = ("Sword", Weapon, 0, 2, 1, 0) :: Item
shield = ("Shield", Shield, 0, 1, 3, -1) :: Item
armour = ("Armour", Armour, 3, 0, 3, -2) :: Item
bronzeSword = ("Bronze Sword", Weapon, 0, 5, 1, 0) :: Item
silverSword = ("Silver Sword", Weapon, 0, 7, 2, -1) :: Item
goldSword = ("Gold Sword", Weapon, 0, 10, 2, -1) :: Item
bronzeShield = ("Bronze Shield", Shield, 0, 1, 4, -1) :: Item
silverShield = ("Silver Shield", Shield, 0, 2, 5, -1) :: Item
goldShield = ("Gold Shield", Shield, 0, 2, 7, -2) :: Item
bronzeArmour = ("Bronze Armour", Armour, 5, 0, 5, -3) :: Item
silverArmour = ("Silver Armour", Armour, 7, 0, 7, -3) :: Item
goldArmour = ("Gold Armour", Armour, 10, 0, 10, -4) :: Item
skiadasSword = ("Sword of Skiadas", Weapon, 2, 15, 5, 8) :: Item
wiffleBat = ("Wiffleball Bat", Weapon, -1, 0, 0, -5) :: Item
catSuit = ("Cat Suit", Armour, 5, 1, 5, 6) :: Item
imageStacker = ("Image Stacker", Shield, 0, 2, 8, 5) :: Item
franksSpatula = ("Franks Spatula", Weapon, 0, 10, 5, 0) :: Item

-- Create the starting inventory with basic sword, sheild, and armor
storage:: Storage
storage = Stor [sword, shield, armour]

-- Returns the number of items in the unit storage
numItems:: Storage -> Int
numItems (Stor []) = 0
numItems (Stor (x:xs)) = 1 + numItems (Stor (xs))

-- Inserts a new item into the storage list
-- Does nothing and returns a warning message if storage is full
insertItem:: Item -> Storage -> Storage
insertItem i (Stor stor1) = Stor newStorage
    where newStorage = stor1 ++ [i]

-- Returns a list of the names of the Items in your Storage
-- Items are unordered
listStorage:: Storage -> [String]
listStorage (Stor []) = []
listStorage (Stor ((name, _, _, _, _, _): xs)) = name : listStorage (Stor (xs))

-- Returns the name of a given item
--Return type: String
getName:: Item -> String
getName (name, _, _, _, _, _) = name

-- Returns the type of a given item
-- (Weapon, Shield, Armour)
getType:: Item -> ItemType
getType (_, iType, _, _, _, _) = iType

-- Returns the type of a given item
-- Returns the amount a item will effect HP
getHPEff:: Item -> Int
getHPEff (_, _, hp, _, _, _) = hp

-- Returns the type of a given item
-- Returns the amount a item will effect Attack
getAttackEff:: Item -> Int
getAttackEff (_, _, _, attack, _, _) = attack

-- Returns the type of a given item
-- Returns the amount a item will effect Defense
getDefEff:: Item -> Int
getDefEff (_, _, _, _, defense, _) = defense

-- Returns the type of a given item
-- Returns the amount a item will effect Speed
getSpeedEff:: Item -> Int
getSpeedEff (_, _, _, _, _, speed) = speed


-- Seaches for an item in the Storage and removes one copy of that item if it is found
-- If the item is not found the initial storage is returned
-- If found the initial storage minus the removed item
removeItem:: Item -> Storage -> Storage
removeItem _ (Stor []) = (Stor [])
removeItem i (Stor (x:xs)) | (getName x) == (getName i) = (Stor (xs))
                           | otherwise = insertItem x (removeItem i (Stor (xs)))

-- Returns the attribute of a given Item
-- Returns the attributes in tuple form
getItem::Item -> Item
getItem i = i

-- Searchs for and returns a certain item
--Will return a Maybe Item ("Nothing" if not found, "Just Item" if found)
findItem::Storage -> Item ->  Maybe Item
findItem (Stor []) _ = Nothing
findItem (Stor (x:xs)) i | (getName x) == (getName i) = Just x
                         | otherwise = findItem (Stor (xs)) i