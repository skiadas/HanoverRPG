{-|
Module      : AI
Description : The AI module
Copyright   : (c) Brian Hayes,
                  Tyler Walker, 2017
License     : MIT
Maintainer  : sample@email.com

Here is a longer description of this module, containing some
commentary:
    This module is for the brains of all AI units within 
    the game, providing all AI units with actions and strategies
    for combating the UI units. This module is mostly internal. (Update at some point)

-}
module AI
(
    -- other modules
    module Unit,
    module Combat,
    -- ** A data type
    AI
    -- some functions

) where

-- Module starts here.

import Combat
import Unit

data AI = Unit -> Action 

main:: IO a
main = error "nothing now."
      --do
      -- all of the gets
      -- do stuff based on stats
      --return something