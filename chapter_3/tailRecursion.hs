-- Two ways for writing the same same function 
-- sumNumbers example: this one is not tail recursive!
sumNumbers :: [Int] -> Int 
sumNumbers [] = 0
sumNumbers (x:xs) = x + sumNumbers xs

-- tail recursive version: might be more efficient, but less easier to read 
sumNumbersTail :: [Int] -> Int
sumNumbersTail xs = go 0 xs
    where go sum [] = sum
          go sum (x:xs) = go (sum + x) xs

-- However, when returning a list there is a big difference between these two forms
-- doubleList example: this one is not tail recursive!
doubleList :: [Int] -> [Int]
doubleList [] = [] 
doubleList (x:xs) = 2 * x : doubleList xs

{- 
tail recurive version: more efficient, since the (:) operators works in constant time, whereas 
the (++) operator needs to walk the whole list, needing linear time. Thus the direct version
uses linear time (O(n)) with respect to the length of the list, while the tail-recursive 
version is quadratic (O(n^2))

One might be tempted to fix this by using (:) in the tail-recursive version, but then the list 
would get generated in the reverse order. This could be fixed with an application of reverse, but 
that would make the resulting function quite complicated.
-}
doubleListTail :: [Int] -> [Int]
doubleListTail xs = go [] xs
    where go result [] = result 
          go result (x:xs) = go (result++ [2 * x]) xs

