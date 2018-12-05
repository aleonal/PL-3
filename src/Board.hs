import Data.List

-- ---------- CREATING A BOARD AND PLAYERS ----------

-- helper, builds list of length n
mkRow :: Int -> [Int]
mkRow 0 = []
mkRow n = 0 : mkRow(n - 1)

-- function that builds m x n list, effectively the connect 4 board
mkBoard :: Int -> Int -> [[Int]]
mkBoard 0 n = []
mkBoard m n = mkRow n : mkBoard (m - 1) n

-- sets integer representation of player and opponent
mkPlayer = 1
mkOpponent = 2

-- ---------- CHECKING A BOARD AND DROPING A DISC ----------

-- helper, checks if there is an open slot (denoted by a 0) in the given list
isColOpen :: [Int] -> Bool
isColOpen [] = False
isColOpen (x : xs) = if x == 0 then True else isColOpen xs

-- function that checks for an open slot in n-th column of the given m x n list
isSlotOpen :: [[Int]] -> Int -> Bool
isSlotOpen [] n = False
isSlotOpen (x : xs) 1 = isColOpen x
isSlotOpen (x : xs) n = isSlotOpen xs (n - 1)
