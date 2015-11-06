import Data.Char
-- is there an open string in the chord?
hasOpenStrings :: String -> Bool
hasOpenStrings xs = not(null [x|x <- xs, x == '0'])

-- is there a muted string in the chord?
hasMutedStrings :: String -> Bool

hasMutedStrings xs = not(null [x|x <- xs, x == 'x'])

-- what is the highest fret number
findMaxFretted :: String -> Int
findMaxFretted xs = maximum [digitToInt x | x <- xs]

-- what is the lowest fret number excepting open strings
findMinFretted :: String -> Int
findMinFretted xs = minimum [digitToInt x | x <- xs, digitToInt x > 0]

-- should there be a fret number?  -- if highest fret is above 4, then yes
hasFretNumber :: String -> Bool
hasFretNumber xs = findMaxFret xs > 4

-- decide which frets to display
-- if findMaxFretted <= 5 then [0..5]
-- else [findMinFretted..findMinFretted + 5]
getFretRange ::  Int -> [Int]

getFretRange x | x > 5 = [x..x+4]
               | otherwise = [1..5]

{-
 
o12x  
====
|x||
----
||x|
----
||||
----
||||
----
||||
----

-}
