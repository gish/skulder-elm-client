module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))
import Models exposing (Model, Debt)
import Views.Status exposing (status)
import Views.TransactionTable exposing (transactionTable)
import DebtForm.View exposing (..)

view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ status model.debts
    , DebtForm.View.view model.transaction
    , transactionTable model.debts
    ]



