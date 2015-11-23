{-
and :: [Bool] -> Bool
and [] = True
and (b:bs) = b && and bs

and [True, True]
=
True && (and [True])
=
True && (True && (and []))
=
True && (True && (True))
=
True && True
=
True
-}

{-
and :: [Bool] -> Bool
and [] = True
and (b:bs) | b = and bs
           | otherwise = False
-}

{-
and :: [Bool] -> Bool
and [] = True
and (b:bs) | b == False = False
           | otherwise = and bs
-}

{-
and :: [Bool] -> Bool
and [] = True
and (b:bs) = b || and bs
-}

{-
and :: [Bool] -> Bool
and [] = True
and (b:bs) = and bs && b
-}

import Prelude hiding (and)
and :: [Bool] -> Bool
and [] = True
and (b:bs) | b = b
           | otherwise = and bs

-- import Prelude hiding ((^))
-- (^) :: Int -> Int -> Int
-- (^) m 0 = 1
-- m ^ 0 = 1
-- (^) m n = m * (^) m (n - 1)
-- (^) m n = m * m * m ^ (n - 2)
-- (^) m n = (m * m) ^ (n - 1)
-- m ^ n = m * (^) m (n -1)
-- m ^ n = (m * m) ^ (n - 1)

{- 
2 ^ 2 
= 
(2 * 2) ^ (2 - 1)
= 
(4) ^ (1)
= 
(4 * 4) ^ (1 - 1)
=
(16) ^ (0)
=
1
-}

{-
import Prelude hiding (concat)
concat :: [[a]] -> [a]
concat [] = []
concat (xs:xxs) = xs ++ concat xxs
-}

{-
import Prelude hiding (replicate)
replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n x = x : replicate (n - 1) x
-}

{-
import Prelude hiding ((!!))
(!!) :: [a] -> Int -> a
(x:_) !! 0 = x
(x:xs) !! n = xs !! (n - 1)
-}

{-
import Prelude hiding (elem)
elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem x (y:ys) | x == y = True
              | otherwise = elem x ys
-}

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x <= y then x : merge xs (y:ys) else y : merge (x:xs) ys

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]

