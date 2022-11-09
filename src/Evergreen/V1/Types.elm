module Evergreen.V1.Types exposing (..)

import Browser
import Time
import Url


type Activation
    = NotActivated
    | ActivatedAt Time.Posix


type alias AlphabetBoard =
    { a : Activation
    , b : Activation
    , c : Activation
    , d : Activation
    , e : Activation
    , f : Activation
    , g : Activation
    , h : Activation
    , i : Activation
    , j : Activation
    , k : Activation
    , l : Activation
    , m : Activation
    , n : Activation
    , o : Activation
    , p : Activation
    , q : Activation
    , r : Activation
    , s : Activation
    , t : Activation
    , u : Activation
    , v : Activation
    , w : Activation
    , x : Activation
    , y : Activation
    , z : Activation
    }


type alias FrontendModel =
    { board : AlphabetBoard
    , time : Maybe Time.Posix
    , lettersTyped : List ( Char, Time.Posix )
    }


type alias BackendModel =
    { board : AlphabetBoard
    , lettersTyped : List ( Char, Time.Posix )
    }


type FrontendMsg
    = UrlClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | TypedOnFrontend Char
    | GotTime Time.Posix
    | NoOpFrontend


type ToBackend
    = Click Char
    | WantBoard


type BackendMsg
    = NoOpBackendMsg
    | Flip Char Time.Posix


type alias BackendModel =
    { board : AlphabetBoard
    , lettersTyped : List ( Char, Time.Posix )
    }


type ToFrontend
    = NewBoard
        { board : AlphabetBoard
        , lettersTyped : List ( Char, Time.Posix )
        }
    | Log BackendModel
