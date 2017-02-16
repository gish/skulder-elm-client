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


initialModel : Model
initialModel =
  { debts = []
  }
