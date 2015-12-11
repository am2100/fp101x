#! usr/local/bin/runhugs +l

> module Main where

> import System.Environment

> main = do 
>        args <- getArgs
>        putStrLn (unwords args)
