{-
It was said that constructors are things that can be pattern matched on. It was divulged that 
the constructors for the list type are : and []. We can put one and one together and guess that 
we can pattern match on : and []. This is true! Here's how you can define your own versions of 
head and tail using pattern matching
-}

myhead :: [Int] -> Int
myhead [] = -1
myhead (first:rest) = first

mytail :: [Int] -> [Int]
mytail [] = [] 
mytail (first:rest) = rest

{- you can nest patterns. Pattern mach more than one element from the start of a list. In this 
example, use the pattern (a:b:_) which is the same as (a:(b:_)) -}
sumFirstTwo :: [Integer] -> Integer 
-- this equation gets used for lists of length at least two
sumFirstTwo (a:b:_) = a + b
-- this equation gets used for all other lists (i.e. list of length 0 )or 1)
sumFirstTwo _ = 0

-- example that uses many different list patterns
describeList :: [Int] -> String
describeList [] = "an empty list"
describeList (x:[]) = "a list with one element" -- same as describeList [x]
describeList (x:y:[]) = "a list with two elements" -- same as describeList [x,y]
describeList (x:y:z:xs) = "a list with at least three elements"

{- List patterns that end with :[] can be typed out as list literals. That is, just like [1,2,3] is
the same value as 1:2:3:[], the pattern [x,y] is the same as the pattern x:y:[], 
-}

main :: IO ()
main = do 
    print(sumFirstTwo [1]) -- result: 0
    print(sumFirstTwo [1,2]) -- resukt: 3
    print(sumFirstTwo [1,2,4]) -- result 3
    print(describeList [1,3]) -- "a list with two elements"
    print(describeList [1,2,3,4,5]) -- a list with at least three elements