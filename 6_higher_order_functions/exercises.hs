{-
doubleEvens :: Integral a => [a] -> [a]
doubleEvens xs = [(2*) x | x <- xs, even x]
-}

all' :: (a -> Bool) -> [a] -> Bool

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

-- Experiment with infinite and partial lists to spot differences in the behaviour of each implementation.

-- all' p xs = and (map p xs) -- works
-- all' p xs = map p (and xs) -- nope. and requires [Bool]. [a] is more general and should take a list of any type.
all' p = and . map p -- nope. where's the list?
