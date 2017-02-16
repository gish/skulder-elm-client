module View exposing (..)

import DebtForm.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))
import Models exposing (Model, Debt)
import Views.Status exposing (status)
import Views.TransactionTable exposing (transactionTable)

view : Model -> Html Messages.Msg
view model =
  div [ class "container" ]
    [ status model.debts
    , Html.map TransactionMsg (DebtForm.View.view model.transaction)
    , transactionTable model.debts
    ]



