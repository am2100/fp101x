evens :: [Integer] -> [Integer]
evens xs = [x | x <- xs, even x]

squares :: Integer -> [Integer]
squares n = [x ^ 2 | x <- [1..n], x > 0]

sumSquares :: Integer -> Integer
sumSquares n = sum (squares n)

squares' :: Integer -> Integer -> [Integer]
squares' m n = [x ^ 2 | x <- [(n + 1)..(n + m)], x > 0]

sumSquares' x = sum . uncurry squares' $ (x, x)

coords :: Integer -> Integer -> [(Integer, Integer)]
coords m n =  [(x, y) | x <- [0..m], y <- [0..n], x >= 0, y >= 0]
