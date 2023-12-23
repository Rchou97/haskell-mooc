-- higher order functions
lengthString :: [Int]
lengthString = map length ["abc", "abcdef"]

-- anonymous functions aka lambdas
filterString :: [[Char]]
filterString = filter (\x -> length x > 1) ["abc", "d", "ef"]

-- partial application 
multiple3Elements :: [Int]
multiple3Elements = map (*3) [1, 2, 3]

-- algebraic datatypes: defining datatypes 
data Shape = Point | Rectangle Double Double | Circle Double

-- pattern matching
area :: Shape -> Double
area Point = 0 
area (Rectangle width height) = width * height 
area (Circle radius) = 2 * pi * radius

-- lists
list :: [[Char]]
list = [whole | first <- ["Eva", "Mike"],
         last <- ["Smith", "Wood", "Odd"],
         let whole = first ++ " " ++ last,
         even (length whole)]

-- infinite lists
primes :: [Int]
primes = sieve [2..]
  where
    sieve (p:xs) = p : sieve [x|x <- xs, x `mod` p > 0]

main :: IO ()
main = do
    print (lengthString)
    print (filterString)
    print (multiple3Elements)
    print (area (Rectangle 5 5))
    print (area (Circle 10))
    print (list)
    print (take 10 primes)
