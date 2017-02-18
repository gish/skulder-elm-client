module DebtForm.Types exposing (..)

import Http exposing (..)

type alias TransactionModel =
  { participants : List String
  , formData : FormDataModel
  , isPosting : Bool
  }


type alias FormDataModel =
  { amount : Int
  , sender : String
  , receiver : String
  , share : Int
  , description : String
  }

initialFormData : FormDataModel
initialFormData =
  { amount = -1
  , sender = ""
  , receiver = ""
  , share = -1
  , description = ""
  }


initialModel : TransactionModel
initialModel =
  { participants = []
  , formData = initialFormData
  , isPosting = False
  }


type TransactionMsg
  = UpdateShare String
  | UpdateAmount String
  | UpdateDescription String
  | UpdateReceiver String
  | PostForm FormDataModel
  | OnPost ( Result Http.Error () )
