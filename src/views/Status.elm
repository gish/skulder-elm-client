module Views.Status exposing (status)

import Html exposing (..)
import Html.Attributes exposing (class)
import List exposing (head, tail, foldr, sum, filter, reverse)
import List.Extra exposing (unique)
import Messages exposing (Msg(..))
import Models exposing (Model, Debt)
import Utils.Amount exposing (formatAmount)

status : List Debt -> Html Msg
status debts =
  div [ class "row" ]
    [ div [ class "col-xs-12" ]
      [ h3 [] [ text "Status" ]
      , p []
          [ text (getUserInDebt debts)
          , text " owes "
          , text ( toString ( formatAmount ( getHighestDebt debts ) ) )
          , text " SEK."
          ]
      ]
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
