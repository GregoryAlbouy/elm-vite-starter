module Main exposing (Model, main)

import Browser
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (class, src)
import Path


type alias Model =
    String


view : Model -> Browser.Document msg
view model =
    { title = model
    , body =
        [ viewWelcome model
        ]
    }


viewWelcome : String -> Html msg
viewWelcome message =
    div [ class "welcome" ]
        [ h1 [] [ text message ]
        , img [ src (Path.img "elm-logo.svg") ] []
        ]


main : Program () Model msg
main =
    Browser.document
        { init = \_ -> ( "Hello, World!", Cmd.none )
        , update = \_ model -> ( model, Cmd.none )
        , subscriptions = \_ -> Sub.none
        , view = view
        }
