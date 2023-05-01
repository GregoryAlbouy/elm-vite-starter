module HomePage exposing (main)

import Browser
import Html exposing (Html, a, button, div, h1, img, p, text)
import Html.Attributes exposing (alt, class, href, id, src, target)
import Html.Events exposing (onClick)
import Path


type alias Model =
    Int


type Msg
    = Increment


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )


view : Model -> Html Msg
view count =
    div
        [ class "homepage" ]
        [ viewLogo
            { path = "vite.svg"
            , alt = "Vite logo"
            , href = "https://vitejs.dev"
            , class = "logo"
            }
        , viewLogo
            { path = "elm.svg"
            , alt = "Elm logo"
            , href = "https://elm-lang.org"
            , class = "logo elm"
            }
        , h1 [] [ text "Vite + Elm" ]
        , viewCounter count
        , p
            [ class "read-the-docs" ]
            [ text "Click on the Vite and Elm logos to learn more" ]
        ]


viewLogo :
    { path : String
    , alt : String
    , href : String
    , class : String
    }
    -> Html msg
viewLogo att =
    a
        [ href att.href, target "_blank" ]
        [ img [ src <| Path.img att.path, alt att.alt, class att.class ] [] ]


viewCounter : Model -> Html Msg
viewCounter count =
    div
        [ class "card" ]
        [ button
            [ id "counter", onClick Increment ]
            [ text <| "count is " ++ String.fromInt count ]
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( 0, Cmd.none )
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
