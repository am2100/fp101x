Interactive programs - Hutton Ch 9
==================================

The input/output type
---------------------

An interactive program is a pure function
that takes the current "state of the world" as its argument
and returns a modified "state of the world as its result
where the modified world reflects all side-effects performed by the program.

Given type World
whose values represent the current "state of the world"
an interactive program is function of type:

World -> World

which we abbreviate as:

type IO = World -> World

Where an interactive program returns a result value in addition to performing side effects, we generalise our type to return a result value, with the type of such values being a parameter of the IO type:

type IO a = World -> (a, World)

Expressions of type IO are called actions.

IO Char -- an action that returns a character

IO ()   -- an action that returns an empty tuple as a dummy result value.
        -- This is a purely side-effecting action that returns no result value.

Interactive programs may also require argument values. This behaviour can be achieved by currying. For example, a program that takes a character and returns an integer would have type:

Char -> IO Int

which is an abbreviation of the curried function type:

Char -> World -> (Int, World)

the definition of which would look like:

f c = \world -> (c, world)

Basic actions
-------------

getChar :: IO Char -- reads a character from the keyboard and echoes it to the screen.
getChar = ...      -- cannot be defined in Haskell, but is built in to Hugs.

putChar :: IO ()   -- writes a character to the screen and returns no result value.
putChar c = ...

return :: a -> IO a -- creates an IO action that always yields a desired result.
return v = \world -> (v, world)

Sequencing
----------

One action can be executed in sequence after another with the (>>=) 'then' operator. In this way, the modified world returned by the first action is used as the current world for the second action.

(>>=) :: IO a -> (a -> IO b) -> IO b
f >>= g = \world -> case f world of
                         (v, world') -> g v world'

1. Apply action f to the current world
2. Apply function g to the result, producing a second action
3. Apply second action to modified world

As with parsers however, do notation expresses actions defined by (>>=) in a more readable form:

For example, using the do notation the primitive getChar could be dcomposed into the actions of reading a character from the keyboard, echoing it to the screen, and returning the character as the result:

> module IOExtensions where
>   readBinaryFile     :: FilePath -> IO String
>   writeBinaryFile    :: FilePath -> String -> IO ()
>   appendBinaryFile   :: FilePath -> String -> IO ()
>   openBinaryFile     :: FilePath -> IOMode -> IO Handle

>   getCh              :: IO Char
>   argv               :: [String]

> getChar :: IO Char
> getChar = do 
>            x <- getCh
>            putChar x
>            return x

The action getCh reads a character without echoing it to the screen. This is not included in the standard Prelude, but is provided as an extension to Hugs. It can be made available in any script by including the filliwing special line:

primitive getCh :: IO Char
