module PathTests exposing (testImg)

import Expect
import Fuzz exposing (string)
import Path
import Test exposing (Test, describe, fuzz)


testImg : Test
testImg =
    describe "Path.img"
        [ fuzz string "computes full image path" <|
            \randomString ->
                Expect.equal
                    ("/public/assets/images/" ++ randomString)
                    (Path.img randomString)
        ]
