-- toDigits
import Data.Char

toDigits :: Integer -> [Integer]
-- toDigits x = stringToDigits (numToString (toInteger x))
toDigits x | x >= 0 = stringToDigits (numToString (toInteger x))
           | otherwise = error "Credit Card numbers aren't negative"

{-
toDigits (-531)

-}
numToString :: Integer -> [Char]
numToString x = show x

stringToDigits :: [Char] -> [Integer]
stringToDigits xs = [toInteger (ord x - ord '0') | x <- xs]


toDigitsRev :: Integer -> [Integer]
-- toDigitsRev x | x < 0 = error "Credit Card numbers aren't negative"
              -- | x == 0 = [0]
              -- | x > 0 = (x `mod` 10) : toDigitsRev (x `div` 10) 
              -- | otherwise = []
toDigitsRev x = reverse (toDigits x)

doubleSecond :: [Integer] -> [Integer]
doubleSecond xs = zipWith ($) (cycle [id, (2*)]) xs 

sumDigits :: [Integer] -> Integer
sumDigits xs = sum (concat [breakDigit x | x <- xs])

breakDigit :: Integer -> [Integer]
breakDigit x | x < 0 = error "Credit Card numbers aren't negative"
             | x < 10 = [(x `mod` 10)]
             | otherwise = (x `mod` 10) : breakDigit (x `div` 10)

isValid :: Integer -> Bool
-- isValid :: Integer -> [Integer]
-- isValid :: Integer -> Integer
--
-- 1. Double the value of every second digit beginning with the rightmost.
-- 2. Add the digits of the doubled values and the undoubled digits from the 
--    original number.
-- 3. Calculate the modulus of the sum divided by 10. A valid number returns 0.
isValid x | sumDigits (doubleSecond (toDigitsRev x)) `mod` 90 == 0 = True
          | otherwise = False

