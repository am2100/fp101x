-- last xs = drop (length xs - 1) xs
-- returns [5]

-- last xs = head (drop (length xs - 1) xs)
-- returns 5

-- last xs = tail (reverse xs) 
-- returns [4,3,2,1]

-- last xs = reverse (head xs)
-- ERROR: can't reverse a number

-- last xs = xs !! (length xs - 1)
-- returns 5

-- last xs = head (drop (length xs) xs)
-- Program error: pattern match failure: head []

-- last xs = head (reverse xs)
-- returns 5

-- last xs = reverse xs !! (length xs -1)
-- returns 1
