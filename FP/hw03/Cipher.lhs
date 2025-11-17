
> {-# LANGUAGE TemplateHaskell #-}

Caeser cipher example from section 5.5 of Programming in Haskell,
Graham Hutton, Cambridge University Press, 2007.
TUHH modifications
    - Added module declaration
    - Added decode, and crackKey functions
    - Reimplemented crack using decode and crackKey
    - Ignore international lowercase characters
      (use isAsciiLower instead of isLower)

> module Cipher where

> import Data.Char
> import Test.QuickCheck
> import GHC.Float ()

Encoding and decoding
---------------------

--------------------------------------------------------------------------------

> let2int                       :: Char -> Int
> let2int c                     =  ord c - ord 'a'

--------------------------------------------------------------------------------

> int2let                       :: Int -> Char
> int2let n                     =  chr (ord 'a' + n)

--------------------------------------------------------------------------------

> shift                         :: Int -> Char -> Char
> shift n c | isAsciiLower c    =  int2let ((let2int c + n) `mod` 26)
>           | isAsciiUpper c      =  int2letA ((let2intA c + n) `mod` 26)
>           | otherwise      =  c

--------------------------------------------------------------------------------

> let2intA                       :: Char -> Int
> let2intA c                     =  ord c - ord 'A'

--------------------------------------------------------------------------------

> int2letA                       :: Int -> Char
> int2letA n                     =  chr (ord 'A' + n)

--------------------------------------------------------------------------------

DEFINITION

> encode                        :: Int -> String -> String
> encode n xs                   =  [shift n x | x <- xs]

--------------------------------------------------------------------------------

DEFINITION

> decode                        :: Int -> String -> String
> decode n xs                   =  encode (-n) xs

--------------------------------------------------------------------------------

Frequency analysis
------------------

--------------------------------------------------------------------------------

> table                         :: [Float]
> table                         =  [8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0,
>                                   6.1, 7.0, 0.2, 0.8,  4.0, 2.4, 6.7,
>                                   7.5, 1.9, 0.1, 6.0,  6.3, 9.1, 2.8,
>                                   1.0, 2.4, 0.2, 2.0,  0.1]

--------------------------------------------------------------------------------

PURPOSE [TODO]
The Purpose of this function is to return the length of the number of not capitalized letters in the String.
EXAMPLES (at least 1 example) [TODO]

> example_lowers_1 = lowers "Arda" == 3 

DEFINITION

> lowers                        :: String -> Int
> lowers xs                     =  length [x | x <- xs, isAsciiLower x]

--------------------------------------------------------------------------------

PURPOSE [TODO]
The purpose of this function is to count how many times the given character is in the String.
EXAMPLES (at least 1 example) [TODO]

> example_count_1 = count 'a' "arda" == 2

DEFINITION

> count                         :: Char -> String -> Int
> count x xs                    =  length [x' | x' <- xs, x == x']

--------------------------------------------------------------------------------

> percent                       :: Int -> Int -> Float
> percent n m                   =  (fromIntegral n / fromIntegral m) * 100

--------------------------------------------------------------------------------

PURPOSE [TODO]
returns a list of percentages of how many times each letter is used uppercase letters are not counted towards (are ignored and not used in the calculation)
EXAMPLES (at least 3 examples) [TODO]

> example_freqs_1 = freqs "arda" == [50.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
> example_freqs_2 = freqs "Arda" == [33.333336,0.0,0.0,33.333336,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,33.333336,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
> example_freqs_3 = freqs "ar" == [50.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,50.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]

DEFINITION

> freqs                         :: String -> [Float]
> freqs xs                      =  [percent (count x xs) n | x <- ['a'..'z']]
>                                  where n = lowers xs

TESTS (at least 1 test) [TODO]

> prop_freqs_nevernegative xs = all (>= 0)(freqs xs) || all isNaN(freqs xs)

--------------------------------------------------------------------------------

PURPOSE [TODO]
The purpose of this function is to return the sum of the difference squared of all pairs in the 2 lists as inputs.
EXAMPLES (at least 1 example) [TODO]

> example_chisqr_1 = chisqr [2,4][3,2] == 2.3333333

DEFINITION

> chisqr                        :: [Float] -> [Float] -> Float
> chisqr os es                  =  sum [((o - e) ^ 2) / e | (o,e) <- zip os es]

--------------------------------------------------------------------------------

> rotate                        :: Int -> [a] -> [a]
> rotate n xs                   =  drop n xs ++ take n xs

--------------------------------------------------------------------------------

PURPOSE [TODO]
Shows in what position the input is in the input list.
EXAMPLES (at least 3 examples) [TODO]

> example_positions_1 = positions 2 [3,2,4] == [1];
> example_positions_2 = positions 2 [2,2,2] == [0,1,2];
> example_positions_3 = positions 'D' "Donut" == [0];

DEFINITION

> positions                     :: Eq a => a -> [a] -> [Int]
> positions x xs                =  [i | (x',i) <- zip xs [0..], x == x']

TESTS (at least 1 test) [TODO]

> prop_positions_correct x xs =
>   all (\i -> xs !! i == x) (positions x xs)
>   where types = (x :: Int, xs :: [Int])

--------------------------------------------------------------------------------

> crackKey                      :: String -> Int
> crackKey xs                   =  (positions (minimum chitab) chitab) !! 0
>                                  where
>                                    chitab = [chisqr (rotate n mfreqs) table | n <- [0..25]]
>                                    mfreqs = freqs xs

--------------------------------------------------------------------------------

> crack                         :: String -> String
> crack xs                      =  decode (crackKey xs) xs
