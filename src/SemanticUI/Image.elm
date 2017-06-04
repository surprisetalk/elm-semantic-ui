
module SemanticUI.Image exposing ( Image
                                 , toHtml
                                 )

-- TODO: groups

-- IMPORTS ---------------------------------------------------------------------

import SemanticUI exposing ( Size(..)
                           , Color(..)
                           , VerticalAlignment(..)
                           , HorizontalAlignment(..)
                           )

import Html exposing ( Html, Attribute, div, img )
import Html.Attributes as Attr exposing ( src, classList )


-- IMAGE -----------------------------------------------------------------------

type Content msg = Link String
                 | Body (List (Html msg))

type Image msg = Image { traits  : Traits
                       , attr    : List (Attribute msg)
                       , content : Content msg
                       }

image : String -> Image msg
image url = Image { traits  = defaultTraits
                  , attr    = []
                  , content = Link url
                  }
            
imageWrap : List (Html msg) -> Image msg
imageWrap body = Image { traits  = defaultTraits
                       , attr    = []
                       , content = Body body
                       }


-- TRANSFORMS ------------------------------------------------------------------

(=>) : a -> b -> ( a, b )
(=>) = (,)

toHtml : Image msg -> Html msg
toHtml (Image {traits,attr,content})
  = let attr_ : List (Attribute msg)
        attr_ = flip (::) attr
              <| classList
                [ "ui" => True

                , "fluid"    => Maybe.withDefault False traits.fluid
                , "centered" => Maybe.withDefault False traits.centered
                , "bordered" => Maybe.withDefault False traits.bordered
                , "spaced"   => Maybe.withDefault False traits.spaced
                  
                , case traits.shape of
                    Nothing              -> ""                => False
                    Just Default         -> ""                => True
                    Just Avitar          -> "avitar"          => True
                    Just Rounded         -> "rounded"         => True
                    Just Circular        -> "circular"        => True
                , case traits.state of
                    Nothing              -> ""                => False
                    Just Active          -> ""                => True
                    Just Hidden          -> "hidden"          => True
                    Just Disabled        -> "disabled"        => True
                , case traits.verticalAlignment of
                    Nothing              -> ""                => False
                    Just VerticalBottom  -> "bottom aligned"  => True
                    Just VerticalMiddle  -> "middle aligned"  => True
                    Just VerticalTop     ->    "top aligned"  => True
                , case traits.float of
                    Nothing              -> ""                => False
                    Just HorizontalRight -> "right floated"   => True
                    Just HorizontalLeft  ->  "left floated"   => True
                , case traits.size of
                    Nothing              -> ""                => False
                    Just Mini            -> "mini"            => True
                    Just Tiny            -> "tiny"            => True
                    Just Small           -> "small"           => True
                    Just Medium          -> "medium"          => True
                    Just Large           -> "large"           => True
                    Just Big             -> "big"             => True
                    Just Huge            -> "huge"            => True
                    Just Massive         -> "massive"         => True
                  
                , "image" => True
                ]

    in case content of
         Link url -> img (src url :: attr_) []
         Body bod -> div             attr_  bod


-- HTML ATTRIBUTES -------------------------------------------------------------

setHtmlAttributes : List (Attribute msg) -> Image msg -> Image msg
setHtmlAttributes attr_ (Image image)
  = Image { image | attr = attr_ }

addHtmlAttributes : List (Attribute msg) -> Image msg -> Image msg
addHtmlAttributes attr_ (Image ({attr} as image))
  = Image { image | attr = attr_ ++ attr }


-- TRAITS ----------------------------------------------------------------------

type Shape = Default
           | Avitar
           | Rounded
           | Circular

type State = Active
           | Hidden
           | Disabled

type alias Traits = { shape             : Maybe Shape
                    , state             : Maybe State
                    , bordered          : Maybe Bool
                    , fluid             : Maybe Bool
                    , centered          : Maybe Bool
                    , spaced            : Maybe Bool
                    , verticalAlignment : Maybe VerticalAlignment
                    , float             : Maybe HorizontalAlignment
                    , size              : Maybe Size
                    }

defaultTraits : Traits
defaultTraits = { shape             = Nothing
                , state             = Nothing
                , bordered          = Nothing
                , fluid             = Nothing
                , centered          = Nothing
                , spaced            = Nothing
                , verticalAlignment = Nothing
                , float             = Nothing
                , size              = Nothing
                }
