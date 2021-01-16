module Main where

import           System.Directory
import           Lib

main :: IO ()
main = do
    ds <- getArgs
    fs <- listDirectory $ head ds
    let ids  = extractVideoIDs fs
        urls = map makeVideoURL ids
    mapM_ putStrLn urls
