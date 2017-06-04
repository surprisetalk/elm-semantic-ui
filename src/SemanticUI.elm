
module SemanticUI exposing (..)

-- IMPORTS ---------------------------------------------------------------------

import Html


-- MODEL -----------------------------------------------------------------------

type alias Element = {}

type alias Attribute = {}
-- TODO: this may need its own module


-- ACCESS ----------------------------------------------------------------------


-- HELPERS ---------------------------------------------------------------------

join : List Element -> Element


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Element -> Html msg

fromHtml : Html msg -> Element
-- TODO: you can break it apart using "node"

-- TODO: we should be able to transform Html.Attribute into SemanticUI.Attribute


-- TEXT ------------------------------------------------------------------------

text : String -> Element


-- ATTRIBUTES ------------------------------------------------------------------

type Emphasis = None
              | Primary
              | Secondary


-- ELEMENTS --------------------------------------------------------------------

-- BUTTONS --

-- TODO: we might need to put all of these in their own module and then integrate them up here

-- TODO: keyboard focusable

-- TODO: if the only content is an icon, it should be "button icon"

-- TODO: "attached" groupings

type ButtonOutlook = Positive
                   | Negative

type ButtonSocial = Facebook
                  | Twitter
                  | Google
                  | VK
                  | LinkedIn
                  | Instagram
                  | YouTube

type ButtonState = Active
                 | Disabled
                 | Default

type ButtonAnimation = Vertical Element
                     | Default  Element
                     | Fade     Element
                     -- TODO: the element is the hidden content
                       
-- type ButtonAttribute = Animation ButtonAnimation
--                      | Outlook   ButtonOutlook
--                      | State     ButtonState
--                      | Emphasis  Emphasis
--                      | IconLabel Icon
--                      | Label     Label
--                      | Color     Color
--                      | Size      Size
--                      | Float     Direction
--                      | Basic
--                      | Inverted
--                      | Loading
--                      | Compact
--                      | Toggle
--                      | Fluid
--                      | Circular

type alias ButtonAttributes = { animation : ButtonAnimation
                              , outlook   : ButtonOutlook
                              , state     : ButtonState
                              , emphasis  : Emphasis
                              , color     : Color
                              , label     : Label
                              , float     : Float
                              , size      : Size
                              , iconLabel : Icon
                              , basic     : Bool
                              , inverted  : Bool
                              , loading   : Bool
                              , compact   : Bool
                              , toggle    : Bool
                              , fluid     : Bool
                              , circular  : Bool
                              , content   : Element
                                -- TODO: "content" seems like a bad idea
                              }

button : ButtonAttributes -> Button

defaultButton : Button

groupButtons : Maybe Int -> Orientation -> List Button -> Element
-- TODO: if each button is an "icon button", the group should be "icon buttons"
-- TODO: orientation correpsonds to vertical/hirozontal
-- TODO: maybe int corresponds to the spacing

conditionalButtons : List Button -> Element


-- CONTAINERS --

type Container = 

type Container = Default
               | Text
               | 

