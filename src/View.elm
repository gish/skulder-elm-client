module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import List exposing (head, tail, foldr, sum, filter, reverse)
import List.Extra exposing (unique)
import Models exposing (Model, Debt)
import Messages exposing (Msg(..))

view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ div [ class "col-xs-12" ]
      [ h3 [] [ text "Status" ]
      , status model.debts
      , h3 [] [ text "Transaktioner" ]
      , transactionTable model.debts ]
    ]


status : List Debt -> Html Msg
status debts =
  p []
    [ text (getUserInDebt debts)
    , text (toString (getHighestDebt debts))
    ]


getDebtByUserId : List Debt -> String -> Int
getDebtByUserId debts userId =
  let
    matchesId : String -> Debt -> Bool
    matchesId userId debt =
      userId == debt.receiver
  in
  filter (matchesId userId) debts
    |> List.map .amount
    |> sum


getHighestDebt : List Debt -> Int
getHighestDebt debts =
  getUniqueUserIds debts
  |> List.map (getDebtByUserId debts)
  |> foldr (-) 0
  |> abs


getUniqueUserIds : List Debt -> List String
getUniqueUserIds debts =
  List.map .receiver debts
  |> unique


getUserInDebt : List Debt -> String
getUserInDebt debts =
  let
    idUserA =
      head (getUniqueUserIds debts)
      |> Maybe.withDefault ""
    idUserB =
      head (reverse (getUniqueUserIds debts))
      |> Maybe.withDefault ""
    debtUserA = getDebtByUserId debts idUserA
    debtUserB = getDebtByUserId debts idUserB
  in
    if (debtUserA > debtUserB) then
      idUserA
    else
      idUserB


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
