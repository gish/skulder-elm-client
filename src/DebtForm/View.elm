module DebtForm.View exposing (view)

import DebtForm.Types exposing (TransactionModel, FormDataModel, TransactionMsg(..))
import Html exposing (..)
import Html.Attributes exposing (class, type_, value, name, checked)
import Html.Events exposing (onInput, onClick)

view : TransactionModel -> Html TransactionMsg
view model =
  div [ class "row" ]
    [ div [ class "col-xs-12" ]
      [ h3 [] [ text "Add debt" ]
      , receiverInput model.participants model.formData.receiver
      , (shareInput model.formData.share)
      , amountInput model.formData.amount
      , descriptionInput model.formData.description
      , button [ class "btn btn-primary pull-right", type_ "submit", onClick (PostForm model.formData) ]
        [ text "Add transaction" ]
      ]
    ]


receiverInput : List String -> String -> Html TransactionMsg
receiverInput participants receiver =
  div [ class "form-group form-group-sm" ]
    (List.map (receiverRadio receiver) participants)


receiverRadio : String -> String -> Html TransactionMsg
receiverRadio receiver participant =
  label []
    [ input [ name "receiver"
            , checked (receiver == participant)
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
        [ input [ class "form-control"
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
        [ input [ class "form-control"
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
    , input [ class "form-control"
        , value description
        , onInput UpdateDescription
        ] []
    ]
