-- toDigits
import Data.Char

toDigits :: Integer -> [Integer]
toDigits x = stringToDigits (numToString (toInteger x))

numToString :: Integer -> [Char]
numToString x = show x

stringToDigits :: [Char] -> [Integer]
stringToDigits xs = [toInteger (ord x - ord '0') | x <- xs]


toDigitsRev :: Integer -> [Integer]
toDigitsRev x | x > 0 = (x `mod` 10) : toDigitsRev (x `div` 10) 
              | otherwise = []


doubleSecond :: [Integer] -> [Integer]
doubleSecond xs = zipWith ($) (cycle [id, (2*)]) xs 

sumDigits :: [Integer] -> Integer
sumDigits xs = sum (concat [breakDigit x | x <- xs])

breakDigit :: Integer -> [Integer]
breakDigit x | x < 10 = [(x `mod` 10)]
             | otherwise = (x `mod` 10) : breakDigit (x `div` 10)
