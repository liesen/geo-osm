-- | The @changeset@ element of a OSM file.
module Data.Geo.OSM.Changeset
(
  Changeset
, changeset
) where

import Text.XML.HXT.Arrow.Pickle
import Data.Geo.OSM.Tag
import Data.Geo.OSM.Lens.TagsL
import Data.Lens.Common
import Control.Comonad.Trans.Store

-- | The @changeset@ element of a OSM file.
newtype Changeset =
  Changeset [Tag]
  deriving Eq

-- | Constructs a @changeset@ with tags.
changeset ::
  [Tag] -- ^ The list of tags (@tag@ elements).
  -> Changeset
changeset =
  Changeset

instance XmlPickler Changeset where
  xpickle =
    xpElem "changeset" (xpWrap (changeset, \(Changeset r) -> r) (xpList xpickle))

instance Show Changeset where
  show =
    showPickled []

instance TagsL Changeset where
  tagsL =
    Lens $ \(Changeset tags) -> store (\tags -> Changeset tags) tags

