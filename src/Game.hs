{-|
Module      : Game
Description : The Game module
Copyright   : (c) William Cole Vanderpohl, 2017
                  Sakib Haque, 2017
License     : MIT
Maintainer  : haques18@hanover.edu

Here is a longer description of this module, containing some
commentary with @some markup@:
	This module is the main game module that combines the other files
	and triggers the main function that kicks-off the game.

	Start at the entrance of the scenic. Car broke down. Walking along Scenic.
	I meet a student who explains the situation (Faculty holding the President hostage).
	Afterwards, a faculty member attacks us. Faculty kills the student.
	Faculty tries to kill me but I manage to defeat him/her.
	(Faculty member attack will be a tutorial to learn how to fight in the game)

	To save the President, I need to acquire the sword of thousand truths.
	The sword is rumored to be in the library.

	Checkpoint1: I go to the library. I defeat the circ desk student worker, and reference librarians.
				 I go to the top floor of the library and find a part of the sword of a thousand truths
				 hidden in men's urinal. I also find a puzzle in one of the books.
				 The puzzle leads to CFA, Science Hall and cc.
				 CC is the main next checkpoint. Going to CFA or SH will lead to side quests.

	Checkpoint2: I need to go to the cc. I have to defeat the sodexo workers.
				 Toby Huling (also kown as the Soup Nazi) knows where the second piece of the sword is.
				 He needs to be defeated in order to get the keys to the bookstore, where the piece is hidden.
				 His last words are, "I do price mathcing!"
				 In the bookstore, I find the piece and inside a $98.95 price marked book, I find the next puzzle
				 The puzzle leads to Science Center, Hendricks and Parker.
				 Parker is the main checkpoint and Science Center and Hendricks lead to side quests.

	Checkpoint3: I need to go to the Parker. Here I meet the ghost of Parker.
				 If I can defeat him in a 1-on-1 fight, he will tell us where the last piece is hidden.
				 The last piece is the minute hand of the clock in parker.
				 I get up to the clock tower and collect it.

	Checkpoint4: I need to go to the point and fight the main bad guy (Hans Gruber) and save the President.
				 I use the sword of thousand truths to fight Hans who has his Morgul blade.
				 I defeat Hans in the sword fight.

	We free the President and get free tuition for a semester only.
-}

-- ==========================================================================================================
-- We honestly don't think that we need all these imports, but we're importing them right now
-- Since no other group seems to have imported any other group's modules
-- Once the final version of all group modules are ready, we can go ahead and remove the redundant ones.

module Game
(
  playMain

) where

import Combat
import UI
import Unit

makeHero:: String -> IO Unit
makeHero str = do
	return (createUnit str 100 10 10 10 True)

makeAllEnemies:: [Unit]
makeAllEnemies = [createUnit "Simon Gruber" 100 10 10 10 False,
						createUnit "Soup Nazi" 100 10 10 10 False,
						createUnit "Karl Vreski" 100 10 10 10 False,
						createUnit "Hans Gruber" 100 10 10 10 False]

-- makeEnemy:: IO Unit
-- makeEnemy = do
-- 	return (createUnit "Hans Gruber" 100 10 10 10 False)


playMain:: IO()
playMain = do
	-- call blank game to generate initial game state
	-- ask for userName from UI to make hero
	userName <- promptUserName
	hero <- makeHero userName
	-- enemy <- makeEnemy
	let enemyList = makeAllEnemies
	-- playOneEnemy hero enemy
	play hero enemyList



-- playOneEnemy:: Unit -> Unit -> IO()
-- play hero enemy state = do
-- 	if getHealth hero == 0 then putStrLn "Game Over" else
-- 		do updatedPlayers <- doBattle hero enemy
-- 		if getHealth fst(updatedPlayers) == 0 then putStrLn "You Lost!" else putStrLn "You Won!"


play:: Unit -> [Unit] -> IO()
play hero [] = do
	displayEvent WinGame
play hero (enemy:rest) = do
	updatedPlayers <- doBattle hero enemy
	if getHealth fst(updatedPlayers) == 0 then displayEvent Lose else
		do if rest /= [] then do
			displayEvent Win
		play fst(updatedPlayers) rest

