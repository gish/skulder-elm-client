module Update exposing (..)

import List.Extra exposing (unique)
import Messages exposing (Msg(..))
import Models exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )
    OnFetchDebts ( Ok newDebts ) ->
      ( onFetchDebts model newDebts, Cmd.none )
    OnFetchDebts ( Err error ) ->
      ( model, Cmd.none )


onFetchDebts : Model -> List Debt -> Model
onFetchDebts model debts =
  let
    newParticipants = List.map .receiver debts |> unique
    transaction = model.transaction
  in
    { model
    | debts = debts
    , transaction =
      { transaction
      | participants = newParticipants
      }
    }
