module Commands exposing (..)

import Http exposing (..)
import Json.Decode as Decode
import Json.Encode as Encode
import Models exposing (Debt)
import Messages exposing (Msg(..))

fetchAll : Cmd Msg
fetchAll =
  Http.get fetchAllUrl collectionDecoder
    |> Http.send OnFetchDebts


fetchAllUrl : String
fetchAllUrl =
  "http://localhost:4000/transactions"


collectionDecoder : Decode.Decoder (List Debt)
collectionDecoder =
  Decode.list debtDecoder


debtDecoder : Decode.Decoder Debt
debtDecoder =
  Decode.map6 Debt
    (Decode.field "amount" Decode.int)
    (Decode.field "created_at" Decode.int)
    (Decode.field "description" Decode.string)
    (Decode.field "id" Decode.string)
    (Decode.field "receiver" Decode.string)
    (Decode.field "sender" Decode.string)


deleteTransaction : String -> Cmd Msg
deleteTransaction id =
  deleteRequest id
    |> Http.send OnDeleteTransaction


deleteRequest : String -> Http.Request ()
deleteRequest id =
  Http.request
    { body = Http.jsonBody (Encode.object [])
    , headers = []
    , method = "DELETE"
    , timeout = Nothing
    , expect = expectStringResponse (\_ -> Ok ())
    , url = (deleteUrl id)
    , withCredentials = False
    }


deleteUrl : String -> String
deleteUrl id =
  "http://localhost:4000/transactions/" ++ id
