import Data.ByteString (count)
{- Using pattern matching and recursion, we can recursively process a whole list. Below an example 
of how to sum all the numbers in a list. -}
sumNumbers :: [Int] -> Int 
sumNumbers [] = 0
sumNumbers (x:xs) = x + sumNumbers xs 

{- 
Here's how you compute the largest number in a list, using a helper function 
Note: "go" is just a name for the helper function here, no special syntax
-}
myMaximum :: [Int] -> Int 
myMaximum [] = 0 
myMaximum (x:xs) = go x xs
    where go biggest [] = biggest
          go biggest (x:xs) = go (max biggest x) xs

{- 
It's often convenient to use nested patterns while consuming a list. Here's an example that
counts how many Nothing values occur in a list of Maybe's
-}
countNothings :: [Maybe a] -> Int
countNothings [] = 0 
countNothings (Nothing : xs) = 1 + countNothings xs 
countNothings (Just _ : xs) = countNothings xs 

{- 
Now that we can build and consume lists, let's do both of them at teh same time. This function
doubles all elements in a list
-}
doubleList :: [Int] -> [Int]
doubleList [] = []
doubleList (x:xs) = 2 * x : doubleList xs

{- 
Once you know pattern matching for lists, it's straightforward to define map and filter. 
Standard implementation of map and filter in te GHC library. 
Note: naming the argument _pred is a way to tell the reader of the code that this argument
is unused. It could have been just_ as well.
-}
mapCust :: (a -> b) -> [a] -> [b]
mapCust _ [] = []
mapCust f (x:xs) = f x : mapCust f xs

filterCust :: (a -> Bool) -> [a] -> [a]
filterCust _pred [] = []
filterCust pred (x:xs)
    | pred x = x : filterCust pred xs 
    | otherwise = filterCust pred xs

main :: IO ()
main = do 
    print(countNothings [Nothing, Just 1, Nothing])
    print(doubleList [1, 2, 3])
    {-
    === doubleList (1:(2:(3:[])))
    ==> 2 * 1 = doubleList (2:(3:[]))
    ==> 2 * 1 : (2 * 2 : doubleList (3:[]))
    ==> 2 * 1 : (2 * 2 : (2 * 3 : doubleList []))
    ==> 2 * 1 : (2 * 2 : (2 * 3 : []))
    === [2 * 1, 2 * 2, 2 * 3]
    ==> [2,4,6]
     -}