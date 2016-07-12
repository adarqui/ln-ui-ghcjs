{-# LANGUAGE OverloadedStrings #-}

module Main (
  main
) where



import           LN.UI.Main (runMain)
import Haskell.Api.Helpers

data Test
  = Test1
  | Test2

instance QueryParam Test where
  qp Test1 = ("test1", "")
  qp Test2 = ("test2", "")



main :: IO ()
main = runMain
