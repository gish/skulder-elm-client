module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg(..))
import Models exposing (Model, Debt)
import Views.Status exposing (status)
import Views.TransactionTable exposing (transactionTable)

view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ div [ class "col-xs-12" ]
      [ h3 [] [ text "Status" ]
      , status model.debts
      , h3 [] [ text "Transaktioner" ]
      , transactionTable model.debts ]
    ]



