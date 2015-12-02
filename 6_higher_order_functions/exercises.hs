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

any' :: (a -> Bool) -> [a] -> Bool

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
any' p xs = foldr (||) True (map p xs)

