module Types exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation exposing (Key)
import Time
import Url exposing (Url)


type Activation
    = NotActivated
    | ActivatedAt Time.Posix


lightOnDurationMs =
    1000


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
    , lettersTyped : List (Char, Time.Posix)
    }


defaultBoard =
    { a = NotActivated
    , b = NotActivated
    , c = NotActivated
    , d = NotActivated
    , e = NotActivated
    , f = NotActivated
    , g = NotActivated
    , h = NotActivated
    , i = NotActivated
    , j = NotActivated
    , k = NotActivated
    , l = NotActivated
    , m = NotActivated
    , n = NotActivated
    , o = NotActivated
    , p = NotActivated
    , q = NotActivated
    , r = NotActivated
    , s = NotActivated
    , t = NotActivated
    , u = NotActivated
    , v = NotActivated
    , w = NotActivated
    , x = NotActivated
    , y = NotActivated
    , z = NotActivated
    }


type alias BackendModel =
    { board : AlphabetBoard

    , lettersTyped : List (Char, Time.Posix)
    }


type FrontendMsg
    = UrlClicked UrlRequest
    | UrlChanged Url
    | TypedOnFrontend Char
    | GotTime Time.Posix
    | NoOpFrontend


type ToBackend
    = Click Char
    | WantBoard


type BackendMsg
    = NoOpBackendMsg
    | Flip Char Time.Posix


type ToFrontend
    = NewBoard  { board: AlphabetBoard, lettersTyped: List (Char, Time.Posix) }
    | Log BackendModel
