module DebtForm.Types exposing (..)


type alias TransactionModel =
  { sender : String
  , receiver : String
  , formData : FormDataModel
  }


type alias FormDataModel =
  { amount : Int
  , sender : String
  , receiver : String
  , share : Int
  , description : String
  }


initialModel : TransactionModel
initialModel =
  { sender = ""
  , receiver = ""
  , formData =
    { amount = -1
    , sender = ""
    , receiver = ""
    , share = -1
    , description = ""
    }
  }


type TransactionMsg =
  NoOp
