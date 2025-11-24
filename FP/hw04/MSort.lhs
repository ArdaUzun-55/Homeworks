> module MSort where

--------------------------------------------------------------------------------
CONTRACT

> msort :: [Int] -> [Int]

PURPOSE
  Takes a list of integer and returns its elements in ascending order
  if the list is non-empty, the empty list otherwise.

EXAMPLES

> example_msort_1 = msort [2,5,4,3] == [2,3,4,5]

DEFINITION

> msort []  = []
> msort [x] = [x]
> msort xs  = merge (msort ys) (msort zs)
>     where (ys,zs) = splitAt (length xs `div` 2) xs

--------------------------------------------------------------------------------
CONTRACT

> merge :: Ord a => [a] -> [a] -> [a]

PURPOSE
merges two lists into one list.

EXAMPLES

> example_merge_1 = merge ([1,2]) ([3,4]) == [1,2,3,4]
> example_merge_2 = merge ([2,1]) ([4,3]) == [2,1,4,3]
> example_merge_3 = merge ([2,1]) [] == [2,1]

DEFINITION

> merge [] [] = []
> merge xs [] = xs
> merge [] ys = ys 
> merge (x:xs) (y:ys)| x <= y    = x : merge xs (y:ys)
> merge (x:xs) (y:ys)| otherwise = y : merge (x:xs) ys

TESTS

> prop_merge_lengthsame xs ys = length (merge xs ys) == length xs + length ys
