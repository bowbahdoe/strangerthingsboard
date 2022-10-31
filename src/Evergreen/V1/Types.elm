module Evergreen.V1.Types exposing (..)

import Browser
import Url


type alias AlphabetBoard =
    { a : Bool
    , b : Bool
    , c : Bool
    , d : Bool
    , e : Bool
    , f : Bool
    , g : Bool
    , h : Bool
    , i : Bool
    , j : Bool
    , k : Bool
    , l : Bool
    , m : Bool
    , n : Bool
    , o : Bool
    , p : Bool
    , q : Bool
    , r : Bool
    , s : Bool
    , t : Bool
    , u : Bool
    , v : Bool
    , w : Bool
    , x : Bool
    , y : Bool
    , z : Bool
    }


type alias FrontendModel =
    AlphabetBoard


type alias BackendModel =
    { board : AlphabetBoard
    }


type FrontendMsg
    = UrlClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | ClickedOnFrontend Char


type ToBackend
    = Click Char
    | WantBoard


type BackendMsg
    = NoOpBackendMsg


type ToFrontend
    = NewBoard AlphabetBoard
