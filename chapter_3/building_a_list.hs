{- 
Buiding a list 
Using : we can define recursive functions that build lists, e.g., here's a function that 
build lists like [3,2,1]
-}

descend :: (Eq t, Num t) => t -> [t]
descend 0 = []
descend n = n : descend (n - 1)

-- function that builds a list by iterating a function n times
iter f 0 x = []
iter f n x = x : iter f (n - 1) (f x)

-- heres a more complicated example: splitting a string into pieces at a given character
split :: Char -> String -> [String]
split c [] = []
split c xs = start : split c (drop 1 rest)
    where start = takeWhile (/=c) xs
          rest = dropWhile (/=c) xs

main :: IO()
main = do 
    print(descend 4) -- result: [4,3,2,1]
    print(iter (*2) 4 3) -- result: [3,6,12,24]
    print(let xs = "terve" 
        in iter tail (length xs) xs) -- result: ["terve", "erve", "rve", "ve", "e", ""]
    print(split 'x' "fooxxbarxquux") -- result: ["foo","","bar","quu"]