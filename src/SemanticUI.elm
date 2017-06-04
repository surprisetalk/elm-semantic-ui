
module SemanticUI exposing ( Size(..)
                           , Color(..)
                           , Emphasis(..)
                           , Alignment(..)
                           , TextAlignment(..)
                           , HorizontalAlignment(..)
                           )

{-| This is an opinionated interface for [Semantic-UI]().

Components' `setHtmlAttributes` functions don't work well with `Html.Attributes.class`.
Please avoid adding your own classes to the components for now.

# Traits

## General
@docs Size, Emphasis, Color

## Alignment
@docs Alignment, TextAlignment, HorizontalAlignment

# Shout-Outs
* [elm-bootstrap]()

-}

-- IMPORTS ---------------------------------------------------------------------

import Html exposing ( Html, Attribute )


-- TRAITS ----------------------------------------------------------------------

{-| A useful trait for sizing things. 
Works with buttons, labels, loaders, and other components. 
-}
type Size = Mini
          | Tiny
          | Small
          | Medium
          | Large
          | Big
          | Huge
          | Massive

{-| Represent alternate versions of a component.
The theming-behavior can be customized in your Semantic-UI's `site.variables`.
-}
type Emphasis = Primary
              | Secondary

{-| Predefined colors! Look how many there are!
-}
type Color = Red
           | Orange
           | Yellow
           | Olive
           | Green
           | Teal
           | Blue
           | Violet
           | Purple
           | Pink
           | Brown
           | Grey
           | Black
                         
{-| Align text!
-}
type TextAlignment = TextLeft
                   | TextRight
                   | TextCenter
                   | TextJustified

{-| Align things in the cardinal directions. More useful than you'd suspect.
-}
type Alignment = Top
               | Left
               | Right
               | Bottom

{-| Align things left or right. Useful for indicating general x-axis direction.
-}
type HorizontalAlignment = HorizontalLeft
                         | HorizontalRight


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- MODEL -----------------------------------------------------------------------

-- type Component = Component String (List String) (List Attribute) (List Component)

-- component : String -> List String -> List Attribute -> List Component -> Component
-- component = Component 


-- ACCESS ----------------------------------------------------------------------


-- TRANSFORMS ------------------------------------------------------------------


-- HELPERS ---------------------------------------------------------------------

-- TODO: make a wrapper for html.app-level stuff
-- TODO:   should include a cdn link
-- TODO:     or do SemanticUI.CDN

-- TODO: text


-- EVENTS ----------------------------------------------------------------------

-- TODO: onClick


-- ATTRIBUTES ------------------------------------------------------------------

-- TODO: Size
-- TODO: Color
-- TODO: TextAlignment
-- TODO: HorizontalAlignment
-- TODO: VerticalAlignment


-- ELEMENTS --------------------------------------------------------------------

-- TODO: it may be best to make these composable functions
-- TODO: it also may be best to offer a configure function that applies a record of attributes
-- TODO: content |> button Default |> configure { buttonAttributes | fluid = True } |> toHtml
-- TODO:   mutually-exclusize settings must be put in the constructor


-- CONTAINERS --

-- TODO: alignment
-- TODO: fluid


-- DIVIDERS --

-- TODO: "divided grid"
-- TODO: "vertical" (Maybe String)
-- TODO: "horizontal" (Maybe Icon) (Maybe String)
-- TODO: inverted
-- TODO: fitted
-- TODO: hidden
-- TODO: "section divider" should be used when dividing sections
-- TODO: clearing


-- FLAG --

-- TODO


-- HEADER --

-- TODO: size
-- TODO: sub
-- TODO: image | icon
-- TODO: disabled
-- TODO: dividing
-- TODO: block
-- TODO: float
-- TODO: alignment
-- TODO: color
-- TODO: inverted

-- TODO: attachment


-- ICON --

-- TODO


-- IMAGE --

-- TODO: size
-- TODO: link
-- TODO: hidden
-- TODO: disabled
-- TODO: avatar
-- TODO: bordered
-- TODO: fluid
-- TODO: rounded
-- TODO: circular
-- TODO: vertical alignment
-- TODO: centered
-- TODO: spaced
-- TODO: float

-- TODO: group


-- INPUT --

-- TODO: string -> msg

-- TODO: placeholder

-- TODO: loading
-- TODO: icon <| side
-- TODO: disabled
-- TODO: error
-- TODO: label <| element + rl + cornered
-- TODO: action <| element + rl
-- TODO: transparent
-- TODO: inverted
-- TODO: fluid
-- TODO: size


-- LABEL --

-- TODO: icon
-- TODO: image
-- TODO: elements
-- TODO: pointing <| direction
-- TODO: corner
-- TODO: tag | ribbon
-- TODO: horizontal
-- TODO: floating
-- TODO: detail
-- TODO: image
-- TODO: circular <| empty
-- TODO: basic
-- TODO: color
-- TODO: size

-- TODO: group

-- TODO: attach | TB + RL


-- LIST --

-- TODO: items
-- TODO: links

-- TODO: divided
-- TODO: icon | bulleted | ordered | char | image
-- TODO: orientation
-- TODO: header
-- TODO: description
-- TODO: selection
-- TODO: animated
-- TODO: relaxed | very relaxed
-- TODO: divided | celled
-- TODO: size
-- TODO: content alignment
-- TODO: content float


-- LOADER --

-- TODO: text
-- TODO: indeterminate
-- TODO: state <| active | disabled
-- TODO: inline center
-- TODO: size
-- TODO: inverted

-- TODO: dimmer


