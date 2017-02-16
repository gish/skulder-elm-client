module Messages exposing (..)

import Http
import Models exposing (..)

type Msg
  = NoOp
  | OnFetchDebts (Result Http.Error (List Debt))
