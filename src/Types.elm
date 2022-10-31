module Types exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation exposing (Key)
import Url exposing (Url)


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


defaultBoard =
    { a = True
    , b = False
    , c = False
    , d = False
    , e = False
    , f = False
    , g = False
    , h = False
    , i = False
    , j = False
    , k = False
    , l = False
    , m = False
    , n = False
    , o = False
    , p = False
    , q = False
    , r = False
    , s = False
    , t = False
    , u = False
    , v = False
    , w = False
    , x = False
    , y = False
    , z = False
    }


type alias BackendModel =
    { board : AlphabetBoard
    }


type FrontendMsg
    = UrlClicked UrlRequest
    | UrlChanged Url
    | ClickedOnFrontend Char


type ToBackend
    = Click Char
    | WantBoard


type BackendMsg
    = NoOpBackendMsg


type ToFrontend
    = NewBoard AlphabetBoard
