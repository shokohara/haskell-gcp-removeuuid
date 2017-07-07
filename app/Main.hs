{-# LANGUAGE OverloadedStrings #-}
module Main where

import App
--import Data.Semigroup ((<>))
import Option
import Options.Generic

--sample :: Parser Option
--sample = Option <$> option auto (long "bucketName" <> help "Text") <*> option auto (long "prefix" <> help "Text")
--
--opts :: ParserInfo Option
--opts = info (sample <**> helper) ( fullDesc
--  <> progDesc "Print a greeting for TARGET"
--    <> header "hello - a test for optparse-applicative" )

--main :: IO ()
--main = execParser opts >>= run

main :: IO ()
main = getRecord "Remove UUID" >>= run

