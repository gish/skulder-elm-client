module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )
