
module SemanticUI.Container exposing ( Container
                                     , container
                                     , textContainer
                                     , alignContainer
                                     , fluidContainer
                                     , setHtmlAttributes
                                     , addHtmlAttributes
                                     , toHtml
                                     )

{-| Semantic-UI [containers](https://semantic-ui.com/elements/container.html)!

# Containers
@docs Container, container, textContainer, alignContainer, fluidContainer

# Html
@docs toHtml, setHtmlAttributes, addHtmlAttributes

-}


-- IMPORTS ---------------------------------------------------------------------

import SemanticUI exposing ( TextAlignment(..) )

import Html exposing ( Html, Attribute, div )
import Html.Attributes exposing ( class )


-- CONTAINER -------------------------------------------------------------------

{-| The Container type! You'll probably want to transform this to Html.

    container [] |> toHtml

-}
type Container msg =      Container               (List (Attribute msg)) (List (Html msg))
                   |  TextContainer               (List (Attribute msg)) (List (Html msg))
                   | AlignContainer TextAlignment (List (Attribute msg)) (List (Html msg))
                   | FluidContainer               (List (Attribute msg)) (List (Html msg))


{-| Create a standard container.

    container [ h1 [] [ text "HULLO" ], h2 [] [ text "world" ] ] |> toHtml

-}
container : List (Html msg) -> Container msg
container = Container []

{-| Create a narrower container better-suited for a large column of text.

    textContainer [ text "lorem ipsum..." ] |> toHtml

-}
textContainer : List (Html msg) -> Container msg
textContainer = TextContainer []

{-| Create a text container with a particular text alignment.

    alignContainer TextLeft [ text "get low, get low, get low" ] |> toHtml

    alignContainer TextRight [ text "to the windooooow" ] |> toHtml

    alignContainer TextCenter [ text "to the waall" ] |> toHtml

    alignContainer TextJustified [ text "'til the sweat..." ] |> toHtml

-}
alignContainer : TextAlignment -> List (Html msg) -> Container msg
alignContainer = flip AlignContainer []

{-| Create a container with no maximum width.

    fluidContainer [ hr [] [] ] |> toHtml

-}
fluidContainer : List (Html msg) -> Container msg
fluidContainer = FluidContainer []


-- ACCESS ----------------------------------------------------------------------

{-| Overwrite all the `Html.Attribute` in the `Container`. 
Careful! This deletes ALL of the existing attributes.

Please refrain from using the `class` attribute for now.

    container [] |> setHtmlAttributes [ id "shipping" ] |> toHtml

-}
setHtmlAttributes : List (Attribute msg) -> Container msg -> Container msg
setHtmlAttributes attr_ container
  = case container of
      Container        _ h ->      Container   attr_ h
      TextContainer    _ h ->  TextContainer   attr_ h
      AlignContainer t _ h -> AlignContainer t attr_ h
      FluidContainer   _ h -> FluidContainer   attr_ h
      
{-| Add some new `Html.Attributes` to the `Container`.
This may only overwrite attributes that already exist.

Please refrain from using the `class` attribute for now.

    container [] |> addHtmlAttributes [ id "gardening" ] |> toHtml

-}
addHtmlAttributes : List (Attribute msg) -> Container msg -> Container msg
addHtmlAttributes attr_ container
  = case container of
      Container        a h ->      Container   (attr_ ++ a) h
      TextContainer    a h ->  TextContainer   (attr_ ++ a) h
      AlignContainer t a h -> AlignContainer t (attr_ ++ a) h
      FluidContainer   a h -> FluidContainer   (attr_ ++ a) h


-- TRANSFORMS ------------------------------------------------------------------

{-| Turn your `Container` into something usable!

    container [] |> toHtml

-}
toHtml : Container msg -> Html msg
toHtml container
  = case container of

      Container a h ->

        flip div h <| class "ui container" :: a

      TextContainer a h ->

        flip div h <| class "ui text container" :: a

      FluidContainer a h ->

        flip div h <| class "ui fluid container" :: a

      AlignContainer t a h ->

        case t of
          TextLeft      -> flip div h <| class "ui left      aligned container" :: a
          TextRight     -> flip div h <| class "ui right     aligned container" :: a
          TextCenter    -> flip div h <| class "ui center    aligned container" :: a
          TextJustified -> flip div h <| class "ui justified aligned container" :: a

