module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )
    OnFetchDebts ( Ok newDebts ) ->
      ( { model | debts = newDebts }, Cmd.none )
    OnFetchDebts ( Err error ) ->
      ( model, Cmd.none )
