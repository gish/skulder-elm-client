module Messages exposing (..)

import Http
import Models exposing (..)
import DebtForm.Types

type Msg
  = NoOp
  | DeleteTransaction String
  | OnDeleteTransaction ( Result Http.Error () )
  | OnFetchDebts ( Result Http.Error ( List Debt ) )
  | TransactionMsg DebtForm.Types.TransactionMsg
