module Ex02 where

import Test.QuickCheck

-- The following line is required for the functions LowerWord and CapitalizeFirstLetter below
import Data.Char

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
taxiDistance :: (Float, Float) -> (Float, Float) -> Float
-- PURPOSE [TODO]
-- Computing the the TaxiCab distance between two points.
-- EXAMPLES [TODO]
example_taxiDistance_1 = abs(2-1)+ abs(4-2) == 3
example_taxiDistance_2 = abs(3-1)+ abs(5-2) == 5
-- DEFINITION [TODO]
taxiDistance (x0, y0) (x1, y1) = abs(x1-x0)+abs(y1-y0)

-- TESTS [TODO]
prop_taxiDistance_nonnegativifity (x0, y0) (x1, y1) = abs(x1-x0)+abs(y1-y0) >= 0
prop_taxiDistance_orderdoesntmatter (x0, y0) (x1, y1) = abs(y1-y0)+ abs(x1-x0) == abs(x1-x0)+abs(y1-y0)
prop_taxiDistance_orderdoesntmatter (x0, y0) (x1, y1) = abs(y1-y0)+ abs(x1-x0) == abs(x1-x0)+abs(y1-y0)
prop_taxiDistance_orderdoesntmatter (x0, y0) (x0, y0) = abs(y0-y0)- abs(x0-x0) == 0

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iff :: Bool -> Bool -> Bool

-- PURPOSE [TODO]
-- The two-argument function iff returns True exactly when both Boolean operands have the same value. Otherwise it returns False. 
-- EXAMPLES [TODO]
example_iff_1 = True False == False
example_iff_2 = True True == True
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
iffG x y
iffG  | x && y = True 
iffG | not x && not y = True
iffG  | otherwise = False

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
example_myTail_01 = [] == 0
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
myTailGuard xs 
myTailGuard | null xs = []
myTailGuard | otherwise = tail xs

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
myTailMatch :: [a] -> [a]

-- DEFINITION [TODO]
myTailMatch [] = [] 
myTailMatch (_:xs) = xs

--------------------------------------------------------------------------------
-- CONTRACT
LowerWord :: String -> String

-- PURPOSE [TODO]
-- Lower the Head and then lower the head of the tail till everything is lowered and its empty
-- EXAMPLES [TODO]
example_LowerWord_01 = LowerWord(F:UN) == "fun" 
example_LowerWord_02 = LowerWord(H:ASKELL) == "haskell" 
-- DEFINITION
LowerWord [] = []
LowerWord (x:xs) = toLower x : LowerWord xs

-- TESTS
prop_LowerWordIdempotent xs = LowerWord xs == LowerWord (LowerWord xs)
prop_LowerWordOrderPreserving xs = LowerWord xs == reverse (LowerWord (reverse xs))

--------------------------------------------------------------------------------
-- CONTRACT
CapitalizeFirstLetter :: String -> String

-- PURPOSE [TODO]
-- capitalizes the next letter if the previous character was a space
-- EXAMPLES [TODO]
example_CapitalizeFirstLetter_01 = CapitalizeFirstLetter "haskell fun" == "Haskell Fun"
example_CapitalizeFirstLetter_02 = CapitalizeFirstLetter "letterif" == "Letterif"
-- DEFINITION
CapitalizeFirstLetter xs = helper True xs
  where
    helper up [] = []
    helper up (x:xs) =
      (if up then toUpper x else x) : helper (isSpace x) xs

-- TESTS
prop_CapitalizeFirstLetterIdempotent xs = CapitalizeFirstLetter xs == CapitalizeFirstLetter (CapitalizeFirstLetter xs)

--------------------------------------------------------------------------------

-- CONTRACT [TODO]
f :: (Num a, Ord a) => a −> a
-- Dummy definition to avoid error message - please ignore
f = undefined
--------------------------------------------------------------------------------
