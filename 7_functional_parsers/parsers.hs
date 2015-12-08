-- A parser is a function that takes a string and returns
-- a tree.
--
-- Specifically, a Parser of type a takes a string and
-- returns a list of tuples, each pair comprising a value
-- of type a, and an output string.
--
type Parser a = String -> [(a, String)]

-- A Parser that always succeeds with the result
-- value v, without consuming any of the input string.
-- 
return :: a -> Parser a
return v = \inp -> [(v, inp)]

-- A dual Parser that always fails regardless of the
-- contents of the input string.
--
failure :: Parser a
failure = \inp -> []

-- A Parser which fails if the input string is empty,
-- and succeeds with the first character as the
-- result value.
--
-- case allows pattern matching to be used in the
-- body of a lambda definition.
--
item :: Parser Char
item = \inp -> case inp of
                    [] -> []
                    (x:xs) -> [(x,xs)]

-- Although parsers are functions and could be called
-- directly, it is preferred to abstract away from the
-- representation of parsers by defining an application
-- function.
--
parse :: Parser a -> String -> [(a, String)]
parse p inp = p inp
