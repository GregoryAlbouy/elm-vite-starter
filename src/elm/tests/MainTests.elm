module MainTests exposing (testUpdate)

import Expect
import Fuzz exposing (int)
import Main exposing (Msg(..), update)
import Test exposing (Test, describe, fuzz)


testUpdate : Test
testUpdate =
    describe "update"
        [ fuzz int "increments counter" <|
            \randomInt ->
                Expect.equal
                    ({ count = randomInt, env = "" } |> update Increment |> Tuple.first)
                    { count = randomInt + 1, env = "" }
        ]
