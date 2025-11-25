module Sudoku where

import Test.QuickCheck
import Data.Ord
import Data.List
import Debug.Trace


--------------------------------------------------------------------------------

-- Main method that shows the solutions for board
main :: IO ()
main = do
  quickCheck prop_applyAt_simple
  quickCheck prop_applyAt_nonId
  quickCheck prop_applyAt_asMap
  putStr $ concatMap showSudoku (solve board)
  
--------------------------------------------------------------------------------

-- Implementation of simple Sudoku solver.

--------------------------------------------------------------------------------

-- CONTRACT
showSudoku :: [Int] -> String

-- PURPOSE
-- Return a string nicely depicting a Sudoku playing field, where each
-- row of numbers is separated by a line-break, and each 3x3 block is
-- enclosed by horizontal and vertical borders.

-- EXAMPLES
-- showSudoku board :
--  "-------------------------\n" ++
--  "|   6   | 4 2   |       |\n" ++
--  "| 9 8 4 | 5     |       |\n" ++
--  "|       |   8 7 |   5   |\n" ++
--  "-------------------------\n" ++
--  "|   5   | 7     |     2 |\n" ++
--  "| 7   2 | 3     |     9 |\n" ++
--  "|   1   | 6     |     5 |\n" ++
--  "-------------------------\n" ++
--  "|       |   5   | 1 7   |\n" ++
--  "| 3 9 8 |       |     4 |\n" ++
--  "|   7   |       |   6 8 |\n" ++
--  "-------------------------\n"

-- DEFINITION
showSudoku xs = unlines (wrap 3 (replicate 25 '-') (applyToRows showRow xs))

--------------------------------------------------------------------------------

-- CONTRACT
showRow :: [Int] -> String

-- PURPOSE
-- Return a string depicting one row of a Soduko playing field, where
-- every group of three numbers is surrounded by vertical bars, and
-- every number is surrounded by a spaces.

-- EXAMPLES
example_showRow_1 = showRow [1..9] == "| 1 2 3 | 4 5 6 | 7 8 9 |"

-- DEFINITION
showRow xs = concat (wrap 1 "|" (map showGroup (stride 3 xs)))

--------------------------------------------------------------------------------

-- CONTRACT
showGroup :: [Int] -> String

-- PURPOSE
-- Return a string depicting a group of consequetive numbers with spaces in between.
-- Zeroes in the input correspond to unknowns, and are rendered as spaces.

-- EXAMPLES
example_showGroup_1 = showGroup [1,5,7] == " 1 5 7 "
example_showGroup_2 = showGroup [2,0,1] == " 2   1 "

-- DEFINITION
showGroup xs = wrap 1 ' ' [" 123456789" !! x | x <- xs]

--------------------------------------------------------------------------------

-- CONTRACT
wrap :: Int -> a -> [a] -> [a]

-- PURPOSE
-- Insert `x` at every `n`th position in the list `xs`.

-- EXAMPLES
example_wrap_1 = wrap 1 '+' "a" == "+a+"
example_wrap_2 = wrap 2 '+' "a" == "+a"
example_wrap_3 = wrap 2 '+' "abcd" == "+ab+cd+"

-- DEFINITION
wrap n x xs = insertAfter 0 xs
  where
    insertAfter 0 xs = x : insertAfter n xs
    insertAfter n [] = []
    insertAfter n (y:ys) = y : insertAfter (n-1) ys

--------------------------------------------------------------------------------

-- CONTRACT
stride :: Int -> [a] -> [[a]]

-- PURPOSE
-- Divide the list `xs` into ranges of size `n`.

-- EXAMPLES
example_stride_1 = stride 1 "abc" == ["a", "b", "c"]
example_stride_2 = stride 2 "abc" == ["ab", "c"]
example_stride_3 = stride 6 "abc" == ["abc"]

-- DEFINITION
stride _ [] = []
stride n xs = take n xs : stride n (drop n xs)

--------------------------------------------------------------------------------

-- Example Sudoku playfields
board :: [Int]
board = [
  0,6,0, 4,2,0, 0,0,0,
  9,8,4, 5,0,0, 0,0,0,
  0,0,0, 0,8,7, 0,5,0,

  0,5,0, 7,0,0, 0,0,2,
  7,0,2, 3,0,0, 0,0,9,
  0,1,0, 6,0,0, 0,0,5,

  0,0,0, 0,5,0, 1,7,0,
  0,9,8, 0,0,0, 0,0,0,
  0,7,0, 0,0,0, 0,6,8]

board2 :: [Int]
board2 = [
  0,0,0, 0,0,0, 0,0,0,
  0,0,0, 0,0,3, 0,8,5,
  0,0,1, 0,2,0, 0,0,0,

  0,0,0, 5,0,7, 0,0,0,
  0,0,4, 0,0,0, 1,0,0,
  0,9,0, 0,0,0, 0,0,0,

  5,0,0, 0,0,0, 0,7,3,
  0,0,2, 0,1,0, 0,0,0,
  0,0,0, 0,4,0, 0,0,9]

--------------------------------------------------------------------------------

-- CONTRACT
mapBlocks :: ([a] -> b) -> [a] -> [b]

-- PURPOSE
--  Apply the given function to each block of the Sudoku board.

-- EXAMPLES
example_mapBlocks_1 = mapBlocks length board == replicate 9 9
example_mapBlocks_2 = mapBlocks sum board == [27,15,24,26,16,5,5,16,22]

-- DEFINITION
mapBlocks f = map f . map concat . stride 3 . concat . transpose . stride 3 . stride 3

--------------------------------------------------------------------------------

-- CONTRACT
updateGroups :: ([a] -> [a]) -> [a] -> [a]

-- PURPOSE
--  Apply the mutating function to first each row, and then to each
--  column, and ultimately, to each 3x3 block. The specified function
--  must not change the length of its argument.

-- EXAMPLES
example_updateGroups_1 = updateGroups reverse (updateGroups reverse board) == board

-- DEFINITION
updateGroups f = unblock . mapBlocks f . concat . transpose . map f . transpose . applyToRows f
  where
    unblock = concat . concat . transpose . stride 9 . stride 3 . concat

-- TESTS
prop_updatedGroups_qqId = updateGroups id [1..81] == [1..81]

--------------------------------------------------------------------------------

-- CONTRACT
increments :: [Int] -> [Int]

-- PURPOSE
--  Convert a list of numbers into the individual increments.
--  That is, the pairwise difference between the numbers.

-- EXAMPLES
example_increments_1 = increments [] == []
example_increments_2 = increments [1..3] == [1,1]

-- DEFINITION
increments xs = map (uncurry (-)) (zip (drop 1 xs) xs)

-- TESTS
prop_increments_sum xs = (length xs > 2) ==> sum (increments xs) == last xs - (xs !! 0)

--------------------------------------------------------------------------------

-- CONTRACT
varStride :: [Int] -> [a] -> [[a]]

-- PURPOSE
--  Split the sequence into subsequences of the specified lengths.
--  The result will have at least as many subsequences as there are
--  lengths. If not all elements are used up, the remaing elements
--  are added to the end of the list. If there are too few elements
--  the last subsequences will be too short.

-- EXAMPLES
example_varStride_1 = varStride [1,2] [1,2,3] == [[1],[2,3]]
example_varStride_2 = varStride [1] [1,2,3] == [[1],[2,3]]
example_varStride_3 = varStride [10] [1,2] == [[1,2]]

-- DEFINITION
varStride    []  [] = []
varStride    []  xs = [xs]
varStride (l:ls) xs = take l xs : varStride ls (drop l xs)

-- TESTS
prop_varStride_noLoss ls xs = concat (varStride (map abs ls) xs) == xs
  where types = (xs :: [Int])
prop_varStride_atLeast ls xs = length (varStride (map abs ls) xs) >= length ls
  where types = (xs :: [Int])

--------------------------------------------------------------------------------

-- CONTRACT
solve :: [Int] -> [[Int]]

-- PURPOSE
--  Determine a solution for the specified Sudoku puzzle.
--  Compared to solutions this generates at most one solution,
--  and takes its input (and its output) in simple form

-- EXAMPLES
-- example_solve_1 = solve board == [...solution...]

-- DEFINITION
solve = take 1 . map (map (!! 0)) . solutions . toSolving

-- TESTS
prop_solve_matches = and [x `elem` [0,y] | (x,y) <- zip board ((solve board) !! 0)]

--------------------------------------------------------------------------------

-- CONTRACT
toSolving :: [Int] -> [[Int]]

-- PURPOSE
--  Prepare the simple Sudoku board format for using in solutions.

-- EXAMPLES
example_toSolving_1 = toSolving [1] == [[1]]
example_toSolving_2 = toSolving [0] == [[1..9]]

-- DEFINITION
toSolving = map (\x -> if x == 0 then [1..9] else [x])

-- TESTS
prop_toSolving_zero = toSolving [0] == [[1..9]]
prop_toSolving_one = toSolving [1] == [[1]]

--------------------------------------------------------------------------------

-- CONTRACT
solutions :: [[Int]] -> [[[Int]]]

-- PURPOSE
--  Generate all solutions to the Sudoku puzzle specified in solving form.

-- EXAMPLES
example_solutions_1 = length (solutions (toSolving board)) == 3

-- DEFINITION
solutions xs =
  let ys = fixp (updateGroups simplify) xs in
  case maximumBy (comparing (length . snd)) (zip [0..] ys) of
    (_, []) -> []
    (_, [_]) -> if any null (updateGroups check ys) then [] else [ys]
    (i, cs)  -> concat [solutions (applyAt (const [c]) [i] ys) | c <- cs]
  where
    check xss = if [x | [x] <- xss] \\ [1..9] /= [] then map (const []) xss else xss


-- TESTS
prop_solutions_board = length (solutions (toSolving board)) == 3

--------------------------------------------------------------------------------

-- CONTRACT
simplify :: [[Int]] -> [[Int]]

-- PURPOSE
--  Pass through a group of numbers, and reduce the number
--  of marked possibilities. If we can find n boxes in a
--  group which is limited to no more than n possible values,
--  we remove these values from remaining cells.
--  For performance reasons, the method assumes that the
--  individual inputs are sorted

-- EXAMPLES
example_simplify_1 = simplify [[1]] == [[1]]
example_simplify_2 = simplify [[1],[2],[1,2,3]] == [[1],[2],[3]]
example_simplify_3 = simplify [[1,2,3],[1,3],[1,2],[1,2,3,4]] == [[1,2,3],[1,3],[1,2],[4]]

-- DEFINITION
simplify xss = foldl helper xss (nub xss)
  where
    helper xss search =
      let
        (matches, others) = partition ((`isSubset` search) . snd) (zip [0..] xss)
      in
      if search /= [] && length search /= 9 && length search == length matches
        then applyAt (\\search) (map fst others) xss
        else xss

-- TESTS
prop_simplify_keep xss = nub (concat yss) == nub (concat (simplify yss))
  where yss = map sort xss
prop_simplify_simpler xss = and [any (xs `isSubset`) yss | xs <- simplify yss]
  where yss = map sort xss

--------------------------------------------------------------------------------

-- CONTRACT
showSolving :: [[Int]] -> String

-- PURPOSE
--  Display the state of a Sudoku puzzle in solving format.
--  Each individual box is displayed using 3x3 characters, and
--  the character is present if this number is still considered
--  an option for this position.

-- EXAMPLES
-- example_showSolving_1 = putStr showSolving [...] ==
--  -------------------------------------
--  |1  | 2 |  3|   |   |   |   |   |   |
--  |   |   |   |4  | 5 |  6|   |   |   |
--  |   |   |   |   |   |   |7  | 8 |  9|
--  -------------------------------------
--  ....continues for eight more rows....

-- DEFINITION
showSolving = unlines . wrap 3 hline . map showCompactRow . shuffle . stride 9
  where
    shuffle = concatMap (transpose . map (stride 3 . candidates))
    showCompactRow = concat . wrap 1 "|"
    hline = replicate 37 '-'

-- TESTS
prop_showSolving_length xs = length (showSolving (toSolving ys)) == 1406
  where ys = take 81 (cycle (map (flip mod 10.abs) (0:xs)))

--------------------------------------------------------------------------------

-- CONTRACT
candidates :: [Int] -> String

-- PURPOSE
--  Get a string representation of the presence of the numbers
--  1..9 in the candidate array. The resulting string is 9
--  characters where the n:th character should be n if n is
--  amongst the arguments, and ' ' otherwise. The function
--  assumes that the numbers are ordered, unique, and that
--  they are not more than 9.

-- EXAMPLES
example_candidates_1 = candidates [1..9] == "123456789"
example_candidates_2 = candidates [7] == "      7  "

-- DEFINITION
candidates xs = helper 1 xs
  where
    helper n []     = replicate (10-n) ' '
    helper n (x:xs) = replicate (x-n) ' ' ++ show x ++ helper (x+1) xs

-- TESTS
prop_candidates_length xs = length (candidates (sort (nub (take 9 (map (succ.flip mod 9.abs) xs))))) == 9

--------------------------------------------------------------------------------
--------------------------- EXERCISE TASK FUNCTIONS ---------------------------

-- CONTRACT [TODO]
applyToRows :: ([a] -> b) -> [a] -> [b]

-- PURPOSE
--  Apply the given function to each row of the Sudoku board.

-- EXAMPLES [TODO] (at least 3 examples; use 'applyToRows' here)
example_applyToRows_1 = applyToRows sum [1,2,3] == [6]
example_applyToRows_2 = applyToRows length [1,2,3] == [3]
example_applyToRows_3 = applyToRows head [1,2,3] == [1]

-- DEFINITION [TODO]
applyToRows = applyToRowsListComp

-- TESTS [TODO] (at least 1 test; use 'applyToRows' here)

prop_applyToRows_nine_rows xs = 
  length (applyToRows id (take 81 xs)) == 9
  where types = (xs :: [Int])

--------------------------------------------------------------------------------

-- CONTRACT [TODO]
applyToRowsListComp :: ([a] -> b) -> [a] -> [b]

-- DEFINITION [TODO]
applyToRowsListComp f xs = [f x | x <- stride 9 xs]

--------------------------------------------------------------------------------

-- CONTRACT [TODO]
applyToRowsMap :: ([a] -> b) -> [a] -> [b]

-- DEFINITION [TODO]
applyToRowsMap f xs = map f (stride 9 xs)

--------------------------------------------------------------------------------

-- CONTRACT [TODO]
applyToRowsMapFuncComp :: ([a] -> b) -> [a] -> [b]

-- DEFINITION [TODO]
applyToRowsMapFuncComp f xs = (map f . stride 9) xs

--------------------------------------------------------------------------------

-- CONTRACT
fixp :: Eq a => (a -> a) -> a -> a

-- PURPOSE [TODO]
--  Important: Calculates the attractive fixed point of a function.

-- EXAMPLES [TODO] (at least 3 examples)
example_fixp_1 = fixp (\x -> x `div` 4 + 1) 10 == 1
example_fixp_2 = fixp (\x -> if x > 0 then x - 1 else 0) 5 == 0  
example_fixp_3 = fixp (\x -> if x == 0 then 0 else x + 1) 0 == 0  
-- DEFINITION [TODO: Implement fixp, replace "fixp f x = f x" with your solution "fixp f x = ....."]
fixp f x = if(fx == x) then x else fixp f(fx) where fx = f x

-- TESTS [TODO] (Simple tests are enough, at least 1 test)
prop_fixp_id = fixp id 5 == 5

--------------------------------------------------------------------------------

-- CONTRACT [TODO]
isSubset :: Eq a => [a] -> [a] -> Bool

-- PURPOSE [TODO]
--  Important: describe in own words
-- Function compares two sets and looks at whether [a] is a subset of [b] meaning that all of the elements in [a] are in [b].
-- Purpose of the original function is almost the same except that it checks whether the current head is in ys if not then it depends on whether x is bigger or less.
-- The resaon for that is because it takes advantage of the fact that it is sorted meaning since if x is bigger than y it thinks ah the current head x is maybe somewhere later in ys so it skips the y head.
-- EXAMPLES [TODO] (at least 3 examples)
example_isSubset_1 = [1,2] `isSubset` [1] == False
example_isSubset_2 = [1,2] `isSubset` [1,2,3] == True
example_isSubset_3 = [] `isSubset` [1] == True
-- DEFINITION [TODO: Use higher-order functions, replace "xs `isSubset` ys = xs `isSubsetOriginal` ys" with
--                      your solution "xs `isSubset` ys = ....."]

xs `isSubset` ys = all (\x -> (x) `elem` ys) xs

-- TESTS [TODO] (at least 1 test)
prop_isSubset_empty xs ys = [] `isSubset` ys == True

[] `isSubsetOriginal` _ = True
_ `isSubsetOriginal` [] = False
(x:xs) `isSubsetOriginal` (y:ys)
  | x < y  = False
  | x == y = xs `isSubsetOriginal` ys
  | x > y  = (x:xs) `isSubsetOriginal` ys

--------------------------------------------------------------------------------

-- CONTRACT
applyAt, applyAtOriginal :: (a -> a) -> [Int] -> [a] -> [a]

-- PURPOSE
--  Apply the function in the first argument to
--  the elements of its third argument. However, only apply
--  to the indices specified in the second argument. Each
--  entry in the list of indices is assumed to be unique
--  and in increasing order.

-- EXAMPLES
example_applyAt_1 = applyAt (*2) [] [1,2,3] == [1,2,3]
example_applyAt_2 = applyAt (*2) [0,3] [1,2,3,4] == [2,2,3,8]

-- DEFINITION [TODO: Use higher order functions, replace "applyAt f is xs = applyAtOriginal f is xs" with your solution "applyAt f is xs = ....."]
applyAt f is xs = zipWith (\y x  -> if(y `elem` is) then f x else x) [0..] xs

applyAtOriginal f is xs = helper 0 is xs
  where
    helper _ [] xs = xs
    helper c (i:is) (x:xs)
      | c < i     =   x : helper (c+1) (i:is) xs
      | otherwise = f x : helper (c+1)    is  xs

-- TESTS
prop_applyAt_simple = applyAt (*2) [1,3] [1,2,3,3,4] == [1,4,3,6,4]
prop_applyAt_nonId xs = applyAt (*2) [] xs == xs
  where types = xs :: [Int]
prop_applyAt_asMap xs = applyAt (*2) [0..length xs-1] xs == map (*2) xs
  where types = xs :: [Int]
prop_applyAt_equivalent is x xs = applyAt (*2) is' xs' == applyAtOriginal (*2) is' xs'
  where
    is' = nub (sort [i `mod` length xs' | i <- is])
    xs' = x:xs :: [Int]
