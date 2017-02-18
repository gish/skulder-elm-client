module DebtForm.State exposing (..)

import DebtForm.Types exposing (..)
import DebtForm.Rest exposing (post)

update : TransactionMsg -> TransactionModel -> ( TransactionModel, Cmd TransactionMsg )
update msg model =
  case msg of
    UpdateShare ( share ) ->
      let
        formData = model.formData
      in
        ( { model
          | formData =
            { formData
            | share = (Result.withDefault 0 ( String.toInt share ) )
            }
          }, Cmd.none )
    UpdateAmount ( amount ) ->
      let
        formData = model.formData
      in
        ( { model
          | formData =
            { formData
            | amount = (Result.withDefault 0 ( String.toInt amount ) )
            }
          }, Cmd.none )
    UpdateDescription ( description ) ->
      let
        formData = model.formData
      in
        ( { model
          | formData =
            { formData
            | description = description
            }
          }, Cmd.none )
    UpdateReceiver ( receiver ) ->
      let
        formData = model.formData
        sender
          =  List.filter (\p -> p /= receiver ) model.participants
          |> List.head
          |> Maybe.withDefault ""
      in
        ( { model
          | formData =
            { formData
            | receiver = receiver
            , sender = sender
            }
          }, Cmd.none )
    PostForm ( formData ) ->
      ( { model | isPosting = True }, Cmd.batch [ post formData ] )
    OnPost _ ->
      ( { model
          | formData = DebtForm.Types.initialFormData
          , isPosting = False
        }, Cmd.none )
