> module Unzip where
> import Data.List hiding (unzip)
> import Prelude hiding (unzip)
> import Test.QuickCheck

CONTRACT

> unzip :: [(a,b)] -> ([a],[b])

PURPOSE
Inverse of zip function.

EXAMPLES

> example_unzip_1 = unzip [(1,'a'),(2,'b')] == ([1,2],['a','b'])
> example_unzip_2 = unzip [(False,'a'),(True,'b')] == ([False,True],['a','b'])
> example_unzip_3 = unzip ([] :: [(Int, Char)]) == ([],[])

DEFINITION

> unzip [] = ([],[])
> unzip  ((x, y):xys) = 
>  let (xs, ys) = unzip xys
>  in (x:xs, y:ys)
  
TESTS

> prop_unzip_length xys = 
>     length xys == length xs && 
>     length xys == length ys
>     where (xs, ys) = unzip xys