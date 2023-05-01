port module Main exposing (Msg(..), main, update)

import Assets
import Browser
import Html exposing (Html, a, button, div, h1, img, p, text)
import Html.Attributes exposing (alt, class, href, id, src, target)
import Html.Events exposing (onClick)



-- I/O


port log : Model -> Cmd msg


type alias Flags =
    { env : String
    }



-- Main


main : Program Flags Model Msg
main =
    Browser.element
        { init = \{ env } -> ( { env = env, count = 0 }, Cmd.none )
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }



-- Model


type alias Model =
    { env : String
    , count : Int
    }



-- Update


type Msg
    = Increment


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, log model )



-- View


view : Model -> Html Msg
view model =
    div
        [ class "homepage" ]
        [ viewLogo
            { src = Assets.viteLogo
            , alt = "Vite logo"
            , href = "https://vitejs.dev"
            , class = "logo"
            }
        , viewLogo
            { src = Assets.elmLogo
            , alt = "Elm logo"
            , href = "https://elm-lang.org"
            , class = "logo elm"
            }
        , h1 [] [ text "Vite + Elm" ]
        , viewCounter model.count
        , p
            [ class "read-the-docs" ]
            [ text "Click on the Vite and Elm logos to learn more" ]
        ]


viewLogo :
    { src : String
    , alt : String
    , href : String
    , class : String
    }
    -> Html msg
viewLogo attrs =
    a
        [ href attrs.href, target "_blank" ]
        [ img [ src attrs.src, alt attrs.alt, class attrs.class ] []
        ]


viewCounter : Int -> Html Msg
viewCounter count =
    div
        [ class "card" ]
        [ button
            [ id "counter", onClick Increment ]
            [ text <| "count is " ++ String.fromInt count ]
        ]
