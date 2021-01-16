module Main where

import           System.Directory
import           Lib

main :: IO ()
main = do
    fs <- listDirectory "."
    let ids  = extractVideoIDs fs
        urls = map makeVideoURL ids
    mapM_ putStrLn urls
