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


