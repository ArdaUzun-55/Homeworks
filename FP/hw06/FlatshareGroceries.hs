module FlatshareGroceries where

import Test.QuickCheck
import System.IO
import Data.List
import Data.Bits (Bits(xor))

data Item = Item String Int Float deriving (Eq, Show, Read)

getItemName :: Item -> String
getItemName (Item n _ _) = n
getQuantity :: Item -> Int
getQuantity (Item _ q _) = q
getPrice :: Item -> Float
getPrice (Item _ _ p) = p

data Purchase a = Purchase String [a] deriving (Eq, Show, Read)

whoBought :: Purchase a -> String
whoBought (Purchase buyer _) = buyer
what :: Purchase a -> [a]
what (Purchase _ items) = items

type History = [Purchase Item]

--------------------------------------------------------------------------------
-- CONTRACT
example, example2, example3 :: History

-- PURPOSE

-- EXAMPLES

-- DEFINITION
example =  [Purchase "Alice" [Item "Milk" 2 0.49, Item "Cocoa" 1 1.99],
            Purchase "Bob" [Item "Bread" 1 0.99]]
example2 = [Purchase "Sascha" [Item "Orange" 2 0.01],
            Purchase "Dmitry" [Item "Milk" 2 0.01],
            Purchase "Mathias" [Item "Cocoa" 1 0.01]]
example3 = [Purchase "Chuck" [Item "Cocoa" 2 9.49, Item "Milk" 1 9.99],
            Purchase "Dan" [Item "Milk" 1 19.99]]

--------------------------------------------------------------------------------
-- CONTRACT
filterByBuyer :: String -> History -> History

-- PURPOSE [TODO]
-- The function filterByBuyer returns all purchases done by a certain person.
-- EXAMPLES (at least 3 examples) [TODO]
example_filterByBuyer_1 = filterByBuyer "Alice" example == [Purchase "Alice" [Item "Milk" 2 0.49,Item "Cocoa" 1 1.99]] 
example_filterByBuyer_2 = filterByBuyer "Bob" example == [Purchase "Bob" [Item "Bread" 1 0.99]]
example_filterByBuyer_3 = filterByBuyer "Sascha" example == []

-- DEFINITION [TODO]
filterByBuyer name history = filter(\x -> whoBought x == name) history

-- TESTS (at least 1 test) [TODO]
prop_filterByBuyer_empty :: String -> History -> Bool
prop_filterByBuyer_empty name history =  filterByBuyer "" history == []
--------------------------------------------------------------------------------
-- CONTRACT [TODO]
purchaseValue :: Purchase Item  -> [Float]

-- PURPOSE [TODO]
-- purchaseValues computes the total value of a purchase
-- EXAMPLES (at least 3 examples) [TODO]
example_purchaseValue_1 = purchaseValue (Purchase "Alice" [Item "Milk" 2 0.49, Item "Cocoa" 1 1.99]) == [0.98,1.99]
example_purchaseValue_2 = purchaseValue (Purchase "Bob" [Item "Bread" 1 0.99]) == [0.99]
example_purchaseValue_3 = purchaseValue (Purchase "Sascha" [Item "Orange" 2 0.01]) == [0.02]
-- DEFINITION [TODO]
purchaseValue (Purchase _ items) =  map (\x -> fromIntegral (getQuantity x) * getPrice x) items

-- TESTS (at least 1 test) [TODO]
prop_purchaseValue_null :: Purchase Item -> Bool
prop_purchaseValue_null purchase =  all(>=0) (purchaseValue purchase)
--------------------------------------------------------------------------------
-- CONTRACT
sumByBuyer :: String -> History -> Float

-- PURPOSE [TODO]
-- sumByBuyer computes the total value of a purchase by a person
-- EXAMPLES (at least 3 examples) [TODO]
example_sumByBuyer_1 = sumByBuyer "Alice" example == 2.97
example_sumByBuyer_2 = sumByBuyer "Bob" example == 0.99
example_sumByBuyer_3 = sumByBuyer "Sascha" example2 == 0.02
-- DEFINITION [TODO]
sumByBuyer name history = sum(map (\x -> fromIntegral (getQuantity x) * getPrice x) (concatMap what (filterByBuyer name history)))

-- TESTS (at least 1 test) [TODO]
prop_sumByBuyer_null :: String -> History -> Bool
prop_sumByBuyer_null name history =  sumByBuyer name history >= 0
--------------------------------------------------------------------------------
-- CONTRACT [TODO]
names :: History -> [String]

-- PURPOSE [TODO]
--names returns the names of all recorded buyers. 
-- EXAMPLES (at least 3 examples) [TODO]
example_names_1 = names example == ["Alice","Bob"]
example_names_2 = names example2 == ["Sascha","Dmitry","Mathias"]
example_names_3 = names example3 == ["Chuck","Dan"]
-- DEFINITION [TODO]
names hist = nub(map whoBought hist)
-- TESTS (at least 1 test) [TODO]
prop_name_zero :: History -> Bool
prop_name_zero hist = length(names hist) >= 0
------------------------------

--------------------------------------------------------------------------------
-- CONTRACT
itemCons, (.:) :: Item -> Purchase Item -> Purchase Item

-- PURPOSE [TODO]

-- EXAMPLES
example_itemCons_1 = (itemCons (Item "Milk" 2 0.49) $ example !! 0) == Purchase "Alice" [Item "Milk" 4 0.49, Item "Cocoa" 1 1.99]
example_itemCons_2 = (itemCons (Item "Milk" 2 0.48) $ example !! 0) == Purchase "Alice" [Item "Milk" 2 0.49, Item "Cocoa" 1 1.99, Item "Milk" 2 0.48]
example_itemCons_3 = (itemCons (Item "Orange" 2 0.1) $ example !! 0) == Purchase "Alice" [Item "Milk" 2 0.49, Item "Cocoa" 1 1.99, Item "Orange" 2 0.1]

-- DEFINITION [TODO]
itemCons newItem (Purchase buyer items) =  Purchase buyer (insertOrUpdate newItem items)
  where
    insertOrUpdate :: Item -> [Item] -> [Item]
    insertOrUpdate y [] = [y]
    insertOrUpdate y (x:xs)
      | sameNamePrice y x =
         Item (getItemName x)
                (getQuantity x + getQuantity y)
                (getPrice x) : xs
      | otherwise =
          x : insertOrUpdate y xs

    sameNamePrice a b =
      getItemName a == getItemName b &&
      getPrice a == getPrice b
a .: b = itemCons a b -- Operator similar to :
infixr 5 .:

-- TESTS (at least 1 test) [TODO]
prop_itemCons_names :: Item -> Purchase Item -> Bool
prop_itemCons_names item p = names [p] == names [itemCons item p]
------------------------------
