{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}
module Option where

import Data.Text
import Options.Generic

data Option =  Option {
                      bucketName :: Text
                      , prefix :: Text
                      } deriving (Generic, Show, ParseRecord)

