
module SemanticUI.Icon exposing( Icon(..)
                               , toHtml
                               )

-- IMPORTS ---------------------------------------------------------------------

import Html exposing ( Html, i )
import Html.Attributes as Attr exposing ( class )


-- ICON ------------------------------------------------------------------------

type Icon

  -- WEB CONTENT
  = AddToCalendar
  | Alarm
  | AlarmOutline
  | AlarmMuteOutline
  | AlarmMute
  | At
  | Browser
  | Bug
  | CalendarOutline
  | Calendar
  | CheckedCalendar
  | Cloud
  | Code
  | CommentOutline
  | Comment
  | CommentsOutline
  | Comments
  | Copyright
  | CreativeCommons
  | Dashboard
  | DeleteCalendar
  | ExternalSquare
  | External
  | Eyedropper
  | Feed
  | Find
  | Hashtag
  | Heartbeat
  | History
  | Home
  | HourglassFull
  | HourglassStart
  | HourglassHalf
  | HourglassEnd
  | HourglassEmpty
  | Idea
  | Image
  | Inbox
  | Industry
  | Lab
  | MailOutline
  | MailSquare
  | Mail
  | MousePointer
  | Options
  | PaintBrush
  | Payment
  | Percent
  | Privacy
  | Protect
  | Registered
  | RemoveFromCalendar
  | Search
  | Setting
  | Settings
  | Shop
  | ShoppingBag
  | ShoppingBasket
  | Signal
  | Sitemap
  | Tag
  | Tags
  | Tasks
  | Terminal
  | TextTelephone
  | Ticket
  | Trademark
  | Trophy
  | Wifi

  -- USER ACTIONS
  | AddToCart
  | AddUser
  | Adjust
  | Archive
  | Ban
  | Bookmark
  | Call
  | CallSquare
  | Clone
  | CloudDownload
  | CloudUpload
  | Talk
  | TalkOutline
  | Compress
  | Configure
  | Download
  | Edit
  | Erase
  | Exchange
  | Expand
  | ExternalShare
  | Filter
  | Hide
  | InCart
  | Lock
  | MailForward
  | ObjectGroup
  | ObjectUngroup
  | Pin
  | Print
  | Random
  | Recycle
  | Refresh
  | RemoveBookmark
  | RemoveUser
  | Repeat
  | ReplyAll
  | Reply
  | Retweet
  | Send
  | SendOutline
  | ShareAlternate
  | ShareAlternateSquare
  | Share
  | ShareSquare
  | SignIn
  | SignOut
  | Theme
  | Translate
  | Undo
  | Unhide
  | UnlockAlternate
  | Unlock
  | Upload
  | Wait
  | Wizard
  | Write
  | WriteSquare

  -- MESSAGE
  | Announcement
  | Birthday
  | HelpCircle
  | HelpCircleOutline
  | Help
  | InfoCircle
  | Info
  | WarningCircle
  | Warning
  | WarningSign

  -- USER TYPES
  | Child
  | Doctor
  | Handicap
  | Spy
  | Student
  | User
  | Users

  -- GENDER & SEXUALITY
  | Female
  | Gay
  | Genderless
  | Heterosexual
  | Intergender
  | Lesbian
  | Male
  | Man
  | Neuter
  | NonBinaryTransgender
  | OtherGenderHorizontal
  | OtherGender
  | OtherGenderVertical
  | Transgender
  | Woman

  -- LAYOUT ADJUSTMENT
  | BlockLayout
  | Crop
  | GridLayout
  | ListLayout
  | Maximize
  | ResizeHorizontal
  | ResizeVertical
  | Zoom
  | ZoomOut

  -- OBJECTS
  | Anchor
  | Bar
  | Bomb
  | Book
  | Bullseye
  | Calculator
  | Cocktail
  | Diamond
  | Fax
  | FireExtinguisher
  | Fire
  | FlagCheckered
  | Flag
  | FlagOutline
  | Gift
  | HandLizard
  | HandPeace
  | HandPaper
  | HandPointer
  | HandRock
  | HandScissors
  | HandSpock
  | Law
  | Leaf
  | Legal
  | Lemon
  | LifeRing
  | Lightning
  | Magnet
  | Money
  | Moon
  | Plane
  | Puzzle
  | Road
  | Rocket
  | Shipping
  | Soccer
  | StickyNote
  | StickyNoteOutline
  | Suitcase
  | Sun
  | Travel
  | Treatment
  | Umbrella
  | World

  -- SHAPES
  | Asterisk
  | Certificate
  | Circle
  | CircleNotched
  | CircleThin
  | Crosshairs
  | Cube
  | Cubes
  | EllipsisHorizontal
  | EllipsisVertical
  | QuoteLeft
  | QuoteRight
  | Spinner
  | Square
  | SquareOutline

  -- ITEM SELECTION
  | AddCircle
  | AddSquare
  | CheckCircle
  | CheckCircleOutline
  | CheckSquare
  | CheckmarkBox
  | Checkmark
  | MinusCircle
  | Minus
  | MinusSquare
  | MinusSquareOutline
  | Move
  | Plus
  | PlusSquareOutline
  | Radio
  | RemoveCircle
  | RemoveCircleOutline
  | Remove
  | SelectedRadio
  | ToggleOff
  | ToggleOn

  -- MEDIA
  | AreaChart
  | BarChart
  | CameraRetro
  | Newspaper
  | Film
  | LineChart
  | Photo
  | PieChart
  | Sound

  -- POINTERS
  | AngleDoubleDown
  | AngleDoubleLeft
  | AngleDoubleRight
  | AngleDoubleUp
  | AngleDown
  | AngleLeft
  | AngleRight
  | AngleUp
  | ArrowCircleDown
  | ArrowCircleLeft
  | ArrowCircleOutlineDown
  | ArrowCircleOutlineLeft
  | ArrowCircleOutlineRight
  | ArrowCircleOutlineUp
  | ArrowCircleRight
  | ArrowCircleUp
  | ArrowDown
  | ArrowLeft
  | ArrowRight
  | ArrowUp
  | CaretDown
  | CaretLeft
  | CaretRight
  | CaretUp
  | ChevronCircleDown
  | ChevronCircleLeft
  | ChevronCircleRight
  | ChevronCircleUp
  | ChevronDown
  | ChevronLeft
  | ChevronRight
  | ChevronUp
  | LongArrowDown
  | LongArrowLeft
  | LongArrowRight
  | LongArrowUp
  | PointingDown
  | PointingLeft
  | PointingRight
  | PointingUp
  | ToggleDown
  | ToggleLeft
  | ToggleRight
  | ToggleUp

  -- MOBILE
  | Mobile
  | Tablet
  | BatteryEmpty
  | BatteryLow
  | BatteryMedium
  | HighBattery
  | BatteryFull

  -- COMPUTER
  | Desktop
  | DiskOutline
  | Game
  | Keyboard
  | Laptop
  | Plug
  | Power

  -- COMPUTER & FILE SYSTEM
  | FileArchiveOutline
  | FileAudioOutline
  | FileCodeOutline
  | FileExcelOutline
  | File
  | FileImageOutline
  | FileOutline
  | FilePdfOutline
  | FilePowerpointOutline
  | FileText
  | FileTextOutline
  | FileVideoOutline
  | FileWordOutline
  | Folder
  | FolderOpen
  | FolderOpenOutline
  | FolderOutline
  | LevelDown
  | LevelUp
  | Trash
  | TrashOutline
    
  -- TECHNOLOGIES
  | Barcode
  | BluetoothAlternative
  | Bluetooth
  | Css3
  | Database
  | Fork
  | Html5
  | Openid
  | Qrcode
  | Rss
  | RssSquare
  | Server
  | Usb
    
  -- RATING
  | EmptyHeart
  | EmptyStar
  | Frown
  | Heart
  | Meh
  | Smile
  | StarHalfEmpty
  | StarHalf
  | Star
  | ThumbsDown
  | ThumbsOutlineDown
  | ThumbsOutlineUp
  | ThumbsUp
    
  -- AUDIO
  | Backward
  | ClosedCaptioning
  | Eject
  | FastBackward
  | FastForward
  | Forward
  | Music
  | Mute
  | PauseCircle
  | PauseCircleOutline
  | Pause
  | Play
  | Record
  | StepBackward
  | StepForward
  | StopCircle
  | StopCircleOutline
  | Stop
  | Unmute
  | VideoPlay
  | VideoPlayOutline
  | VolumeDown
  | VolumeOff
  | VolumeUp
    
  -- MAP
  | Bicycle
  | Building
  | BuildingOutline
  | Bus
  | Car
  | Coffee
  | Compass
  | Emergency
  | FirstAid
  | Food
  | H
  | Hospital
  | Hotel
  | LocationArrow
  | Map
  | MapOutline
  | MapPin
  | MapSigns
  | Marker
  | Military
  | Motorcycle
  | Paw
  | Ship
  | SpaceShuttle
  | Spoon
  | StreetView
  | Subway
  | Taxi
  | Train
  | TV
  | Tree
  | University
    
  -- TABLES
  | Columns
  | SortAlphabetAscending
  | SortAlphabetDescending
  | SortAscending
  | SortContentAscending
  | SortContentDescending
  | SortDescending
  | Sort
  | SortNumericAscending
  | SortNumericDescending
  | Table
    
  -- TEXT EDITOR
  | AlignCenter
  | AlignJustify
  | AlignLeft
  | AlignRight
  | Attach
  | Bold
  | Content
  | Copy
  | Cut
  | Font
  | Header
  | Indent
  | Italic
  | Linkify
  | List
  | OrderedList
  | Outdent
  | Paragraph
  | Paste
  | Save
  | Strikethrough
  | Subscript
  | Superscript
  | TextCursor
  | TextHeight
  | TextWidth
  | Underline
  | Unlinkify
  | UnorderedList
    
  -- CURRENCY
  | Bitcoin
  | Dollar
  | Euro
  | Lira
  | Pound
  | Ruble
  | Rupee
  | Shekel
  | Won
  | Yen
    
  -- PAYMENT OPTIONS
  | AmericanExpress
  | CreditCardAlternative
  | DinersClub
  | Discover
  | GoogleWallet
  | JapanCreditBureau
  | Mastercard
  | PaypalCard
  | Paypal
  | Stripe
  | Visa
    
  -- ACCESSIBILITY
  | Wheelchair
  | AslInterpreting
  | AssistiveListeningSystems
  | AudioDescription
  | Blind
  | Braille
  | Deafness
  | LowVision
  | SignLanguage
  | UniversalAccess
  | VolumeControlPhone
    
  -- BRANDS
  | Adn
  | Amazon
  | Android
  | Angellist
  | Apple
  | Behance
  | BehanceSquare
  | Bitbucket
  | BitbucketSquare
  | BlackTie
  | Buysellads
  | Chrome
  | Codepen
  | Codiepie
  | Connectdevelop
  | Contao
  | Dashcube
  | Delicious
  | Deviantart
  | Digg
  | Dribble
  | Dropbox
  | Drupal
  | Empire
  | EnviraGallery
  | Expeditedssl
  | Facebook
  | FacebookF
  | FacebookSquare
  | Firefox
  | FirstOrder
  | Flickr
  | FontAwesome
  | Fonticons
  | FortAwesome
  | Forumbee
  | Foursquare
  | Gg
  | GgCircle
  | Git
  | GitSquare
  | Github
  | GithubAlternate
  | GithubSquare
  | Gitlab
  | Gittip
  | Glide
  | GlideG
  | Google
  | GooglePlus
  | GooglePlusCircle
  | GooglePlusSquare
  | HackerNews
  | Houzz
  | Instagram
  | InternetExplorer
  | Ioxhost
  | Joomla
  | Jsfiddle
  | Lastfm
  | LastfmSquare
  | Leanpub
  | Linkedin
  | LinkedinSquare
  | Linux
  | Maxcdn
  | Meanpath
  | Medium
  | MicrosoftEdge
  | Mixcloud
  | Modx
  | Odnoklassniki
  | OdnoklassnikiSquare
  | Opencart
  | Opera
  | Optinmonster
  | Pagelines
  | PiedPiper
  | PiedPiperAlternate
  | PiedPiperHat
  | Pinterest
  | PinterestSquare
  | Pocket
  | ProductHunt
  | Qq
  | Rebel
  | Reddit
  | RedditAlien
  | RedditSquare
  | Renren
  | Safari
  | Scribd
  | Sellsy
  | Shirtsinbulk
  | Simplybuilt
  | Skyatlas
  | Skype
  | Slack
  | Slideshare
  | Snapchat
  | SnapchatGhost
  | SnapchatSquare
  | Soundcloud
  | Spotify
  | StackExchange
  | StackOverflow
  | Steam
  | SteamSquare
  | Stumbleupon
  | StumbleuponCircle
  | TencentWeibo
  | Themeisle
  | Trello
  | Tripadvisor
  | Tumblr
  | TumblrSquare
  | Twitch
  | Twitter
  | TwitterSquare
  | Viacoin
  | Viadeo
  | ViadeoSquare
  | Vimeo
  | VimeoSquare
  | Vine
  | Vk
  | Wechat
  | Weibo
  | Whatsapp
  | Wikipedia
  | Windows
  | Wordpress
  | Wpbeginner
  | Wpforms
  | Xing
  | XingSquare
  | YCombinator
  | Yahoo
  | Yelp
  | Yoast
  | Youtube
  | YoutubePlay
  | YoutubeSquare


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Icon -> Html msg
toHtml icon
  = let className : String
        className
          = flip (++) " icon"
          <| case icon of

              -- WEB CONTENT                        
              AddToCalendar                         -> "add to calendar"
              Alarm                                 -> "alarm"
              AlarmOutline                          -> "alarm outline"
              AlarmMuteOutline                      -> "alarm mute outline"
              AlarmMute                             -> "alarm mute"
              At                                    -> "at"
              Browser                               -> "browser"
              Bug                                   -> "bug"
              CalendarOutline                       -> "calendar outline"
              Calendar                              -> "calendar"
              CheckedCalendar                       -> "checked calendar"
              Cloud                                 -> "cloud"
              Code                                  -> "code"
              CommentOutline                        -> "comment outline"
              Comment                               -> "comment"
              CommentsOutline                       -> "comments outline"
              Comments                              -> "comments"
              Copyright                             -> "copyright"
              CreativeCommons                       -> "creative commons"
              Dashboard                             -> "dashboard"
              DeleteCalendar                        -> "delete calendar"
              ExternalSquare                        -> "external square"
              External                              -> "external"
              Eyedropper                            -> "eyedropper"
              Feed                                  -> "feed"
              Find                                  -> "find"
              Hashtag                               -> "hashtag"
              Heartbeat                             -> "heartbeat"
              History                               -> "history"
              Home                                  -> "home"
              HourglassFull                         -> "hourglass full"
              HourglassStart                        -> "hourglass start"
              HourglassHalf                         -> "hourglass half"
              HourglassEnd                          -> "hourglass end"
              HourglassEmpty                        -> "hourglass empty"
              Idea                                  -> "idea"
              Image                                 -> "image"
              Inbox                                 -> "inbox"
              Industry                              -> "industry"
              Lab                                   -> "lab"
              MailOutline                           -> "mail outline"
              MailSquare                            -> "mail square"
              Mail                                  -> "mail"
              MousePointer                          -> "mouse pointer"
              Options                               -> "options"
              PaintBrush                            -> "paint brush"
              Payment                               -> "payment"
              Percent                               -> "percent"
              Privacy                               -> "privacy"
              Protect                               -> "protect"
              Registered                            -> "registered"
              RemoveFromCalendar                    -> "remove from calendar"
              Search                                -> "search"
              Setting                               -> "setting"
              Settings                              -> "settings"
              Shop                                  -> "shop"
              ShoppingBag                           -> "shopping bag"
              ShoppingBasket                        -> "shopping basket"
              Signal                                -> "signal"
              Sitemap                               -> "sitemap"
              Tag                                   -> "tag"
              Tags                                  -> "tags"
              Tasks                                 -> "tasks"
              Terminal                              -> "terminal"
              TextTelephone                         -> "text telephone"
              Ticket                                -> "ticket"
              Trademark                             -> "trademark"
              Trophy                                -> "trophy"
              Wifi                                  -> "wifi"
                                                      
              -- USER ACTIONS                       
              AddToCart                             -> "add to cart"
              AddUser                               -> "add user"
              Adjust                                -> "adjust"
              Archive                               -> "archive"
              Ban                                   -> "ban"
              Bookmark                              -> "bookmark"
              Call                                  -> "call"
              CallSquare                            -> "call square"
              Clone                                 -> "clone"
              CloudDownload                         -> "cloud download"
              CloudUpload                           -> "cloud upload"
              Talk                                  -> "talk"
              TalkOutline                           -> "talk outline"
              Compress                              -> "compress"
              Configure                             -> "configure"
              Download                              -> "download"
              Edit                                  -> "edit"
              Erase                                 -> "erase"
              Exchange                              -> "exchange"
              Expand                                -> "expand"
              ExternalShare                         -> "external share"
              Filter                                -> "filter"
              Hide                                  -> "hide"
              InCart                                -> "in cart"
              Lock                                  -> "lock"
              MailForward                           -> "mail forward"
              ObjectGroup                           -> "object group"
              ObjectUngroup                         -> "object ungroup"
              Pin                                   -> "pin"
              Print                                 -> "print"
              Random                                -> "random"
              Recycle                               -> "recycle"
              Refresh                               -> "refresh"
              RemoveBookmark                        -> "remove bookmark"
              RemoveUser                            -> "remove user"
              Repeat                                -> "repeat"
              ReplyAll                              -> "reply all"
              Reply                                 -> "reply"
              Retweet                               -> "retweet"
              Send                                  -> "send"
              SendOutline                           -> "send outline"
              ShareAlternate                        -> "share alternate"
              ShareAlternateSquare                  -> "share alternate square"
              Share                                 -> "share"
              ShareSquare                           -> "share square"
              SignIn                                -> "sign in"
              SignOut                               -> "sign out"
              Theme                                 -> "theme"
              Translate                             -> "translate"
              Undo                                  -> "undo"
              Unhide                                -> "unhide"
              UnlockAlternate                       -> "unlock alternate"
              Unlock                                -> "unlock"
              Upload                                -> "upload"
              Wait                                  -> "wait"
              Wizard                                -> "wizard"
              Write                                 -> "write"
              WriteSquare                           -> "write square"
                                                      
              -- MESSAGE                            
              Announcement                          -> "announcement"
              Birthday                              -> "birthday"
              HelpCircle                            -> "help circle"
              HelpCircleOutline                     -> "help circle outline"
              Help                                  -> "help"
              InfoCircle                            -> "info circle"
              Info                                  -> "info"
              WarningCircle                         -> "warning circle"
              Warning                               -> "warning"
              WarningSign                           -> "warning sign"
                                                      
              -- USER TYPES                         
              Child                                 -> "child"
              Doctor                                -> "doctor"
              Handicap                              -> "handicap"
              Spy                                   -> "spy"
              Student                               -> "student"
              User                                  -> "user"
              Users                                 -> "users"
                                                      
              -- GENDER & SEXUALITY                 
              Female                                -> "female"
              Gay                                   -> "gay"
              Genderless                            -> "genderless"
              Heterosexual                          -> "heterosexual"
              Intergender                           -> "intergender"
              Lesbian                               -> "lesbian"
              Male                                  -> "male"
              Man                                   -> "man"
              Neuter                                -> "neuter"
              NonBinaryTransgender                  -> "non binary transgender"
              OtherGenderHorizontal                 -> "other gender horizontal"
              OtherGender                           -> "other gender"
              OtherGenderVertical                   -> "other gender vertical"
              Transgender                           -> "transgender"
              Woman                                 -> "woman"
                                                      
              -- LAYOUT ADJUSTMENT                  
              BlockLayout                           -> "block layout"
              Crop                                  -> "crop"
              GridLayout                            -> "grid layout"
              ListLayout                            -> "list layout"
              Maximize                              -> "maximize"
              ResizeHorizontal                      -> "resize horizontal"
              ResizeVertical                        -> "resize vertical"
              Zoom                                  -> "zoom"
              ZoomOut                               -> "zoom out"
                                                      
              -- OBJECTS                            
              Anchor                                -> "anchor"
              Bar                                   -> "bar"
              Bomb                                  -> "bomb"
              Book                                  -> "book"
              Bullseye                              -> "bullseye"
              Calculator                            -> "calculator"
              Cocktail                              -> "cocktail"
              Diamond                               -> "diamond"
              Fax                                   -> "fax"
              FireExtinguisher                      -> "fire extinguisher"
              Fire                                  -> "fire"
              FlagCheckered                         -> "flag checkered"
              Flag                                  -> "flag"
              FlagOutline                           -> "flag outline"
              Gift                                  -> "gift"
              HandLizard                            -> "hand lizard"
              HandPeace                             -> "hand peace"
              HandPaper                             -> "hand paper"
              HandPointer                           -> "hand pointer"
              HandRock                              -> "hand rock"
              HandScissors                          -> "hand scissors"
              HandSpock                             -> "hand spock"
              Law                                   -> "law"
              Leaf                                  -> "leaf"
              Legal                                 -> "legal"
              Lemon                                 -> "lemon"
              LifeRing                              -> "life ring"
              Lightning                             -> "lightning"
              Magnet                                -> "magnet"
              Money                                 -> "money"
              Moon                                  -> "moon"
              Plane                                 -> "plane"
              Puzzle                                -> "puzzle"
              Road                                  -> "road"
              Rocket                                -> "rocket"
              Shipping                              -> "shipping"
              Soccer                                -> "soccer"
              StickyNote                            -> "sticky note"
              StickyNoteOutline                     -> "sticky note outline"
              Suitcase                              -> "suitcase"
              Sun                                   -> "sun"
              Travel                                -> "travel"
              Treatment                             -> "treatment"
              Umbrella                              -> "umbrella"
              World                                 -> "world"
                                                      
              -- SHAPES                             
              Asterisk                              -> "asterisk"
              Certificate                           -> "certificate"
              Circle                                -> "circle"
              CircleNotched                         -> "circle notched"
              CircleThin                            -> "circle thin"
              Crosshairs                            -> "crosshairs"
              Cube                                  -> "cube"
              Cubes                                 -> "cubes"
              EllipsisHorizontal                    -> "ellipsis horizontal"
              EllipsisVertical                      -> "ellipsis vertical"
              QuoteLeft                             -> "quote left"
              QuoteRight                            -> "quote right"
              Spinner                               -> "spinner"
              Square                                -> "square"
              SquareOutline                         -> "square outline"
                                                      
              -- ITEM SELECTION                     
              AddCircle                             -> "add circle"
              AddSquare                             -> "add square"
              CheckCircle                           -> "check circle"
              CheckCircleOutline                    -> "check circle outline"
              CheckSquare                           -> "check square"
              CheckmarkBox                          -> "checkmark box"
              Checkmark                             -> "checkmark"
              MinusCircle                           -> "minus circle"
              Minus                                 -> "minus"
              MinusSquare                           -> "minus square"
              MinusSquareOutline                    -> "minus square outline"
              Move                                  -> "move"
              Plus                                  -> "plus"
              PlusSquareOutline                     -> "plus square outline"
              Radio                                 -> "radio"
              RemoveCircle                          -> "remove circle"
              RemoveCircleOutline                   -> "remove circle outline"
              Remove                                -> "remove"
              SelectedRadio                         -> "selected radio"
              ToggleOff                             -> "toggle off"
              ToggleOn                              -> "toggle on"
                                                      
              -- MEDIA                              
              AreaChart                             -> "area chart"
              BarChart                              -> "bar chart"
              CameraRetro                           -> "camera retro"
              Newspaper                             -> "newspaper"
              Film                                  -> "film"
              LineChart                             -> "line chart"
              Photo                                 -> "photo"
              PieChart                              -> "pie chart"
              Sound                                 -> "sound"
                                                      
              -- POINTERS                           
              AngleDoubleDown                       -> "angle double down"
              AngleDoubleLeft                       -> "angle double left"
              AngleDoubleRight                      -> "angle double right"
              AngleDoubleUp                         -> "angle double up"
              AngleDown                             -> "angle down"
              AngleLeft                             -> "angle left"
              AngleRight                            -> "angle right"
              AngleUp                               -> "angle up"
              ArrowCircleDown                       -> "arrow circle down"
              ArrowCircleLeft                       -> "arrow circle left"
              ArrowCircleOutlineDown                -> "arrow circle outline down"
              ArrowCircleOutlineLeft                -> "arrow circle outline left"
              ArrowCircleOutlineRight               -> "arrow circle outline right"
              ArrowCircleOutlineUp                  -> "arrow circle outline up"
              ArrowCircleRight                      -> "arrow circle right"
              ArrowCircleUp                         -> "arrow circle up"
              ArrowDown                             -> "arrow down"
              ArrowLeft                             -> "arrow left"
              ArrowRight                            -> "arrow right"
              ArrowUp                               -> "arrow up"
              CaretDown                             -> "caret down"
              CaretLeft                             -> "caret left"
              CaretRight                            -> "caret right"
              CaretUp                               -> "caret up"
              ChevronCircleDown                     -> "chevron circle down"
              ChevronCircleLeft                     -> "chevron circle left"
              ChevronCircleRight                    -> "chevron circle right"
              ChevronCircleUp                       -> "chevron circle up"
              ChevronDown                           -> "chevron down"
              ChevronLeft                           -> "chevron left"
              ChevronRight                          -> "chevron right"
              ChevronUp                             -> "chevron up"
              LongArrowDown                         -> "long arrow down"
              LongArrowLeft                         -> "long arrow left"
              LongArrowRight                        -> "long arrow right"
              LongArrowUp                           -> "long arrow up"
              PointingDown                          -> "pointing down"
              PointingLeft                          -> "pointing left"
              PointingRight                         -> "pointing right"
              PointingUp                            -> "pointing up"
              ToggleDown                            -> "toggle down"
              ToggleLeft                            -> "toggle left"
              ToggleRight                           -> "toggle right"
              ToggleUp                              -> "toggle up"
                                                      
              -- MOBILE                             
              Mobile                                -> "mobile"
              Tablet                                -> "tablet"
              BatteryEmpty                          -> "battery empty"
              BatteryLow                            -> "battery low"
              BatteryMedium                         -> "battery medium"
              HighBattery                           -> "high battery"
              BatteryFull                           -> "battery full"
                                                      
              -- COMPUTER                           
              Desktop                               -> "desktop"
              DiskOutline                           -> "disk outline"
              Game                                  -> "game"
              Keyboard                              -> "keyboard"
              Laptop                                -> "laptop"
              Plug                                  -> "plug"
              Power                                 -> "power"
                                                      
              -- COMPUTER & FILE SYSTEM             
              FileArchiveOutline                    -> "file archive outline"
              FileAudioOutline                      -> "file audio outline"
              FileCodeOutline                       -> "file code outline"
              FileExcelOutline                      -> "file excel outline"
              File                                  -> "file"
              FileImageOutline                      -> "file image outline"
              FileOutline                           -> "file outline"
              FilePdfOutline                        -> "file pdf outline"
              FilePowerpointOutline                 -> "file powerpoint outline"
              FileText                              -> "file text"
              FileTextOutline                       -> "file text outline"
              FileVideoOutline                      -> "file video outline"
              FileWordOutline                       -> "file word outline"
              Folder                                -> "folder"
              FolderOpen                            -> "folder open"
              FolderOpenOutline                     -> "folder open outline"
              FolderOutline                         -> "folder outline"
              LevelDown                             -> "level down"
              LevelUp                               -> "level up"
              Trash                                 -> "trash"
              TrashOutline                          -> "trash outline"
                                                      
              -- TECHNOLOGIES                       
              Barcode                               -> "barcode"
              BluetoothAlternative                  -> "bluetooth alternative"
              Bluetooth                             -> "bluetooth"
              Css3                                  -> "css3"
              Database                              -> "database"
              Fork                                  -> "fork"
              Html5                                 -> "html5"
              Openid                                -> "openid"
              Qrcode                                -> "qrcode"
              Rss                                   -> "rss"
              RssSquare                             -> "rss square"
              Server                                -> "server"
              Usb                                   -> "usb"
                                                      
              -- RATING                             
              EmptyHeart                            -> "empty heart"
              EmptyStar                             -> "empty star"
              Frown                                 -> "frown"
              Heart                                 -> "heart"
              Meh                                   -> "meh"
              Smile                                 -> "smile"
              StarHalfEmpty                         -> "star half empty"
              StarHalf                              -> "star half"
              Star                                  -> "star"
              ThumbsDown                            -> "thumbs down"
              ThumbsOutlineDown                     -> "thumbs outline down"
              ThumbsOutlineUp                       -> "thumbs outline up"
              ThumbsUp                              -> "thumbs up"
                                                      
              -- AUDIO                              
              Backward                              -> "backward"
              ClosedCaptioning                      -> "closed captioning"
              Eject                                 -> "eject"
              FastBackward                          -> "fast backward"
              FastForward                           -> "fast forward"
              Forward                               -> "forward"
              Music                                 -> "music"
              Mute                                  -> "mute"
              PauseCircle                           -> "pause circle"
              PauseCircleOutline                    -> "pause circle outline"
              Pause                                 -> "pause"
              Play                                  -> "play"
              Record                                -> "record"
              StepBackward                          -> "step backward"
              StepForward                           -> "step forward"
              StopCircle                            -> "stop circle"
              StopCircleOutline                     -> "stop circle outline"
              Stop                                  -> "stop"
              Unmute                                -> "unmute"
              VideoPlay                             -> "video play"
              VideoPlayOutline                      -> "video play outline"
              VolumeDown                            -> "volume down"
              VolumeOff                             -> "volume off"
              VolumeUp                              -> "volume up"
                                                      
              -- MAP                                
              Bicycle                               -> "bicycle"
              Building                              -> "building"
              BuildingOutline                       -> "building outline"
              Bus                                   -> "bus"
              Car                                   -> "car"
              Coffee                                -> "coffee"
              Compass                               -> "compass"
              Emergency                             -> "emergency"
              FirstAid                              -> "first aid"
              Food                                  -> "food"
              H                                     -> "h"
              Hospital                              -> "hospital"
              Hotel                                 -> "hotel"
              LocationArrow                         -> "location arrow"
              Map                                   -> "map"
              MapOutline                            -> "map outline"
              MapPin                                -> "map pin"
              MapSigns                              -> "map signs"
              Marker                                -> "marker"
              Military                              -> "military"
              Motorcycle                            -> "motorcycle"
              Paw                                   -> "paw"
              Ship                                  -> "ship"
              SpaceShuttle                          -> "space shuttle"
              Spoon                                 -> "spoon"
              StreetView                            -> "street view"
              Subway                                -> "subway"
              Taxi                                  -> "taxi"
              Train                                 -> "train"
              TV                                    -> "tv"
              Tree                                  -> "tree"
              University                            -> "university"
                                                      
              -- TABLES                             
              Columns                               -> "columns"
              SortAlphabetAscending                 -> "sort alphabet ascending"
              SortAlphabetDescending                -> "sort alphabet descending"
              SortAscending                         -> "sort ascending"
              SortContentAscending                  -> "sort content ascending"
              SortContentDescending                 -> "sort content descending"
              SortDescending                        -> "sort descending"
              Sort                                  -> "sort"
              SortNumericAscending                  -> "sort numeric ascending"
              SortNumericDescending                 -> "sort numeric descending"
              Table                                 -> "table"
                                                      
              -- TEXT EDITOR                        
              AlignCenter                           -> "align center"
              AlignJustify                          -> "align justify"
              AlignLeft                             -> "align left"
              AlignRight                            -> "align right"
              Attach                                -> "attach"
              Bold                                  -> "bold"
              Content                               -> "content"
              Copy                                  -> "copy"
              Cut                                   -> "cut"
              Font                                  -> "font"
              Header                                -> "header"
              Indent                                -> "indent"
              Italic                                -> "italic"
              Linkify                               -> "linkify"
              List                                  -> "list"
              OrderedList                           -> "ordered list"
              Outdent                               -> "outdent"
              Paragraph                             -> "paragraph"
              Paste                                 -> "paste"
              Save                                  -> "save"
              Strikethrough                         -> "strikethrough"
              Subscript                             -> "subscript"
              Superscript                           -> "superscript"
              TextCursor                            -> "text cursor"
              TextHeight                            -> "text height"
              TextWidth                             -> "text width"
              Underline                             -> "underline"
              Unlinkify                             -> "unlinkify"
              UnorderedList                         -> "unordered list"
                                                      
              -- CURRENCY                           
              Bitcoin                               -> "bitcoin"
              Dollar                                -> "dollar"
              Euro                                  -> "euro"
              Lira                                  -> "lira"
              Pound                                 -> "pound"
              Ruble                                 -> "ruble"
              Rupee                                 -> "rupee"
              Shekel                                -> "shekel"
              Won                                   -> "won"
              Yen                                   -> "yen"
                                                      
              -- PAYMENT OPTIONS                    
              AmericanExpress                       -> "american express"
              CreditCardAlternative                 -> "credit card alternative"
              DinersClub                            -> "diners club"
              Discover                              -> "discover"
              GoogleWallet                          -> "google wallet"
              JapanCreditBureau                     -> "japan credit bureau"
              Mastercard                            -> "mastercard"
              PaypalCard                            -> "paypal card"
              Paypal                                -> "paypal"
              Stripe                                -> "stripe"
              Visa                                  -> "visa"
                                                      
              -- ACCESSIBILITY                      
              Wheelchair                            -> "wheelchair"
              AslInterpreting                       -> "asl interpreting"
              AssistiveListeningSystems             -> "assistive listening systems"
              AudioDescription                      -> "audio description"
              Blind                                 -> "blind"
              Braille                               -> "braille"
              Deafness                              -> "deafness"
              LowVision                             -> "low vision"
              SignLanguage                          -> "sign language"
              UniversalAccess                       -> "universal access"
              VolumeControlPhone                    -> "volume control phone"
                                                      
              -- BRANDS
              Adn                                   -> "adn"
              Amazon                                -> "amazon"
              Android                               -> "android"
              Angellist                             -> "angellist"
              Apple                                 -> "apple"
              Behance                               -> "behance"
              BehanceSquare                         -> "behance square"
              Bitbucket                             -> "bitbucket"
              BitbucketSquare                       -> "bitbucket square"
              BlackTie                              -> "black tie"
              Buysellads                            -> "buysellads"
              Chrome                                -> "chrome"
              Codepen                               -> "codepen"
              Codiepie                              -> "codiepie"
              Connectdevelop                        -> "connectdevelop"
              Contao                                -> "contao"
              Dashcube                              -> "dashcube"
              Delicious                             -> "delicious"
              Deviantart                            -> "deviantart"
              Digg                                  -> "digg"
              Dribble                               -> "dribble"
              Dropbox                               -> "dropbox"
              Drupal                                -> "drupal"
              Empire                                -> "empire"
              EnviraGallery                         -> "envira gallery"
              Expeditedssl                          -> "expeditedssl"
              Facebook                              -> "facebook"
              FacebookF                             -> "facebook f"
              FacebookSquare                        -> "facebook square"
              Firefox                               -> "firefox"
              FirstOrder                            -> "first order"
              Flickr                                -> "flickr"
              FontAwesome                           -> "font awesome"
              Fonticons                             -> "fonticons"
              FortAwesome                           -> "fort awesome"
              Forumbee                              -> "forumbee"
              Foursquare                            -> "foursquare"
              Gg                                    -> "gg"
              GgCircle                              -> "gg circle"
              Git                                   -> "git"
              GitSquare                             -> "git square"
              Github                                -> "github"
              GithubAlternate                       -> "github alternate"
              GithubSquare                          -> "github square"
              Gitlab                                -> "gitlab"
              Gittip                                -> "gittip"
              Glide                                 -> "glide"
              GlideG                                -> "glide g"
              Google                                -> "google"
              GooglePlus                            -> "google plus"
              GooglePlusCircle                      -> "google plus circle"
              GooglePlusSquare                      -> "google plus square"
              HackerNews                            -> "hacker news"
              Houzz                                 -> "houzz"
              Instagram                             -> "instagram"
              InternetExplorer                      -> "internet explorer"
              Ioxhost                               -> "ioxhost"
              Joomla                                -> "joomla"
              Jsfiddle                              -> "jsfiddle"
              Lastfm                                -> "lastfm"
              LastfmSquare                          -> "lastfm square"
              Leanpub                               -> "leanpub"
              Linkedin                              -> "linkedin"
              LinkedinSquare                        -> "linkedin square"
              Linux                                 -> "linux"
              Maxcdn                                -> "maxcdn"
              Meanpath                              -> "meanpath"
              Medium                                -> "medium"
              MicrosoftEdge                         -> "microsoft edge"
              Mixcloud                              -> "mixcloud"
              Modx                                  -> "modx"
              Odnoklassniki                         -> "odnoklassniki"
              OdnoklassnikiSquare                   -> "odnoklassniki square"
              Opencart                              -> "opencart"
              Opera                                 -> "opera"
              Optinmonster                          -> "optinmonster"
              Pagelines                             -> "pagelines"
              PiedPiper                             -> "pied piper"
              PiedPiperAlternate                    -> "pied piper alternate"
              PiedPiperHat                          -> "pied piper hat"
              Pinterest                             -> "pinterest"
              PinterestSquare                       -> "pinterest square"
              Pocket                                -> "pocket"
              ProductHunt                           -> "product hunt"
              Qq                                    -> "qq"
              Rebel                                 -> "rebel"
              Reddit                                -> "reddit"
              RedditAlien                           -> "reddit alien"
              RedditSquare                          -> "reddit square"
              Renren                                -> "renren"
              Safari                                -> "safari"
              Scribd                                -> "scribd"
              Sellsy                                -> "sellsy"
              Shirtsinbulk                          -> "shirtsinbulk"
              Simplybuilt                           -> "simplybuilt"
              Skyatlas                              -> "skyatlas"
              Skype                                 -> "skype"
              Slack                                 -> "slack"
              Slideshare                            -> "slideshare"
              Snapchat                              -> "snapchat"
              SnapchatGhost                         -> "snapchat ghost"
              SnapchatSquare                        -> "snapchat square"
              Soundcloud                            -> "soundcloud"
              Spotify                               -> "spotify"
              StackExchange                         -> "stack exchange"
              StackOverflow                         -> "stack overflow"
              Steam                                 -> "steam"
              SteamSquare                           -> "steam square"
              Stumbleupon                           -> "stumbleupon"
              StumbleuponCircle                     -> "stumbleupon circle"
              TencentWeibo                          -> "tencent weibo"
              Themeisle                             -> "themeisle"
              Trello                                -> "trello"
              Tripadvisor                           -> "tripadvisor"
              Tumblr                                -> "tumblr"
              TumblrSquare                          -> "tumblr square"
              Twitch                                -> "twitch"
              Twitter                               -> "twitter"
              TwitterSquare                         -> "twitter square"
              Viacoin                               -> "viacoin"
              Viadeo                                -> "viadeo"
              ViadeoSquare                          -> "viadeo square"
              Vimeo                                 -> "vimeo"
              VimeoSquare                           -> "vimeo square"
              Vine                                  -> "vine"
              Vk                                    -> "vk"
              Wechat                                -> "wechat"
              Weibo                                 -> "weibo"
              Whatsapp                              -> "whatsapp"
              Wikipedia                             -> "wikipedia"
              Windows                               -> "windows"
              Wordpress                             -> "wordpress"
              Wpbeginner                            -> "wpbeginner"
              Wpforms                               -> "wpforms"
              Xing                                  -> "xing"
              XingSquare                            -> "xing square"
              YCombinator                           -> "y combinator"
              Yahoo                                 -> "yahoo"
              Yelp                                  -> "yelp"
              Yoast                                 -> "yoast"
              Youtube                               -> "youtube"
              YoutubePlay                           -> "youtube play"
              YoutubeSquare                         -> "youtube square"


    in i [ class className ] []
