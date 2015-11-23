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

{-
and [True, False]
=
-}
