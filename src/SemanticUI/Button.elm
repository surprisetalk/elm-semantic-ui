
module SemanticUI.Button exposing ( Button
                                  , Animation(..)
                                  , Outlook(..)
                                  , SocialSite(..)
                                  , button
                                  , iconButton
                                  , iconLabelButton
                                  , labelButton
                                  , animatedButton
                                  , toHtml
                                  , Traits
                                  , defaultTraits
                                  , configure
                                  )

-- TODO: SemanticUI.Button.Group
-- TODO:   conditionalGroup

-- TODO: which traits are mutually exclusive?

-- IMPORTS ---------------------------------------------------------------------

import List exposing ( reverse )

import SemanticUI exposing ( Size(..)
                           , Color(..)
                           , Emphasis(..)
                           , Alignment(..)
                           , HorizontalAlignment(..)
                           )

import SemanticUI.Icon as Icon exposing ( Icon )
import SemanticUI.Label as Label exposing ( Label )

import Html exposing ( Html, Attribute, div )
import Html.Attributes as Attr exposing ( class, classList )


-- BUTTON ----------------------------------------------------------------------

type Outlook = Positive
             | Negative

type SocialSite = Facebook
                | Twitter
                | Google
                | VK
                | LinkedIn
                | Instagram
                | YouTube

type Animation = Horizontal
               | Vertical
               | Fade

type Content msg = Anim (Html msg) (Html msg) Animation
                 | Body (Html msg)
                 | Ican      Icon  (Maybe (Html msg))
                 | IcanLabal Icon  (Button msg) HorizontalAlignment
                 |     Labal Label (Button msg) HorizontalAlignment

type Button msg = Button { attr    : (List (Attribute msg))
                         , traits  : Traits
                         , content : Content msg
                         }

button : Html msg -> Button msg
button html = Button { attr    = []
                     , traits  = defaultTraits
                     , content = Body html
                     }

iconButton : Icon -> Maybe (Html msg) -> Button msg
iconButton icon html = Button { attr    = []
                              , traits  = defaultTraits
                              , content = Ican icon html
                              }

animatedButton : Animation -> Html msg -> Html msg -> Button msg
animatedButton anim hidden visible = Button { attr    = []
                                            , traits  = defaultTraits
                                            , content = Anim hidden visible anim
                                            }


labelButton : HorizontalAlignment -> Label -> Button msg -> Button msg
labelButton align label button = Button { attr    = []
                                        , traits  = defaultTraits
                                        , content = Labal label button align
                                        }
              

iconLabelButton : HorizontalAlignment -> Icon -> Button msg -> Button msg
iconLabelButton align icon button = Button { attr    = []
                                           , traits  = defaultTraits
                                           , content = IcanLabal icon button align
                                           }


-- TRANSFORMS ------------------------------------------------------------------

(=>) : a -> b -> ( a, b )
(=>) = (,)

toHtml : Button msg -> Html msg
toHtml (Button {attr,traits,content})
  = let attr_ : String -> List (Attribute msg)
        attr_ s = flip (::) attr
                <| classList
                  [ "ui" => True
                  ,  s   => True

                  , "basic"    => Maybe.withDefault False traits.basic
                  , "inverted" => Maybe.withDefault False traits.inverted
                  , "compact"  => Maybe.withDefault False traits.compact
                  , "toggle"   => Maybe.withDefault False traits.toggle
                  , "fluid"    => Maybe.withDefault False traits.fluid
                  , "circular" => Maybe.withDefault False traits.circular

                  , case traits.outlook of
                      Nothing              -> ""                => False
                      Just Positive        -> "positive"        => True
                      Just Negative        -> "negative"        => True
                  , case traits.social of
                      Nothing              -> ""                => False
                      Just Facebook        -> "facebook"        => True
                      Just Twitter         -> "twitter"         => True
                      Just Google          -> "google"          => True
                      Just VK              -> "vk"              => True
                      Just LinkedIn        -> "linkedin"        => True
                      Just Instagram       -> "instagram"       => True
                      Just YouTube         -> "youtube"         => True
                  , case traits.state of
                      Nothing              -> ""                => False
                      Just Active          -> "active"          => True
                      Just Loading         -> "loading"         => True
                      Just Disabled        -> "disabled"        => True
                  , case traits.emphasis of
                      Nothing              -> ""                => False
                      Just Primary         -> "primary"         => True
                      Just Secondary       -> "secondary"       => True
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
                  , case traits.attach of
                      Nothing              ->    ""             => False
                      Just Top             ->    "top attached" => True
                      Just Left            ->   "left attached" => True
                      Just Right           ->  "right attached" => True
                      Just Bottom          -> "bottom attached" => True

                  , "button" => True
                  ]


    in case content of

         Body html -> 

           Html.button (attr_ "")
           [ html
           ]

         Ican icon html ->

           Html.button (attr_ "icon")
           <| (::) (Icon.toHtml icon)
           <| Maybe.withDefault []
           <| Maybe.map List.singleton
           <| html

         IcanLabal icon button align ->

           div (attr_ "labeled icon")
           <| (case align of
                HorizontalLeft  -> identity
                HorizontalRight -> reverse)
           <| [ button |>      toHtml
             , icon   |> Icon.toHtml
             ]

         Labal label button align ->

           div (attr_ "labeled")
           <| (case align of
                HorizontalLeft  -> identity
                HorizontalRight -> reverse)
           <| [ button |>       toHtml
             , label  |> Label.toHtml
             ]

         Anim hidden visible anim ->

           let attr__ : List (Attribute msg)
               attr__ = case anim of
                          Horizontal -> attr_          "animated"
                          Vertical   -> attr_ "vertical animated"
                          Fade       -> attr_          "animated fade"

               content__ : List (Html msg)
               content__ = [ div [ class  "hidden content" ] [ hidden  ]
                           , div [ class "visible content" ] [ visible ]
                           ]

           in Html.div attr__ content__



-- HTML ATTRIBUTES -------------------------------------------------------------

setHtmlAttributes : List (Attribute msg) -> Button msg -> Button msg
setHtmlAttributes attr_ (Button button)
  = Button { button | attr = attr_ }

addHtmlAttributes : List (Attribute msg) -> Button msg -> Button msg
addHtmlAttributes attr_ (Button ({attr} as button))
  = Button { button | attr = attr_ ++ attr }


-- TRAITS ----------------------------------------------------------------------

type State = Active
           | Loading
           | Disabled

type alias Traits = { outlook   : Maybe Outlook
                    , social    : Maybe SocialSite
                    , state     : Maybe State
                    , emphasis  : Maybe Emphasis
                    , color     : Maybe Color
                    , float     : Maybe HorizontalAlignment
                    , size      : Maybe Size
                    , attach    : Maybe Alignment
                    , basic     : Maybe Bool
                    , inverted  : Maybe Bool
                    , compact   : Maybe Bool
                    , toggle    : Maybe Bool
                    , fluid     : Maybe Bool
                    , circular  : Maybe Bool
                    }
  
defaultTraits : Traits
defaultTraits = { outlook   = Nothing
                , social    = Nothing
                , state     = Nothing
                , emphasis  = Nothing
                , color     = Nothing
                , float     = Nothing
                , size      = Nothing
                , attach    = Nothing
                , basic     = Nothing
                , inverted  = Nothing
                , compact   = Nothing
                , toggle    = Nothing
                , fluid     = Nothing
                , circular  = Nothing
                }
    
configure : Traits -> Button msg -> Button msg
configure traits_ (Button button)
  = Button { button | traits = traits_ }
     
-- outlook : Outlook -> Button -> Button
-- outlook outlook_ ((Button {traits}) as button)
--   = Button { button | { traits | outlook = outlook_ } }
     
-- social : SocialSite -> Button -> Button
-- social social_ ((Button {traits}) as button)
--   = Button { button | { traits | social = social_ } }
     
-- state : State -> Button -> Button
-- state state_ ((Button {traits}) as button)
--   = Button { button | { traits | state = state_ } }
     
-- animation : Animation -> Button -> Button
-- animation animation_ ((Button {traits}) as button)
--   = Button { button | { traits | animation = animation_ } }
     
-- emphasis : Emphasis -> Button -> Button
-- emphasis emphasis_ ((Button {traits}) as button)
--   = Button { button | { traits | emphasis = emphasis_ } }
     
-- color : Color -> Button -> Button
-- color color_ ((Button {traits}) as button)
--   = Button { button | { traits | color = color_ } }
     
-- label : Label -> Button -> Button
-- label label_ ((Button {traits}) as button)
--   = Button { button | { traits | label = label_ } }
     
-- float : HorizontalAlignment -> Button -> Button
-- float float_ ((Button {traits}) as button)
--   = Button { button | { traits | float = float_ } }
     
-- size : Size -> Button -> Button
-- size size_ ((Button {traits}) as button)
--   = Button { button | { traits | size = size_ } }
     
-- iconLabel : Icon -> Button -> Button
-- iconLabel icon_ ((Button {traits}) as button)
--   = Button { button | { traits | iconLabel = icon_ } }
     
-- basic : Button -> Button
-- basic ((Button {traits}) as button)
--   = Button { button | { traits | basic = True } }
     
-- inverted : Button -> Button
-- inverted ((Button {traits}) as button)
--   = Button { button | { traits | inverted = True } }
     
-- compact : Button -> Button
-- compact ((Button {traits}) as button)
--   = Button { button | { traits | compact = True } }
     
-- toggle : Button -> Button
-- toggle ((Button {traits}) as button)
--   = Button { button | { traits | toggle = True } }
     
-- fluid : Button -> Button
-- fluid ((Button {traits}) as button)
--   = Button { button | { traits | fluid = True } }
     
-- circular : Button -> Button
-- circular ((Button {traits}) as button)
--   = Button { button | { traits | circular = True } }
     
-- attach : HorizontalAlignment -> Button -> Button
-- attach ((Button {traits}) as button)
--   = Button { button | { traits | attach = True } }
     
-- attachVertical : VerticalAlignment -> Button -> Button
