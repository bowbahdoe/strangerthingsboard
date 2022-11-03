module Frontend exposing (..)

import Browser exposing (UrlRequest(..))
import Browser.Events as BrowserEvents
import Browser.Navigation as Nav
import Char
import Html
import Html.Attributes as Attr
import Json.Decode as Decode
import Lamdera
import Letters
import Task
import Time
import Types exposing (..)
import Url


keyDecoder =
    Decode.map toKey (Decode.field "key" Decode.string)


toKey string =
    case String.uncons string of
        Just ( char, "" ) ->
            Types.TypedOnFrontend (Char.toLower char)

        _ ->
            Types.NoOpFrontend


type alias Model =
    FrontendModel


app =
    Lamdera.frontend
        { init = init
        , onUrlRequest = UrlClicked
        , onUrlChange = UrlChanged
        , update = update
        , updateFromBackend = updateFromBackend
        , subscriptions = \m -> Sub.batch [ Time.every 100 GotTime, BrowserEvents.onKeyPress keyDecoder ]
        , view = view
        }


init : Url.Url -> Nav.Key -> ( Model, Cmd FrontendMsg )
init url key =
    ( { board = defaultBoard, time = Nothing }
    , Cmd.batch [ Time.now |> Task.perform GotTime, Lamdera.sendToBackend WantBoard ]
    )


update : FrontendMsg -> Model -> ( Model, Cmd FrontendMsg )
update msg model =
    case msg of
        UrlClicked urlRequest ->
            ( model, Cmd.none )

        UrlChanged url ->
            ( model, Cmd.none )

        TypedOnFrontend c ->
            ( model, Lamdera.sendToBackend (Click c) )

        GotTime time ->
            ( { model | time = Just time }, Cmd.none )

        NoOpFrontend ->
            ( model, Cmd.none )


updateFromBackend : ToFrontend -> Model -> ( Model, Cmd FrontendMsg )
updateFromBackend msg model =
    case msg of
        NewBoard board ->
            ( { model | board = board }, Cmd.none )

        Log _ ->
            ( model, Cmd.none )


activated : Time.Posix -> Types.Activation -> Char -> String
activated time activation c =
    case activation of
        Types.ActivatedAt t ->
            if Time.posixToMillis time < Time.posixToMillis t + lightOnDurationMs then
                String.fromChar c

            else
                ""

        Types.NotActivated ->
            ""


view : Model -> Browser.Document FrontendMsg
view model =
    { title = ""
    , body =
        case model.time of
            Nothing ->
                []

            Just time ->
                [ Html.div [ Attr.style "text-align" "center" ]
                    [ Letters.letters time model.board
                    , Html.h1 []
                        [ Html.text
                            (String.toUpper (activated time model.board.a 'a'
                                ++ activated time model.board.b 'b'
                                ++ activated time model.board.c 'c'
                                ++ activated time model.board.d 'd'
                                ++ activated time model.board.e 'e'
                                ++ activated time model.board.f 'f'
                                ++ activated time model.board.g 'g'
                                ++ activated time model.board.h 'h'
                                ++ activated time model.board.i 'i'
                                ++ activated time model.board.j 'j'
                                ++ activated time model.board.k 'k'
                                ++ activated time model.board.l 'l'
                                ++ activated time model.board.m 'm'
                                ++ activated time model.board.n 'n'
                                ++ activated time model.board.o 'o'
                                ++ activated time model.board.p 'p'
                                ++ activated time model.board.q 'q'
                                ++ activated time model.board.r 'r'
                                ++ activated time model.board.s 's'
                                ++ activated time model.board.t 't'
                                ++ activated time model.board.u 'u'
                                ++ activated time model.board.v 'v'
                                ++ activated time model.board.w 'w'
                                ++ activated time model.board.x 'x'
                                ++ activated time model.board.y 'y'
                                ++ activated time model.board.z 'z'
                            ))
                        ]
                    ]
                ]
    }
