import Prelude hiding (return)
type Parser a = String -> [(a, String)]

item :: Parser Char
item = \inp -> case inp of
                 [] -> []
                 (x:xs) -> [(x, xs)]

failure :: Parser a
failure = \inp -> []

return :: a -> Parser a
return v = \inp -> [(v, inp)]

(+++) :: Parser a -> Parser a -> Parser a
p +++ q = \inp -> case p inp of 
                    [] -> parse q inp
                    [(v, out)] -> [(v, out)]

parse :: Parser a -> String -> [(a, String)]
parse p inp = p inp

char                          :: Char -> Parser Char
char x                        =  sat (== x)


sat                           :: (Char -> Bool) -> Parser Char
sat p                         =  do x <- item
                                    if p x then return x else failure
