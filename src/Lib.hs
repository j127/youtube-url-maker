module Lib
    ( extractVideoIDs
    , makeVideoURL
    ) where

import           Data.List.Split                ( splitOn )

extractVideoID :: String -> String
extractVideoID p =
    let (_ : targetSegment : _) = reverse $ splitOn "." p
        reversedID              = take 11 $ reverse targetSegment
    in  reverse reversedID

makeVideoURL :: String -> String
makeVideoURL s = "https://www.youtube.com/watch?v=" ++ s

extractVideoIDs :: [String] -> [String]
extractVideoIDs = map extractVideoID
