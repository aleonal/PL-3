import Data.List

-- ---------- CREATING A BOARD AND PLAYERS ----------

-- helper, builds list of length n, effectively a connect 4 column
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

-- helper, checks if there is an open slot (denoted by a 0) in the given column
isColOpen :: [Int] -> Bool
isColOpen [] = False
isColOpen (x : xs) = if x == 0 then True else isColOpen xs

-- helper, drops player's checker in given column
dropInCol :: [Int] -> Int -> [Int]
dropInCol [] p = []
dropInCol (x : xs) p = if last (x : xs) == 0 then
  reverse (p : reverse (init (x : xs))) else
  reverse (last (x : xs) : reverse (dropInCol (init (x : xs)) p))

-- function that checks for an open slot in n-th column of the given board
isSlotOpen :: [[Int]] -> Int -> Bool
isSlotOpen (x : xs) i = isColOpen ((x : xs) !! (i - 1))

-- function that returns the number of columns in the given board
numSlot :: [[Int]] -> Int
numSlot [] = 0
numSlot (x : xs) = 1 + numSlot xs

-- function that determines whether the given board is full or not
isFull :: [[Int]] -> Bool
isFull [] = False
isFull (x : xs) =  not (isColOpen x) && isFull xs

-- function that drops a player p's disc in a slot.
dropInSlot :: [[Int]] -> Int -> Int -> [[Int]]
dropInSlot [] i p = []
dropInSlot (x : xs) i p = if isSlotOpen (x : xs) i then
  reverse(dropInCol ((x : xs) !! (i - 1)) p : reverse (take (i - 1) (x : xs)))
   ++ drop i (x : xs) else ([] : xs)

-- ---------- DETERMINING THE OUTCOME ----------
