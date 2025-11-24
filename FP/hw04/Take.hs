module Take where

--------------------------------------------------------------------------------
-- DEFINITION
lazyTake :: Int -> [a] -> [a]
lazyTake n _      | n <= 0 = []
lazyTake _ []              = []
lazyTake n (x:xs)          = x : lazyTake (n-1) xs
-- 3 (1:[2,3,4]) = 1 : lazyTake (2) [2,3,4]
-- 2 (2:[3,4])   = 1 : 2 : lazyTake (1) [3,4]
-- 1 (3:[4]) = 1 : 2 : 3 : lazyTake (0) [4]
-- since n <= 0 = []  so the final result = [1,2,3]

--------------------------------------------------------------------------------
-- DEFINITION
strictTake :: Int -> [a] -> [a]
strictTake n xs = helper [] n xs
  where
  helper result n _      | n <= 0 = result
  helper result _ []              = result
  helper result n (x:xs)          = helper (x:result) (n-1) xs
-- 3 (1:[2,3,4]) = helper [] (3) [1,2,3,4] 
-- 3 (1:[2,3,4]) = helper (1:[]) (2) [2,3,4] 
-- 2 (2:[3,4]) = helper (2:[1]) (1) [3,4] 
-- 1 (3:[4]) = helper (3:[2,1]) (0) [4] 
-- 0 (4:[]) = since n <= 0 = result meaning the answer is [3,2,1]
--------------------------------------------------------------------------------
