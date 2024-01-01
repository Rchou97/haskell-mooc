-- Original whatFollows: 
-- substringsOfLength :: Int -> String -> [String]
-- substringsOfLength n string = map shorten (tails string)
--   where shorten s = take n s

-- whatFollows :: Char -> Int -> String -> [String]
-- whatFollows c k string = map tail (filter match (substringsOfLength (k+1) string))
--   where match sub = take 1 sub == [c]

-- Lets rewrite by getting rid of the helper function substringsOfLength and move all 
-- the code to whatFollows: 

-- whatFollows :: a1 -> Int -> a2 -> [[a1]]
-- whatFollows c let k = map tail . filter ((== [c]) . take 1) . map (take (k + 1)) . tail