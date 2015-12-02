{-
doubleEvens :: Integral a => [a] -> [a]
doubleEvens xs = [(2*) x | x <- xs, even x]
-}

-- all' :: (a -> Bool) -> [a] -> Bool

-- lists are finite
-- lists are not partial
  -- partial lists are lists that contain some elements
  -- that have not been evaluated yet. E.g.:
    -- lazylist :: [Integer]
    -- lazylist = 1 : loop
    -- > head lazylist
    --   1
-- lists do not have bottom values
  -- bottom refers to a computation which never successfully completes due to:
    -- some kind of error
    -- an infinite loop
  -- The mathematical symbol for bottom is the upside down T
  -- Unicode character 22A5 hex (8869 decimal)
  -- HTML '&perp;'
-- p always returns True or False
-- p does not return BOTTOM

-- f . g = \x -> f (g x)

-- Experiment with infinite and partial lists to spot differences in the behaviour of each implementation.

-- all' p xs = and (map p xs) -- yes
-- all' p xs = map p (and xs) -- no - xs must be [Bool]. Won't work for the more general type [a]
-- all' p = and . map p = all' p = (\xs -> and (map p xs)) -- yes
-- all' p = not . any (not . p)
-- all' p = not . any (\x -> not (p x)) -- this substitution is equivalent
-- all' p = not (any (not . p))
-- CANNOT UNDERSTAND THIS!!!
--
-- all' p = map p . and
-- all' even = map even . and -- no - and returns Bool, but p requires a for a parameter.
--
-- all' p xs = foldl (&&) True (map p xs) -- yes
-- foldl (&&) True (map even [2,2,2])
-- foldl (&&) True [True,True,True]
--
-- all' p xs = foldr (&&) False (map p xs) -- no - the empty list is always mapped to False
-- foldr (&&) False [True,True,True]
--
-- all' p = foldr (&&) True . map p -- yes
-- all' p = (\xs -> foldr (&&) True (map p xs)) 

-- any' :: (a -> Bool) -> [a] -> Bool

-- any' p = map p . or -- no - Type error
-- any' p = or . map p -- yes
-- any' p = \xs -> or (map p xs)
--
-- any' p xs = length (filter p xs) > 0 -- yes
--
-- any' p = not . null . dropWhile (not . p) -- yes
-- any' p xs = not (null (dropWhile (not . p) xs)) -- This is equivalent
-- haven't got to the bottom of this one either!!!
--
-- any' p = null . filter p
-- any' p = \xs -> null (filter p xs) -- no - this is just a test for a null list
--
-- any' p xs = not (all (\x -> not (p x)) xs) -- yes - given example
-- any' p = not (all (\x -> not (p x))) -- sad face
-- any' p = not . all (not . p) -- this is equivalent - happy face :)
--
-- any' p xs = foldr (\x acc -> (p x) || acc) False xs -- yes
-- any' p = foldr (\x acc -> (p x) || acc) False -- this is equivalent
-- 
-- any' p xs = foldr (||) True (map p xs) -- no - always returns true as [] = True

-- takeWhile' :: (a -> Bool) -> [a] -> [a]

-- takeWhile' p = foldl (\acc x -> if p x then x : acc else acc) [] -- no - takes all evens from the list
-- takeWhile' _ [] = []
-- takeWhile' p (x:xs) | p x = x : takeWhile p xs
--                    | otherwise = [] -- yes
--                    
-- dropWhile' :: (a -> Bool) -> [a] -> [a]
-- 
-- propWhile' _ [] = []
-- dropWhile' p (x:xs) | p x = dropWhile' p xs
--                    | otherwise = x:xs      -- yes
--
-- map' :: (a -> b) -> [a] -> [b]
-- map' f = foldr (\x xs -> xs ++ [f x]) [] -- no - reverses the list
-- map' f = foldr (\x xs -> f x ++ xs) [] -- no - unification would give infinite type ???
-- map' f = foldl (\xs x -> f x : xs) [] -- no - reverses the list
-- map' f = foldl (\xs x -> xs ++ [f x]) [] -- yes  

-- filter' :: (a -> Bool) -> [a] -> [a]
-- filter' p = foldl (\xs x -> if p x then x : xs else xs) [] -- no - reverses list
-- filter' p = foldr (\x xs -> if p x then x : xs else xs) [] -- yes
-- filter' p = foldr (\x xs -> if p x then xs ++ [x] else xs) [] -- no - referses list
-- filter' p = foldl (\x xs -> if p x then xs ++ [x] else xs) [] -- no - accumulator should be the first parameter to lambda

-- dec2int' :: [Integer] -> Integer
-- dec2int' = foldr (\x acc -> 10 * x + acc) 0 -- no - dec2int' [1,2,3] = 60
-- dec2int' = foldl (\acc y -> acc + 10 * y) 0 -- no - dec2int' [1,2,3] = 60
-- dec2int' = foldl (\acc y -> 10 * acc + y) 0 -- yes
-- 10 * 0 + 1 = 1
-- 10 * 1 + 2 = 12
-- 10 * 12 + 3 = 123

-- compose :: [a -> a] -> (a -> a)
-- compose = foldr (.) id
--
-- sumsqreven = compose [sum, map (^ 2), filter even]
-- sumsqreven = compose [map (^ 2), filter even]

-- curry' :: ((a, b) -> c) -> a -> b -> c
-- curry' f = \ x y -> f x y -- no - infinite type error
-- curry' f = \ x y -> f -- no - infinite type error
-- curry' f = \ x y -> f (x,y) -- yes 
-- curry' f = \ (x, y) -> f x y -- no - infinite type error

-- uncurry' :: (a -> b -> c) -> (a, b) -> c
-- uncurry' f = \ (x,y) -> f x y -- yes
-- uncurry' f = \ x y -> f (x,y) -- no - infinite type error
-- uncurry' f = \ (x,y) -> f -- no - infinite type error
-- uncurry' f = \ x y -> f -- no - infinite type error


unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]

-- p = predicate             (b -> Bool)
-- h = head                  (b -> a)
-- t = tail                  (b -> b)
-- x                          b
--
-- returns                   [a]
--
-- p x = halting condition 

unfold p h t x | p x = []
               | otherwise = h x : unfold p h t (t x)

iterate' :: (a -> a) -> a -> [a]
iterate' f = unfold (const False) id f -- no - infinite type error
-- iterate' f = unfold (const False) f f -- no - infinite type error
-- iterate' f = unfold (const True) id f -- no - infinite type error
-- iterate' f = unfold (const True) f f -- no - infinite type error

-- int2bin :: Int -> [Bit]
-- int2bin 0 = []
-- int2bin n = n `mod` 2 : int2bin (n `div` 2)

-- int2bin = unfold (== 0) (`mod` 2) (`div` 2)

-- type Bit = Int
-- chop8 :: [Bit] -> [[Bit]]
-- chop8 [] = []
-- chop8 bits = take 8 bits : chop8 (drop 8 bits)

-- chop8 = unfold null (take 8) (drop 8)

-- map' :: (a -> b) -> [a] -> [b]
-- map' f = unfold null (f) tail -- no - infinite type error
-- map' f = unfold null (f (head)) tail -- no - infinite type error
-- map' f = unfold null (f . head) tail -- yes
-- map' f = unfold null (\x -> f (head x)) tail -- this is equivalent
-- map' f = unfold empty (f . head) tail -- no - no such variable empty

