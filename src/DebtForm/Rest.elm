module DebtForm.Rest exposing (..)

import DebtForm.Types exposing (FormDataModel, TransactionMsg(..))
import Json.Encode as Encode
import Http exposing (..)


postTransactionUrl : String
postTransactionUrl =
  "http://localhost:4000/transactions"


postTransaction : FormDataModel -> Http.Request ()
postTransaction formData =
  Http.request
    { body = memberEncoded formData |> Http.jsonBody
    , headers = []
    , method = "POST"
    , timeout = Nothing
    , expect = expectStringResponse (\_ -> Ok ())
    , url = postTransactionUrl
    , withCredentials = False
    }


post : FormDataModel -> Cmd TransactionMsg
post formData =
  postTransaction formData
    |> Http.send OnPost


memberEncoded : FormDataModel -> Encode.Value
memberEncoded formData =
  let
    amount = formData.amount * formData.share
    list =
      [ ( "amount", Encode.int amount )
      , ( "description", Encode.string formData.description )
      , ( "receiver", Encode.string formData.receiver )
      , ( "sender", Encode.string formData.sender )
      ]
  in
     list |> Encode.object
