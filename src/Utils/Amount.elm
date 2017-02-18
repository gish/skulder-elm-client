module Utils.Amount exposing (..)

formatAmount : Int -> Float
formatAmount amount =
  ( toFloat amount ) / 100
