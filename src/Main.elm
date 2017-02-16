module Main exposing (..)

import Html exposing (program)
import Messages exposing (Msg(..))
import Models exposing (..)
import Update exposing (update)
import View exposing (view)

init : ( Model, Cmd Msg )
init =
  ( initialModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
