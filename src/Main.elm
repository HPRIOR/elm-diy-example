module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text, textarea)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)
import String exposing (length)



-- UPDATE


type Msg
    = SaveInput
    | UpdateInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        SaveInput ->
            { data = model.input, input = "" }

        UpdateInput str ->
            { model | input = str }



-- MODEL


type alias Model =
    { data : String
    , input : String
    }


initModel : Model
initModel =
    { data = "Hello, World!"
    , input = ""
    }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model.data ]
        , div [] [ button [ onClick SaveInput ] [ text "click me" ] ]
        , div [] [ textarea [ onInput UpdateInput, value model.input ] [] ]
        , div [] [text (String.fromInt(length model.data))]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }
