module Ex02 where

import Test.QuickCheck

-- The following line is required for the functions foo and bar below
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
prop_taxiDistance_alwaysgreaterthanorequal (x0, y0) (x1, y1) = abs(x1-x0)+abs(y1-y0) >= 0
prop_taxiDistance_orderdoesntmatter (x0, y0) (x1, y1) = abs(y1-y0)+ abs(x1-x0) == abs(x1-x0)+abs(y1-y0)

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iff :: Bool -> Bool -> Bool
iffC :: Bool -> Bool -> Bool

-- PURPOSE [TODO]
-- The two-argument function iff returns True exactly when both Boolean operands have the same value. Otherwise it returns False. 
-- EXAMPLES [TODO]
example_iff_1 = True False == False
example_iff_2 = True True == True
-- DEFINITION [TODO]
iff = [iffC, iffG, iffP, iffB] !! 0
iffC a b = if a then(if b then True else False)
           else(if b then False else True)
-- TESTS [TODO]
prop_iff_eq x y = undefined

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iffC :: Bool -> Bool -> Bool

-- DEFINITION [TODO]
iffC x y = undefined

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iffG :: Bool -> Bool -> Bool

-- DEFINITION [TODO]
iffG x y = undefined

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iffP :: Bool -> Bool -> Bool

-- DEFINITION [TODO]
iffP x y = undefined

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
iffB :: Bool -> Bool -> Bool

-- DEFINITION [TODO]
iffB x y = undefined

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
-- myTail :: ??

-- PURPOSE [TODO]

-- EXAMPLES [TODO]

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
-- myTailCond :: ??

-- DEFINITION [TODO]
myTailCond xs  = undefined

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
-- myTailGuard :: ??

-- DEFINITION [TODO]
myTailGuard xs  = undefined

--------------------------------------------------------------------------------
-- CONTRACT [TODO]
-- myTailMatch :: ??

-- DEFINITION [TODO]
myTailMatch xs  = undefined

--------------------------------------------------------------------------------
-- CONTRACT
foo :: String -> String

-- PURPOSE [TODO]

-- EXAMPLES [TODO]

-- DEFINITION
foo [] = []
foo (x:xs) = toLower x : foo xs

-- TESTS
prop_fooIdempotent xs = foo xs == foo (foo xs)
prop_fooOrderPreserving xs = foo xs == reverse (foo (reverse xs))

--------------------------------------------------------------------------------
-- CONTRACT
bar :: String -> String

-- PURPOSE [TODO]

-- EXAMPLES [TODO]

-- DEFINITION
bar xs = helper True xs
  where
    helper up [] = []
    helper up (x:xs) =
      (if up then toUpper x else x) : helper (isSpace x) xs

-- TESTS
prop_barIdempotent xs = bar xs == bar (bar xs)

--------------------------------------------------------------------------------

-- CONTRACT [TODO]
-- f ::
-- Dummy definition to avoid error message - please ignore
f = undefined
--------------------------------------------------------------------------------
