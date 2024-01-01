-- Customer operators
(<+>) :: [Int] -> [Int] -> [Int]
xs <+> ys = zipWith (+) xs ys

(+++) :: String -> String -> String
a +++ b = a ++ " " ++ b

-- List comprehensions
firstLetters :: String -> [Char]
firstLetters string = [char | (char:_) <- words string] 

main :: IO ()
main = do 
    print([2 * i | i <- [1,2,3]]) -- mapping, result: [2,4,6]
    print([i | i <- [1..7], even i]) -- filtering, result: [2,4,6]
    
    -- list comprehensions can do even more, but van iterate over multiple lists
    -- result: ["John Smith", "John Cooper", "Mary Smith", "Mary Cooper"]
    print([first ++ " " ++ last | first <- ["John", "Mary"], last <- ["Smith", "Cooper"]])

    -- local definitions 
    -- result: ["siht", "si", "a", "gnirts"]
    print([reversed | word <- ["this", "is", "a", "string"], let reversed = reverse word])

    -- pattern matching in list comprehensions
    print(firstLetters "Hello World!") -- result: "HW"