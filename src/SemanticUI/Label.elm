
module SemanticUI.Label exposing ( Label
                                 , label
                                 , ribbonLabel
                                 , tagLabel
                                 , circleLabel
                                 , cornerLabel
                                 , pointingLabel
                                 , imageLabel
                                 , floatingLabel
                                 , inlineLabel
                                 , addBody
                                 , addIcon
                                 , addDetail
                                 , setHtmlAttributes
                                 , addHtmlAttributes
                                 , toHtml
                                 , Traits
                                 , defaultTraits
                                 , configure
                                 )

-- TODO: group

-- TODO: attach to segment in Segment
-- TODO: attach to things with attachRibbonLabel

{-| TODO

# Labels
@docs Label, label, ribbonLabel, tagLabel, circleLabel, cornerLabel, pointingLabel, imageLabel, floatingLabel, inlineLabel

## Content
@docs addBody, addIcon, addDetail

## Traits
@docs Traits, defaultTraits, configure

## HTML
@docs toHtml, setHtmlAttributes, addHtmlAttributes

-}

-- IMPORTS ---------------------------------------------------------------------

import Html exposing ( Html, Attribute, div )
import Html.Attributes exposing ( class, classList )

import SemanticUI exposing ( Size(..)
                           , Color(..)
                           , Alignment(..)
                           , HorizontalAlignment(..)
                           )

import SemanticUI.Image as Image exposing ( Image )

import SemanticUI.Icon as Icon exposing ( Icon )

-- LABEL -----------------------------------------------------------------------

type LabelType msg = Default
                   | Ribbon
                   | Tag
                   | Circle
                   | Corner HorizontalAlignment
                   | Pointing Alignment
                   | Img (Image msg)
                   | Floating
                   | Inline

{-| TODO
-}
type Label msg = Label (LabelType msg) Traits (List (Attribute msg)) (List (Content msg))

{-| TODO
-}
label : Label msg
label = Label Default defaultTraits [] []

{-| TODO
-}
ribbonLabel : Label msg
ribbonLabel = Label Ribbon defaultTraits [] []

{-| TODO
-}
tagLabel : Label msg
tagLabel = Label Tag defaultTraits [] []

{-| TODO
-}
circleLabel : Label msg
circleLabel = Label Circle defaultTraits [] []

{-| TODO
-}
cornerLabel : HorizontalAlignment -> Label msg
cornerLabel d = Label (Corner d) defaultTraits [] []

{-| TODO
-}
pointingLabel : Alignment -> Label msg
pointingLabel d = Label (Pointing d) defaultTraits [] []

{-| TODO
-}
imageLabel : Image msg -> Label msg
imageLabel i = Label (Img i) defaultTraits [] []

{-| TODO
-}
floatingLabel : Label msg
floatingLabel = Label Floating defaultTraits [] []

{-| TODO
-}
inlineLabel : Label msg
inlineLabel = Label Inline defaultTraits [] []


-- CONTENT ---------------------------------------------------------------------

type Content msg = Bod (Html msg)
                 | Dtl (Html msg)
                 | Icn Icon

addContent : Content msg -> Label msg -> Label msg
addContent c_ (Label l t a c) = c ++ [ c_ ] |> Label l t a

{-| TODO
-}
addBody : Html msg -> Label msg -> Label msg
addBody = Bod >> addContent

{-| TODO
-}
addIcon : Icon -> Label msg -> Label msg
addIcon = Icn >> addContent

{-| TODO
-}
addDetail : Html msg -> Label msg -> Label msg
addDetail = Dtl >> addContent
-- TODO: detail links ?


-- ATTRIBUTES ------------------------------------------------------------------

{-| TODO
-}
setHtmlAttributes : List (Attribute msg) -> Label msg -> Label msg
setHtmlAttributes attr_ (Label l t _ c)
  = Label l t attr_ c


{-| TODO
-}
addHtmlAttributes : List (Attribute msg) -> Label msg -> Label msg
addHtmlAttributes attr_ (Label l t attr c)
  = Label l t (attr_ ++ attr) c


-- TRANSFORMS ------------------------------------------------------------------

(=>) : a -> b -> ( a, b )
(=>) = (,)

{-| TODO
-}
toHtml : Label msg -> Html msg
toHtml (Label typ traits attr content)
  = let toHtml_ : Content msg -> Html msg
        toHtml_ c = case c of
                      Bod html -> html
                      Dtl html -> div [ class "detail" ] [ html ]
                      Icn icon -> Icon.toHtml icon

        content_ : List (Html msg)
        content_ = content |> List.map toHtml_

        attr_ : String -> List (Attribute msg)
        attr_ s = flip (::) attr
                <| classList
                  [ "ui" => True
                  ,  s   => True

                  , case content of
                      [] -> "empty" => True
                      _  -> ""      => False

                  , "basic"      => Maybe.withDefault False traits.basic

                  , case traits.color of
                      Nothing              -> ""                => False
                      Just Red             -> "red"             => True
                      Just Orange          -> "orange"          => True
                      Just Yellow          -> "yellow"          => True
                      Just Olive           -> "olive"           => True
                      Just Green           -> "green"           => True
                      Just Teal            -> "teal"            => True
                      Just Blue            -> "blue"            => True
                      Just Violet          -> "violet"          => True
                      Just Purple          -> "purple"          => True
                      Just Pink            -> "pink"            => True
                      Just Brown           -> "brown"           => True
                      Just Grey            -> "grey"            => True
                      Just Black           -> "black"           => True
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

                  , "label" => True
                  ]

        div_ : String -> Html msg
        div_ = attr_ >> flip div content_

    in case typ of

         Default ->

           div_ ""

         Ribbon ->

           div_ "ribbon"

         Tag -> 

           div_ "tag"

         Circle ->

           div_ "circular"

         Corner align ->

           case align of
             HorizontalLeft  -> div_  "left corner"
             HorizontalRight -> div_ "right corner"

         Pointing align ->

           case align of
             Up    -> div_ "pointing "
             Down  -> div_ "pointing below"
             Left  -> div_ "pointing left"
             Right -> div_ "pointing right"

         Img img ->

           div ( attr_ "image" ) <| Image.toHtml img :: content_

         Floating -> 

           div_ "floating"

         Inline ->

           div_ "inline"



-- TRAITS ----------------------------------------------------------------------

{-| TODO
-}
type alias Traits = { basic : Maybe Bool
                    , color : Maybe Color
                    , size  : Maybe Size
                    }

{-| TODO
-}
defaultTraits : Traits
defaultTraits = { basic = Nothing
                , color = Nothing
                , size  = Nothing
                }

{-| TODO
-}
configure : Traits -> Label msg -> Label msg
configure traits_ (Label l _ a c)
  = Label l traits_ a c


