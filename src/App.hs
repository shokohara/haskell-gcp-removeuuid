{-# LANGUAGE OverloadedStrings #-}

module App where

import           Control.Lens ((&), (.~), (<&>), (?~), (^.))
import           Control.Monad
--import           Control.Monad.IO.Class (MonadIO (..))
import           Control.Monad.Trans.Resource (runResourceT)
--import           Data.Maybe
import           Data.Text (Text)
import qualified Data.Text as T
import Debug.Trace
import           Network.Google
import qualified Network.Google as Google
--import           Network.Google.Storage
import           Network.Google.Storage as Storage
--import qualified Network.HTTP.Client as Client
--import           Network.HTTP.Client
import           Option
--import qualified Option as O
import           System.IO (stdout, hGetContents)
--import           System.Process

keyName :: Text
keyName = "thisiskey"

keyPrefix :: Text
keyPrefix = "uuid"

run :: Option -> IO ()
run config = do
  print $ show config
  --fun config >>= print . show <$> flip (^.) oItems
--  x <- fun config Nothing >>= \x -> (print . show) x
  --traceIO . show <$> fun config Nothing []
  os <- fun config $ keyPrefix `T.append` "-" `T.append` keyName
  traceIO . show $ os
  --mapM_ (traceIO . show) os
--  return ()

--flat :: [Objects] -> [Object]
--flat os = concat $ flip (^.) oItems <$> os

fun :: Option -> Text -> IO Objects
fun c p = do
  lgr <- Google.newLogger Google.Debug stdout
  env <- Google.newEnv <&> (Google.envLogger .~ lgr) . (Google.envScopes .~ Storage.storageFullControlScope)
  runResourceT . Google.runGoogle env $ Google.send $ objectsList (bucketName c) & olPrefix .~ Just p & olMaxResults .~ Just 1000

