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

{-
positions :: Eq a => a -> [a] -> [Int]

positions x xs = [i | (x',i) <- zip xs [0..n], x == x']
                 where n = length xs - 1

> positions 0 [1,0,0,1,0,1,1,0]
[1,2,4,7]
-}

--find :: (Eq a) => a -> [(a,b)] -> [b]
--find key table = [value | (key', value) <- table, key == key']
--find k t = [v | (k', v) <- t, k == k']

-- positions :: (Eq a) => a -> [a] -> [Int]

-- Redefine positions using the function find
--
-- positions x xs
--
-- @params x     The value to find the position of
-- @params xs    The list of values
--
-- @return       A list of positions
--
-- find k t
--
-- @params k     The value to return
-- @params t     A table of key value pairs
--               key   = value to find
--               value = list position
--
-- @return       A list of matching values for the 
--               given key

-- positions :: (Eq a) => a -> [a] -> [Int]
-- positions x xs = find x (zipWith (+) xs [0..n])
  -- where n = length xs -1

--positions x xs = find x (zip xs [0..n])
  --where n = length xs - 1

{-
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x * y | (x,y) <- xs `zip` ys]
-}

{-
import Data.Char

let2int :: Char -> Int
let2int c = ord c - ord 'a'

uclet2int :: Char -> Int
uclet2int c = ord c - ord 'A'o

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

ucint2let :: Int -> Char
ucint2let n = chr (ord 'A' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n) `mod` 26)
          | isUpper c = ucint2let ((uclet2int c + n) `mod` 26)
          | otherwise = c

shift n c = int2let ((let2int c + n) `mod` 26)

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]
-}

{-
riffle :: [a] -> [a] -> [a]
riffle xs ys = concat [[x,y] | (x,y) <- xs `zip` ys]
-}

divisors :: Int -> [Int]
--divisors n = [x | x <- [1..n], n `mod` x == 0]
divisors x = [d | d <- [1..x], d `divides` x]

divides :: Int -> Int -> Bool
divides x d = x `mod` d == 0
=======
find :: (Eq a) => a -> [(a,b)] -> [b]
find key table = [value | (key', value) <- table, key == key']

positions :: (Eq a) => a -> [a] -> [Int]
-}

import Data.Char

let2int :: Char -> Int
let2int c = ord c - ord 'A'
