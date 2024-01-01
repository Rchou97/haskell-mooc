-- takeWhile :: (a -> Bool) -> [a] -> [a] -- take elements from a list as long as they satisfy a predicate
-- dropWhile :: (a -> Bool) -> [a] -> [a] -- drop elements from a list as long as they satisfy a predicate


-- function zipWith lets you combine two lists element-by-element
-- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]

-- using rhese, we can implement a function findSubstring that finds the earliest and longest 
-- substring in a string that consist only of the given characters
-- findSubstring :: String -> String -> String
-- findSubstring chars = takeWhile (\x -> elem x chars)
--                      . dropWhile (\x -> not $ elem x chars)

main :: IO()
main = do
--    print(takeWhile even [2,4,1,2,3]) 
--    print(dropWhile even [2,4,1,2,3])
    -- function elem: used to check if a list contains an element 
    print (3 `elem` [1,2,3]) -- will return True
    print (4 `elem` [1,2,3]) -- will return False 
--    print(findSubstring "a" "bbaabaaaab") -- result: "aa"
--    print(findSubstring "abcd" "xxxyyyzabaaxxabcd") -- result: "abaa"

--    print(zipWith (++) ["John","Mary"] ["Smith","Cooper"]) -- result: ["JohnSmith","MaryCooper"]
--    print(zipWith take [4,3] ["Hello","Warden"]) -- result: ["Hell","War"]

    -- function id :: a -> a is the identity function and just returns its argument
    print (id 3) -- result: 3
    print (map id [1,2,3]) -- result: [1,2,3]

    -- bit useless, but you can use it with filter or dropWhile
    print (filter id [True,False,True,True]) -- result: [True,True,True]
    print (dropWhile id [True,True,False,True,False]) -- rsult: [False,True,False]

    -- constant function, const :: a -> b -> a, which always reutrns its first argument
    print (const 3 True) -- result: 3 
    print (const 3 0) -- result: 3

    -- when partially applied, it can be used when you need a function that always returns
    -- the same value
    print (map (const 5) [1,2,3,4]) -- result: [5,5,5,5]
    print (filter (const True) [1,2,3,4]) -- result: [1,2,3,4]

