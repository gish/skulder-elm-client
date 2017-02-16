module DebtForm.Types exposing (..)


type alias TransactionModel =
  { participants : List String
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
  { participants = []
  , formData =
    { amount = -1
    , sender = ""
    , receiver = ""
    , share = -1
    , description = ""
    }
  }


type TransactionMsg
  = UpdateShare String
  | UpdateAmount String
  | UpdateDescription String
  | UpdateReceiver String
