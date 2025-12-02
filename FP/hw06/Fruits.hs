module Fruits where

data Food = Pear | Banana | Cucumber | Cauliflower

--------------------------------------------------------------------------------
-- DEFINITION
sumCond :: Food -> (Int, Int) -> (Int, Int)
sumCond Pear (f, v) = (f + 1, v)
sumCond Banana (f, v) = (f + 1, v)
sumCond Cucumber (f, v) = (f, v + 1)
sumCond Cauliflower (f, v) = (f, v + 1)

--------------------------------------------------------------------------------
-- DEFINITION
sumFruits :: [Food] -> (Int, Int)
sumFruits xs =  foldl (\x y ->  case y of
              Pear -> (fst x+1,snd x)
              Banana -> (fst x+1,snd x)
              Cucumber -> (fst x,snd x+1)
              Cauliflower -> (fst x,snd x+1))(0, 0) xs