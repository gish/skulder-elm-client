module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models exposing (Model, Debt)
import Messages exposing (Msg(..))

view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ div [ class "col-xs-12" ]
      [ h3 [ ] [ text "Transaktioner" ]
      , transactionTable model.debts ]
    ]


transactionTable : List Debt -> Html Msg
transactionTable debts =
  table [ class "table table-striped table-condensed table-bordered" ]
    [ transactionListHead
    ]
    --, transactionList ]


transactionListHead : Html Msg
transactionListHead =
  thead []
    [ tr []
      [ th [] [ text "Datum" ]
      , th [] [ text "Namn" ]
      , th [] [ text "Skuld" ]
      , th [] [ text "Beskrivning" ]
      ]
    ]

