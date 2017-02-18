module Update exposing (..)

import Commands exposing (fetchAll)
import DebtForm.State exposing (update)
import DebtForm.Types exposing (..)
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
    TransactionMsg ( OnPost msg ) ->
      let
        ( updatedTransaction, cmd) =
          DebtForm.State.update (OnPost msg) model.transaction
      in
         ( { model | transaction = updatedTransaction }, Cmd.batch [fetchAll, ( Cmd.map TransactionMsg cmd )] )
    TransactionMsg subMsg ->
      let
        ( updatedTransaction, cmd) =
          DebtForm.State.update subMsg model.transaction
      in
         ( { model | transaction = updatedTransaction }, Cmd.map TransactionMsg cmd )


onFetchDebts : Model -> List Debt -> Model
onFetchDebts model debts =
  let
    newParticipants = List.map .receiver debts |> unique
    transaction = model.transaction
    formData = transaction.formData
  in
    { model
    | debts = debts
    , transaction =
      { transaction
      | participants = newParticipants
      , formData =
        { formData
        | receiver = Maybe.withDefault "" (List.head newParticipants)
        }
      }
    }
