module Messages exposing (..)

import Http
import Models exposing (..)
import DebtForm.Types

type Msg
  = NoOp
  | OnFetchDebts (Result Http.Error (List Debt))
  | TransactionMsg DebtForm.Types.TransactionMsg
