module Ex02 where

-- import Test.QuickCheck

-- The following line is required for the functions lowerWord and capitalizeFirstLetter below
import Data.Char

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
taxiDistance :: (Float, Float) -> (Float, Float) -> Float
-- PURPOSE [TODO]
-- Computing the the TaxiCab distance between two points.
-- EXAMPLES [TODO]
-- example_taxiDistance_1 = abs(2-1)+ abs(4-2) == 3
-- example_taxiDistance_2 = abs(3-1)+ abs(5-2) == 5
-- DEFINITION [TODO]
taxiDistance (x0, y0) (x1, y1) = abs(x1-x0)+abs(y1-y0)

-- TESTS [TODO]
prop_taxiDistance_nonnegativifity (x0, y0) (x1, y1) = abs(x1-x0)+abs(y1-y0) >= 0
prop_taxiDistance_orderdoesntmatter (x0, y0) (x1, y1) = abs(y1-y0)+ abs(x1-x0) == abs(x1-x0)+abs(y1-y0)

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iff :: Bool -> Bool -> Bool

-- PURPOSE [TODO]
-- The two-argument function iff returns True exactly when both Boolean operands have the same value. Otherwise it returns False. 
-- EXAMPLES [TODO]
-- example_iff_1 = True False == False
-- example_iff_2 = True True == True
-- DEFINITION [TODO]
iff = [iffC, iffG, iffP, iffB] !! 0
-- TESTS [TODO]
prop_iff_eq x y = (iff x y) == (x == y)

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iffC :: Bool -> Bool -> Bool

-- DEFINITION [TODO]
iffC x y = if x then(if y then True else False)
           else(if y then False else True)

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iffG :: Bool -> Bool -> Bool

-- DEFINITION [TODO]
iffG x y |  x && y = True 
iffG x y | not x && not y = True
iffG x y | otherwise = False

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iffP :: Bool -> Bool -> Bool

-- DEFINITION [TODO]
iffP True True = True
iffP True False = False
iffP False True = False
iffP False False = True

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iffB :: Bool -> Bool -> Bool

-- DEFINITION [TODO]
iffB x y = (not x && not y) || (x && y)

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
myTail :: [a] -> [a]

-- PURPOSE [TODO]
-- return tail and empty list
-- EXAMPLES [TODO]
-- example_myTail_01 = [] == 0
-- DEFINITION [TODO]
myTail = [myTailCond, myTailGuard, myTailMatch] !! 0

-- TESTS
prop_TailShrink :: String -> Bool
prop_TailShrink xs = length xs >= length (myTail xs :: String)
prop_TailEquivalent xs = cs == ms && cs == gs
  where cs = myTailCond xs :: [Int]
        ms = myTailMatch xs
        gs = myTailGuard xs

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
myTailCond :: [a] -> [a]

-- DEFINITION [TODO]
myTailCond xs  = if null xs then [] else tail xs
                 
--------------------------------------------------------------------------------
-- CONTRACT [TODO]
myTailGuard :: [a] -> [a]

-- DEFINITION [TODO]
myTailGuard xs  | null xs = []
myTailGuard xs  | otherwise = tail xs

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
myTailMatch :: [a] -> [a]

-- DEFINITION [TODO]
myTailMatch [] = [] 
myTailMatch (_:xs) = xs

--------------------------------------------------------------------------------
-- CONTRACT
lowerWord :: String -> String

-- PURPOSE [TODO]
-- Lower the Head and then lower the head of the tail till everything is lowered and its empty
-- EXAMPLES [TODO]
-- example_lowerWord_01 = lowerWord(F:UN) == "fun" 
-- example_lowerWord_02 = lowerWord(H:ASKELL) == "haskell" 
-- DEFINITION
lowerWord [] = []
lowerWord (x:xs) = toLower x : lowerWord xs

-- TESTS
prop_lowerWordIdempotent xs = lowerWord xs == lowerWord (lowerWord xs)
prop_lowerWordOrderPreserving xs = lowerWord xs == reverse (lowerWord (reverse xs))

--------------------------------------------------------------------------------
-- CONTRACT
capitalizeFirstLetter :: String -> String

-- PURPOSE [TODO]
-- capitalizes the next letter if the previous character was a space
-- EXAMPLES [TODO]
-- example_capitalizeFirstLetter_01 = capitalizeFirstLetter "haskell fun" == "Haskell Fun"
-- example_capitalizeFirstLetter_02 = capitalizeFirstLetter "letterif" == "Letterif"
-- DEFINITION
capitalizeFirstLetter xs = helper True xs
  where
    helper up [] = []
    helper up (x:xs) =
      (if up then toUpper x else x) : helper (isSpace x) xs

-- TESTS
prop_capitalizeFirstLetterIdempotent xs = capitalizeFirstLetter xs == capitalizeFirstLetter (capitalizeFirstLetter xs)

--------------------------------------------------------------------------------

-- CONTRACT [TODO]
f :: (Num a, Ord a) => a −> a
-- Dummy definition to avoid error message - please ignore
f = undefined
--------------------------------------------------------------------------------
