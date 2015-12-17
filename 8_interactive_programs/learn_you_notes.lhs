---

module Main where

import System.Environment

main = do 
       args <- getArgs
       putStrLn (unwords args)

---

main = do
  putStrLn "Hello, what's your name?"
  name <- getLine
  putStrLn ("Hey " ++ name ++ ", you rock!")

---

import Data.Char

main = do
  putStrLn "What's your first name?"
  firstName <- getLine
  putStrLn "what's your last name?"
  lastName <- getLine
  let bigFirstName = map toUpper firstName
      bigLastName  = map toUpper lastName
  putStrLn $ "Hey " ++ bigFirstName ++ " "
                    ++ bigLastName
                    ++ ", how are you?"

---

main = do
       line <- getLine
       if null line
         then return ()
         else do
              putStrLn $ reverseWords line
              main

reverseWords :: String -> String
reverseWords = unwords . map reverse . \xs -> words xs

---

import Data.Char

main = do
  contents <- getContents
  putStr $ map toUpper contents

---

main = do
  contents <- getContents
  putStr (shortlinesonly contents)

shortlinesonly :: String -> String
shortlinesonly = unlines . filter (\line -> length line < 10) . lines

---

main = do
  interact shortlinesonly

shortlinesonly :: String -> String
shortlinesonly = unlines . filter (\line -> length line < 10) . lines

---

main = interact respondPalindromes

respondPalindromes :: String -> String
respondPalindromes =
  unlines .
  map (\xs -> if isPal xs then "Palindrome" else "Not Palindrome") .
  lines

isPal :: String -> Bool
isPal xs = xs == reverse xs

---

import System.IO

main = do handle <- openFile "girlfriend.txt" ReadMode
          contents <- hGetContents handle
          putStr contents
          hClose handle
          
---

import System.IO
import Control.Exception

main = do
  withFile "girlfriend.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    putStr contents)

withFile :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
withFile name mode f = bracket (openFile name mode)
  (\handle -> hClose handle)
  (\handle -> f handle)

---

import System.IO

main = do contents <- readFile "girlfriend.txt"
          putStr contents

---

> import System.IO
> import Data.Char

> main = do contents <- readFile "girlfriend.txt"
>           writeFile "girlfriendcaps.txt" (map toUpper contents)


