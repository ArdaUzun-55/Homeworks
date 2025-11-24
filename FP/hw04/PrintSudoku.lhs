> module PrintSudoku where

An example Sudoku playing field

> board :: [Int]
> board = [
>   0, 6, 0,  4, 2, 0,  0, 0, 0,
>   9, 8, 4,  5, 0, 0,  0, 0, 0,
>   0, 0, 0,  0, 8, 7,  0, 5, 0,

>   0, 5, 0,  7, 0, 0,  0, 0, 2,
>   7, 0, 2,  3, 0, 0,  0, 0, 9,
>   0, 1, 0,  6, 0, 0,  0, 0, 5,

>   0, 0, 0,  0, 5, 0,  1, 7, 0,
>   3, 9, 8,  0, 0, 0,  0, 0, 4,
>   0, 7, 0,  0, 0, 0,  0, 6, 8]

Allows running as an application, but can also be used to test in GHCi

> main :: IO ()
> main = putStr (showSudoku board)

--------------------------------------------------------------------------------

CONTRACT

> showSudoku :: [Int] -> String

PURPOSE

Return a string nicely depicting a Sudoku playing field, where each
row of numbers is separated by a line-break, and each 3x3 block is
enclosed by horizontal and vertical borders.

EXAMPLES

> example_showSudoku_1 = showSudoku board ==
>   "-------------------------\n" ++
>   "|   6   | 4 2   |       |\n" ++
>   "| 9 8 4 | 5     |       |\n" ++
>   "|       |   8 7 |   5   |\n" ++
>   "-------------------------\n" ++
>   "|   5   | 7     |     2 |\n" ++
>   "| 7   2 | 3     |     9 |\n" ++
>   "|   1   | 6     |     5 |\n" ++
>   "-------------------------\n" ++
>   "|       |   5   | 1 7   |\n" ++
>   "| 3 9 8 |       |     4 |\n" ++
>   "|   7   |       |   6 8 |\n" ++
>   "-------------------------\n"

DEFINITION

> showSudoku xs = unlines (wrap 3 (replicate 25 '-') [showRow r | r <- stride 9 xs])

--------------------------------------------------------------------------------

CONTRACT

> showRow :: [Int] -> String

PURPOSE

Return a string depicting one row of a Soduko playing field, where
every group of three numbers is surrounded by vertical bars, and
every number is surrounded by a spaces.

EXAMPLES

> example_showRow_1 = showRow [1..9] == "| 1 2 3 | 4 5 6 | 7 8 9 |"

DEFINITION

> showRow xs = concat (wrap 1 "|" [showGroup t | t <- stride 3 xs])

--------------------------------------------------------------------------------

CONTRACT

> showGroup :: [Int] -> String

PURPOSE

Return a string depicting a group of consequetive numbers with spaces in between.
Zeroes in the input correspond to unknowns, and are rendered as spaces.

EXAMPLES

> example_showGroup_1 = showGroup [1,5,7] == " 1 5 7 "
> example_showGroup_2 = showGroup [2,0,1] == " 2   1 "

DEFINITION

> showGroup xs = wrap 1 ' ' [" 123456789" !! x | x <- xs]

--------------------------------------------------------------------------------

CONTRACT

> stride :: Int -> [a] -> [[a]]

PURPOSE

Divide the list `xs` into ranges of size `n`.

EXAMPLES

> example_stride_1 = stride 1 "abc" == ["a", "b", "c"]
> example_stride_2 = stride 2 "abc" == ["ab", "c"]
> example_stride_3 = stride 6 "abc" == ["abc"]

DEFINITION

> stride _ [] = []
> stride n xs = take n xs : stride n (drop n xs)

--------------------------------------------------------------------------------

CONTRACT

> wrap :: Int -> a -> [a] -> [a]

PURPOSE

Insert `x` at every `n`th position in the list `xs`.

EXAMPLES

> example_wrap_1 = wrap 1 '+' "a" == "+a+"
> example_wrap_2 = wrap 2 '+' "a" == "+a"
> example_wrap_3 = wrap 2 '+' "abcd" == "+ab+cd+"

DEFINITION

> wrap n x xs = insertAfter 0 xs
>   where
>     insertAfter n [] = if n == 0 then [x] else []
>     insertAfter 0 (xs:xss) = x:xs:insertAfter (n-1) xss
>     insertAfter n (xs:xss) = xs:insertAfter (n-1) xss

--------------------------------------------------------------------------------