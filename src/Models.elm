module Models exposing (..)

import DebtForm.Types exposing (TransactionModel)

type alias Debt =
  { amount : Int
  , created_at : Int
  , description : String
  , id : String
  , receiver : String
  , sender : String
  }


type alias Model =
  { debts : List Debt
  , transaction : TransactionModel
  }


initialModel : Model
initialModel =
  { debts = []
  , transaction = DebtForm.Types.initialModel
  }
