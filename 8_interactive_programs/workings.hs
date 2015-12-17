import Prelude hiding (getLine, putStr, putStrLn)

-- Type representing a character position.
--
type Pos = (Int, Int)

-- Read a string of characters from the keyboard.
--
getLine :: IO String
getLine = do x <- getChar
             if x == '\n' then
               return []
             else
               do xs <- getLine
                  return (x:xs)

-- Write a string to the screen.
--
putStr :: String -> IO ()         
putStr xs = seqn [putChar x | x <- xs]

-- Write a string to the screen.
-- (longer form)
-- putStr [] = return ()
-- putStr (x:xs) = do putChar x
                   -- putStr xs

-- Write a string to the screen and move to a new line.
--
putStrLn :: String -> IO ()
putStrLn xs = do putStr xs
                 putChar '\n'

-- Prompt for a string and report string length at the terminal.
--
strlen :: IO ()
strlen = do putStr "Enter a string: "
            xs <- getLine
            putStr "Your string has "
            putStr (show (length xs))
            putStrLn " characters."

-- Generate a beep.
--
beep :: IO ()
beep = putStr "\BEL"

-- Clear the screen.
--
cls :: IO ()
cls = putStr "\ESC[2J"

-- Move the cursor to a given position.
--
goto :: Pos -> IO ()
goto (x,y) = putStr ("\ESC[" ++ show y ++ ";" ++ show y ++ "H")

-- Display a string at a given position.
--
writeat :: Pos -> String -> IO ()
writeat p xs = do goto p
                  putStr xs

-- Perform a list of actions in sequence, discard the result values
-- and return no result.
--
seqn :: [IO a] -> IO ()
seqn [] = return ()
seqn (a:as) = do a
                 seqn as
