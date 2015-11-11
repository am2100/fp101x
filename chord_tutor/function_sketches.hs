import Data.Char
-- is there an open string in the chord?
--
hasOpenStrings :: String -> Bool
hasOpenStrings xs = not(null [x|x <- xs, x == '0'])

-- is there a muted string in the chord?
--
hasMutedStrings :: String -> Bool
hasMutedStrings xs = not(null [x|x <- xs, x == 'x'])

-- what is the highest fret number
--
findMaxFretted :: String -> Int
findMaxFretted xs = maximum [digitToInt x | x <- xs]

-- what is the lowest fret number excepting open strings
--
findMinFretted :: String -> Int
findMinFretted xs = minimum [digitToInt x | x <- xs, digitToInt x > 0]

-- should there be a fret number?  -- if highest fret is above 5, then yes
--
hasFretNumber :: String -> Bool
hasFretNumber xs = findMaxFretted xs > 5

-- decide which frets to display
-- if findMaxFretted <= 5 then [0..5]
-- else [findMinFretted..findMinFretted + 5]
--
getFretRange ::  Int -> [Int]
getFretRange x | x > 5 = [x..x+4]
               | otherwise = [1..5]


-- write an open string symbol or a space
--
wOpenString :: Char -> Char
wOpenString x | x == '0' = 'o'
              | otherwise = x

-- write a mute string symbol or a space
--
wMuteString :: Char -> Char
wMuteString x | x == 'x' = 'x'
              | otherwise = x

{-

021x  0447
 
o  x  o   
====  ----
|x||  |xx| 4
----  ----
||x|  ||||
----  ----
||||  ||||
----  ----
||||  |||x
----  ----
||||  ||||
----  ----

-}

{-
 - Chord data
 -
 - Want to supply a chord pattern as a string
 -
 - "012x"
 -
 - Want to be able to reference higher
 - frets without ambiguity
 -
 - "67810"
 - "9111211"
 - "13141214"
 - "16161617"
 -
 - Want to indicate muted strings
 -
 - "323x"
 -
 - Want to indicate open strings
 -
 - "1200"
 -
 - Need to transform a chord pattern into a list
 - of Ints for easier processing?
 -
 - [0,1,2,-1]
 - 
 -}

-- Convert a chord String to a list of Ints
--
-- Examples
--
-- "012x"     = [0,1,2,-1]
-- "10987"    = [1,0,9,8,7]
-- "10111213" = [1,0,1,1,1,2,1,3]
--
parseChordString :: String -> [Int]
parseChordString xs = map listify xs

listify :: Char -> Int
listify x | x == 'x' = -1
          | otherwise = digitToInt x

-- Convert a list of Ints into a proper chord list of ints
--
-- Examples
--
-- [1,0,1,1,9,8] = [10,11,9,8]
--
parseChordList :: [Int] -> [Int]

parseChordList [] = []
parseChordList (x:xs) | x == 1 = 10 + head xs : parseChordList (tail xs)
                      | otherwise = x : parseChordList xs

-- Take a parsed chord list and return a String
-- describing the open and muted strings
--
-- Example
--
-- wOpenMuteStrings [0,1,-1,2] = "o x "
--
wOpenMuteStrings :: [Int] -> String
wOpenMuteStrings xs = map wOpenMuteString xs

-- write an open or a mute string symbol or a space
--
wOpenMuteString :: Int -> Char
wOpenMuteString x | x == 0 = 'o'
                  | x == -1 = 'x'
                  | otherwise = ' '

-- write out a fret line
--
wFretLine = "----"

-- write out a nut line
--
wNutLine = "===="

wNutOrFret :: [Int] -> String
wNutOrFret xs | maximum xs > 5 = wFretLine
              | otherwise = wNutLine

-- write out a fret
--
-- Supply a parsed Chord list and the number of the 
-- current fret to write out
--
wFret :: Int -> [Int] -> [Char]
wFret _ [] = []
wFret n (x:xs) | n == x = 'x' : wFret n xs
               | otherwise = '|' : wFret n xs

-- write out a chord box
--
-- wOpenMuteStrings
-- wNutOrFret
-- wFret 1
-- wFretLine
-- wFret 2
-- wFretLine
-- wFret 3
-- wFretLine
-- wFret 4
-- wFretLine
-- wFret 5
