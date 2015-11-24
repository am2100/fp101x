toDigits :: Integer -> [Integer]
--
-- return a list of digits
--
-- 1. mod num 10 = digit
-- 2. div num / 10
-- 3. repeat
--
{-
toDigits x | x == 0 = []
           | otherwise = x `mod` 10 : toDigits (x `div` 10)
-}

toDigits x |  
  where ys = show x
