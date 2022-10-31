module Backend exposing (..)

import Html
import Lamdera exposing (ClientId, SessionId)
import Types exposing (..)


type alias Model =
    BackendModel


app =
    Lamdera.backend
        { init = init
        , update = update
        , updateFromFrontend = updateFromFrontend
        , subscriptions = \m -> Sub.none
        }


init : ( Model, Cmd BackendMsg )
init =
    ( { board = defaultBoard }
    , Cmd.none
    )


update : BackendMsg -> Model -> ( Model, Cmd BackendMsg )
update msg model =
    ( model, Cmd.none )


updateFromFrontend : SessionId -> ClientId -> ToBackend -> Model -> ( Model, Cmd BackendMsg )
updateFromFrontend sessionId clientId msg model =
    case msg of
        WantBoard -> 
            (model, Lamdera.sendToFrontend clientId (NewBoard model.board))
        Click c ->
            let
                b1 =
                    model.board

                board =
                    case c of
                        'a' ->
                            { b1 | a = not b1.a }

                        'b' ->
                            { b1 | b = not b1.b }

                        'c' ->
                            { b1 | c = not b1.c }

                        'd' ->
                            { b1 | d = not b1.d }

                        'e' ->
                            { b1 | e = not b1.e }

                        'f' ->
                            { b1 | f = not b1.f }

                        'g' ->
                            { b1 | g = not b1.g }

                        'h' ->
                            { b1 | h = not b1.h }

                        'i' ->
                            { b1 | i = not b1.i }

                        'j' ->
                            { b1 | j = not b1.j }

                        'k' ->
                            { b1 | k = not b1.k }

                        'l' ->
                            { b1 | l = not b1.l }

                        'm' ->
                            { b1 | m = not b1.m }

                        'n' ->
                            { b1 | n = not b1.n }

                        'o' ->
                            { b1 | o = not b1.o }

                        'p' ->
                            { b1 | p = not b1.p }

                        'q' ->
                            { b1 | q = not b1.q }

                        'r' ->
                            { b1 | r = not b1.r }

                        's' ->
                            { b1 | s = not b1.s }

                        't' ->
                            { b1 | t = not b1.t }

                        'u' ->
                            { b1 | u = not b1.u }

                        'v' ->
                            { b1 | v = not b1.v }

                        'w' ->
                            { b1 | w = not b1.w }

                        'x' ->
                            { b1 | x = not b1.x }

                        'y' ->
                            { b1 | y = not b1.y }

                        'z' ->
                            { b1 | z = not b1.z }

                        _ ->
                            b1
            in
            ( { model | board = board }, Lamdera.broadcast (NewBoard board) )
