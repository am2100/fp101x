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
