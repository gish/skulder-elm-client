module Views.TransactionTable exposing (transactionTable)

import Date exposing (..)
import Date.Format exposing (format)
import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (Model, Debt)
import Messages exposing (Msg(..))
import Utils.Amount exposing (formatAmount)

transactionTable : List Debt -> Html Msg
transactionTable debts =
  div [ class "row" ]
    [ div [ class "col-xs-12" ]
      [ h3 [] [ text "Transactions" ]
      , table [ class "table table-striped table-condensed table-bordered" ]
          [ transactionTableHead
          , transactionList debts ]
      ]
    ]


transactionTableHead : Html Msg
transactionTableHead =
  thead []
    [ tr []
      [ th [] [ text "Date" ]
      , th [] [ text "Name" ]
      , th [] [ text "Debt" ]
      , th [] [ text "Description" ]
      ]
    ]


transactionList : List Debt -> Html Msg
transactionList debts =
  tbody []
    ( List.sortBy .created_at debts
      |> List.reverse
      |> List.map transactionRow
    )

transactionRow : Debt -> Html Msg
transactionRow debt =
  tr []
    [ td [] [ text (formatTimestamp debt.created_at) ]
    , td [] [ text debt.receiver ]
    , td [] [ text ( toString ( formatAmount debt.amount ) ) ]
    , td [] [ text debt.description ]
    ]

formatTimestamp : Int -> String
formatTimestamp timestamp =
  Date.fromTime (toFloat timestamp)
  |> format "%Y/%m/%d"
