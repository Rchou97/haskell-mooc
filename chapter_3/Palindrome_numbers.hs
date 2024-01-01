import Data.List ( tails, words )

-- a predicate that checks if a string is a palindrome
palindrome :: String -> Bool
palindrome str = str == reverse str

-- palindromes n takes all numbers from 1 to n, converts them to strings using show,
-- and keeps only palindromes
palindromes :: Int -> [String]
palindromes n = filter palindrome (map show [1..n])

main :: IO ()

-- how many words in a string start with "a"? THis uses the function words from the 
-- module Data.List that splits a string into words
-- countAWords :: String -> Int
-- countAWords string = length (filter startsWithA (words string))
--  where startsWithA s = head s == "a"

-- function tails from Data.List returns the list of all suffixes ("tails") of a list. 
-- use tails, map and take to get all substrings of a certain length
substringsOfLength :: Int -> String -> [String]
substringsOfLength n string = map shorten (tails string)
  where shorten s = take n s

-- there some shorter substrings left at the end, but they're fine for our purposes. 
-- now that we have substringsOfLenght, we can implement the function whatFollows c k s 
-- that find all the occurences of the character c in the string s, and outputs the k 
-- letters that come after these occurences 
whatFollows :: Char -> Int -> String -> [String]
whatFollows c k string = map tail (filter match (substringsOfLength (k + 1) string))
  where match sub = take 1 sub == [c]

main = 
  do print(palindrome "1331") -- True
     print(palindromes 150) -- ["1","2","3","4","5","6","7","8","9",
                            -- "11","22","33","44","55","66","77","88","99",
                            -- "101","111","121","131","141"]
     print(length (palindromes 9999)) -- 198
--     print(countAWords "does anyone want an apple?") -- result: 3
     print(substringsOfLength 3 "hello") -- ["hel","ell","llo","lo","o",""]
     print(whatFollows 'a' 2 "abracadabra") -- ==> ["br","ca","da","br",""]
