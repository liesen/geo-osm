-- -- | Values with a @public@ boolean accessor.
module Data.Geo.OSM.Accessor.Public where

import Data.Geo.OSM.Accessor.Accessor

class Public a where
  public :: a -> Bool
  setPublic :: Bool -> a -> a

  usingPublic :: a -> (Bool -> Bool) -> a
  usingPublic = public `using` setPublic