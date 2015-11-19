-- init [1,2,3,4,5]
-- returns [1,2,3,4]

-- init xs = tail (reverse xs)
-- returns [4,3,2,1]

-- init xs = reverse (head (reverse xs))
-- ERROR - Cannot infer instance
-- *** Instance   : Num [a]
-- *** Expression : init [1,2,3,4,5]

-- init xs = reverse (tail xs)
-- returns [5,4,3,2]

-- init xs = take (length xs) xs
-- returns [1,2,3,4,5]

-- init xs = reverse (tail (reverse xl))
-- returns [1,2,3,4]

-- init xs = take (length xs - 1) (tail xs)
-- returns [2,3,4,5]

-- init xs = drop (length xs - 1) xs
-- returns [5]

