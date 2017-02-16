module Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Models exposing (Debt)
import Messages exposing (Msg(..))

fetchAll : Cmd Msg
fetchAll =
  Http.get fetchAllUrl collectionDecoder
    |> Http.send OnFetchDebts


fetchAllUrl : String
fetchAllUrl =
  "http://skulder.gish.se/api/v1/transactions"


collectionDecoder : Decode.Decoder (List Debt)
collectionDecoder =
  Decode.list debtDecoder


debtDecoder : Decode.Decoder Debt
debtDecoder =
  Decode.map6 Debt
    (field "amount" Decode.int)
    (field "created_at" Decode.int)
    (field "description" Decode.string)
    (field "id" Decode.string)
    (field "receiver" Decode.string)
    (field "sender" Decode.string)
