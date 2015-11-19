-- qsort [1,8,3,2,6]
-- returns [8,6,3,2,1]

-- qsort [] = []
-- qsort (x : xs) = qsort larger ++ [x] ++ qsort smaller
--  where smaller = [a | a <- xs, a <= x]
--        larger = [b | b <- xs, b > x]
-- 
-- returns: [9,6,5,3,1]

-- qsort [] = []
-- qsort (x : xs) = reverse (qsort smaller ++ [x] ++ qsort larger)
-- where smaller = [a | a <- xs, a <= x]
--       larger = [b | b <- xs, b > x]
--
-- returns [5,3,6,9,1]

-- qsort [] = []
-- qsort xs = qsort larger ++ qsort smaller ++ [x]
--   where x = minimum xs
--         smaller = [a | a <- xs, a <= x]
--         larger = [b | b <- xs, b > x]

-- returns ERROR - Control stack overflow

-- qsort [] = []
-- qsort (x : xs) = reverse (qsort smaller) ++ [x] ++ reverse (qsort larger)
--   where smaller = [a | a <- xs, a <= x]
--         larger = [b | b <- xs, b > x]
-- 
-- returns [1,9,6,3,5]

-- qsort [] = []
-- qsort (x : xs) = qsort larger ++ [x] ++ qsort smaller
--   where larger = [a | a <- xs, a > x || a == x]
--         smaller = [b | b <- xs, b < x]
-- 
-- returns [9,6,5,3,1]

-- qsort [] = []
-- qsort (x : xs) = qsort larger ++ [x] ++ qsort smaller
--   where smaller = [a | a <- xs, a < x]
--         larger = [b | b <- xs, b > x]
-- 
-- qsort [1,6,5,3,9,5,5,5]
-- returns [9,6,5,3,1]

qsort [] =[]
qsort (x : xs) = reverse (reverse (qsort smaller) ++ [x] ++ reverse (qsort larger))
  where smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]
-- 
-- qsort [1,6,5,3,9,5,5,5]
-- returns [3,5,6,9,1]

-- qsort [] = []
-- qsort xs = x : qsort larger ++ qsort smaller
--   where x = maximum xs
--         smaller = [a | a <- xs, a < x]
--         larger = [b | b <- xs, b >= x]
-- 
-- qsort [1,6,5,3,9,5,5,5]
-- [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9...
