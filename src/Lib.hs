module Lib
    ( extractVideoIDs
    , makeVideoURL
    ) where

import           Data.List.Split                ( splitOn )
import           Data.Maybe                     ( mapMaybe )

type YouTubeURL = String
type FileName = String
type VideoID = String

-- not all files in a directory will have a target segment
helper :: [String] -> Maybe String
helper (_ : targetSegment : _) = Just targetSegment
helper _                       = Nothing

-- not all files will have a VideoID
extractVideoID :: FileName -> Maybe VideoID
extractVideoID p =
    let f = helper $ reverse $ splitOn "." p
    in  case f of
            Just a -> Just (reverse $ take 11 $ reverse a)
            _      -> Nothing

extractVideoIDs :: [FileName] -> [YouTubeURL]
extractVideoIDs = mapMaybe extractVideoID

makeVideoURL :: VideoID -> YouTubeURL
makeVideoURL s = "https://www.youtube.com/watch?v=" ++ s
