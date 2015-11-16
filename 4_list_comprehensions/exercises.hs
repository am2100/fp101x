{-
sum100 :: Int
sum100 = sum [x ^ 2 | x <- [1..100]]

sum3 :: Int
sum3 = sum [x^2 | x <- [1..3]]

sum100 :: Int
sum100 =  sum [x*x | x <- [1..100]]

sum100 =  sum [const 2 x | x <- [1..100]]

sum100 = foldl (+) (1) [x ^ 2 | x <- [1..100]]
-}

{-
replicate :: Int -> a -> [a]
replicate n a = [a | _ <- [1..n]]
-}

{-
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z) | x <- [1..n], y <- [1..x], z <- [1..y], x^2 + y^2 == z^2]
pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [y..n], x^2 + y^2 == z^2]
pyths n = [(x,y,z) | x <- [1..n], y <- [x..n], z <- [y..n], x^2 + y^2 == z^2]
-}

{-
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (init (factors x)) == x]
-} 

find :: (Eq a) => a -> [(a,b)] -> [b]
find key table = [value | (key', value) <- table, key == key']

positions :: (Eq a) => a -> [a] -> [Int]
