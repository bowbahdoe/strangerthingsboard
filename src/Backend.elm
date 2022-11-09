module Backend exposing (..)

import Html
import Lamdera exposing (ClientId, SessionId)
import Process
import Task
import Time
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
    ( { board = defaultBoard, lettersTyped = [] }
    , Cmd.none
    )


update : BackendMsg -> Model -> ( Model, Cmd BackendMsg )
update msg model =
    case msg of
        Flip c time ->
            let
                board =
                    updateBoard time c model.board
                lettersTyped = 
                    List.take 300 ((c, time) :: model.lettersTyped)
            in
            ( { model | board = board, lettersTyped = lettersTyped }, Lamdera.broadcast (NewBoard { board = board, lettersTyped = lettersTyped }) )

        _ ->
            ( model, Cmd.none )


updateBoard : Time.Posix -> Char -> AlphabetBoard -> AlphabetBoard
updateBoard t c b1 =
    case c of
        'a' ->
            { b1 | a = ActivatedAt t }

        'b' ->
            { b1 | b = ActivatedAt t }

        'c' ->
            { b1 | c = ActivatedAt t }

        'd' ->
            { b1 | d = ActivatedAt t }

        'e' ->
            { b1 | e = ActivatedAt t }

        'f' ->
            { b1 | f = ActivatedAt t }

        'g' ->
            { b1 | g = ActivatedAt t }

        'h' ->
            { b1 | h = ActivatedAt t }

        'i' ->
            { b1 | i = ActivatedAt t }

        'j' ->
            { b1 | j = ActivatedAt t }

        'k' ->
            { b1 | k = ActivatedAt t }

        'l' ->
            { b1 | l = ActivatedAt t }

        'm' ->
            { b1 | m = ActivatedAt t }

        'n' ->
            { b1 | n = ActivatedAt t }

        'o' ->
            { b1 | o = ActivatedAt t }

        'p' ->
            { b1 | p = ActivatedAt t }

        'q' ->
            { b1 | q = ActivatedAt t }

        'r' ->
            { b1 | r = ActivatedAt t }

        's' ->
            { b1 | s = ActivatedAt t }

        't' ->
            { b1 | t = ActivatedAt t }

        'u' ->
            { b1 | u = ActivatedAt t }

        'v' ->
            { b1 | v = ActivatedAt t }

        'w' ->
            { b1 | w = ActivatedAt t }

        'x' ->
            { b1 | x = ActivatedAt t }

        'y' ->
            { b1 | y = ActivatedAt t }

        'z' ->
            { b1 | z = ActivatedAt t }

        _ ->
            b1


updateFromFrontend_ : SessionId -> ClientId -> ToBackend -> Model -> ( Model, Cmd BackendMsg )
updateFromFrontend_ sessionId clientId msg model =
    case msg of
        WantBoard ->
            ( model, Lamdera.sendToFrontend clientId (NewBoard { board = model.board, lettersTyped = model.lettersTyped }) )

        Click c ->
            ( model, Time.now |> Task.perform (Flip c) )


updateFromFrontend : SessionId -> ClientId -> ToBackend -> Model -> ( Model, Cmd BackendMsg )
updateFromFrontend sessionId clientId msg model =
    let
        ( model1, cmds ) =
            updateFromFrontend_ sessionId clientId msg model
    in
    ( model1, Cmd.batch [ cmds, Lamdera.sendToFrontend clientId (Log model1) ] )
