module Commands exposing (..)

import Http
import Json.Decode as Decode
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
