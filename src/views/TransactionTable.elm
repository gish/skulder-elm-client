module Views.TransactionTable exposing (transactionTable)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (Model, Debt)
import Messages exposing (Msg(..))

transactionTable : List Debt -> Html Msg
transactionTable debts =
  table [ class "table table-striped table-condensed table-bordered" ]
    [ transactionTableHead
    , transactionList debts ]


transactionTableHead : Html Msg
transactionTableHead =
  thead []
    [ tr []
      [ th [] [ text "Datum" ]
      , th [] [ text "Namn" ]
      , th [] [ text "Skuld" ]
      , th [] [ text "Beskrivning" ]
      ]
    ]


transactionList : List Debt -> Html Msg
transactionList debts =
  tbody []
    ( List.map transactionRow debts )


transactionRow : Debt -> Html Msg
transactionRow debt =
  tr []
    [ td [] [ text ( toString debt.created_at ) ]
    , td [] [ text debt.receiver ]
    , td [] [ text ( toString debt.amount ) ]
    , td [] [ text debt.description ]
    ]
