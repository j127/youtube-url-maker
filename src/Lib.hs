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
extractVideoID fname =
    let x = helper $ reverse $ splitOn "." fname
    in  case x of
            Just a -> Just (reverse $ take 11 $ reverse a)
            _      -> Nothing

extractVideoIDs :: [FileName] -> [YouTubeURL]
extractVideoIDs = mapMaybe extractVideoID

makeVideoURL :: VideoID -> YouTubeURL
makeVideoURL vid = "https://www.youtube.com/watch?v=" ++ vid
