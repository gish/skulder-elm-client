module Views.Status exposing (status)

import Html exposing (..)
import List exposing (head, tail, foldr, sum, filter, reverse)
import List.Extra exposing (unique)
import Messages exposing (Msg(..))
import Models exposing (Model, Debt)

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
