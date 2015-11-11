import Prelude hiding ((&&))
--halve :: [a] -> ([a], [a])
--halve xs = (take n xs, drop n xs)
  --where n = length xs / 2

--halve xs = splitAt (length xs `div` 2) xs

--halve xs = (take(n `div` 2) xs, drop(n `div` 2) xs)
--  where n = length xs

--halve xs = splitAt (length xs `div` 2)

--halve xs = (take n xs, drop (n+1) xs)
--  where n = length xs `div` 2

--halve xs = splitAt(div (length xs) 2) xs

--halve xs = splitAt(length xs / 2) xs

--halve xs = (take n xs, drop n xs)
--  where n = length xs `div` 2

--safetail :: [a] -> [a]

--safetail xs = if null xs then [] else tail xs

--safetail [] = []
--safetail (_:xs) = xs

--safetail (_:xs)
--  | null xs = []
--  | otherwise = tail xs

--safetail xs
--  | null xs = []
--  | otherwise = tail xs

--safetail [] = []
--safetail xs = tail xs

--safetail [x] = [x]
--safetail (_:xs) = xs

--safetail = \ xs -> case xs of
  --[] -> []
  --(_:xs) -> xs

--False || False = False
--_ || _ = True

--False || b = b
--True || _ = True

--b || c
--  | b == c = True
--  | otherwise = False

--b || c
--  | b == c = b
--  | otherwise = True

--b || False = b
--_ || True = True


--b || c 
--  | b == c = c
--  | otherwise = True

--b || True = b
--_ || True = True

--False || False = False
--True || False = True
--False || True = True
--True || True = True

--True && True = True
--_ && _ = False

--a && b = if a then if b then True else False else False

--a && b = if not (a) then not (b) else True

--a && b = if a then b

--a && b = if a then if b then False else True else False

a && b = if b then a else False

