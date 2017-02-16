module Models exposing (..)

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
  }

initialDebt : Debt
initialDebt =
  { amount = 10
  , created_at = 20
  , description = "A car"
  , id = "13"
  , receiver = "12"
  , sender = "11"
  }

initialModel : Model
initialModel =
  { debts = [initialDebt]
  }
