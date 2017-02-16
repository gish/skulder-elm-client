module DebtForm.State exposing (..)

import DebtForm.Types exposing (..)

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
