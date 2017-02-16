module DebtForm.View exposing (view)

import DebtForm.Types exposing (TransactionModel, FormDataModel, TransactionMsg(..))
import Html exposing (..)
import Html.Attributes exposing (class, type_, value, name)
import Html.Events exposing (onInput, onClick)

view : TransactionModel -> Html TransactionMsg
view model =
  div [ class "row" ]
    [ div [ class "col-xs-12" ]
      [ form []
        [ h3 [] [ text "Add debt" ]
        , receiverInput model.participants model.formData.receiver
        , (shareInput model.formData.share)
        , amountInput model.formData.amount
        , descriptionInput model.formData.description
        , button [ class "btn btn-primary pull-right", type_ "submit" ]
          [ text "Add transaction" ]
        ]
      ]
    ]


receiverInput : List String -> String -> Html TransactionMsg
receiverInput participants receiver =
  div [ class "form-group form-group-sm" ]
    (List.map receiverRadio participants)


receiverRadio : String -> Html TransactionMsg
receiverRadio participant =
  label []
    [ input [ name "receiver"
            , type_ "radio"
            , value participant
            , onClick (UpdateReceiver participant)
            ] []
    , text participant
    ]


shareInput : Int -> Html TransactionMsg
shareInput share =
  let
    parsedShare = if share == -1 then "" else toString share
  in
    div [ class "form-group form-group-sm" ]
      [ label [] [ text "owes" ]
      , div [ class "input-group" ]
        [ input [ class "input-group"
                , type_ "tel"
                , value parsedShare
                , onInput UpdateShare
                ] []
        , span [ class "input-group-addon" ] [ text "%" ]
        ]
      ]


amountInput : Int -> Html TransactionMsg
amountInput amount =
  let
    parsedAmount = if amount == -1 then "" else toString amount
  in
    div [ class "form-group form-group-sm" ]
      [ label [] [ text "of" ]
      , div [ class "input-group" ]
        [ input [ class "input-group"
                , type_ "tel"
                , value parsedAmount
                , onInput UpdateAmount
                ] []
        , span [ class "input-group-addon" ] [ text "SEK" ]
        ]
      ]


descriptionInput : String -> Html TransactionMsg
descriptionInput description =
  div [ class "form-group form-group-sm" ]
    [ label [] [ text "for" ]
    , div [ class "input-group" ]
        [ input [ class "input-group"
                , type_ "tel"
                , value description
                , onInput UpdateDescription
                ] []
      ]
    ]
