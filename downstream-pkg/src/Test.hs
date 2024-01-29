{-# LANGUAGE TemplateHaskell #-}

module Test where

import Control.Lens (makeFieldsNoPrefix)

data MyType = MyType
  { x :: Int
  }

$(makeFieldsNoPrefix ''MyType)
