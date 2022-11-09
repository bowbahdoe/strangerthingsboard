module Letters exposing (..)

import Html.Events as Events
import Svg
import Time
import Types
import VirtualDom exposing (Attribute, attribute)


blue =
    "#3478BE"


yellow =
    "#34733E"


red =
    "#EE3333"


green =
    "#34733E"


orange =
    "#EE9933"


lightOnDurationMs =
    Types.lightOnDurationMs


light : String -> Time.Posix -> Types.Activation -> Attribute a
light color time activation =
    case activation of
        Types.ActivatedAt t ->
            if Time.posixToMillis time < Time.posixToMillis t + lightOnDurationMs then
                attribute "fill" color

            else
                attribute "unlit" "abc"

        Types.NotActivated ->
            attribute "unlit" "abc"


click : Char -> Attribute Types.FrontendMsg
click c =
    Events.onClick (Types.TypedOnFrontend c)


letters : Time.Posix -> Types.AlphabetBoard -> Svg.Svg Types.FrontendMsg
letters time { a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z } =
    Svg.node "svg"
        [ attribute "xmlns" "http://www.w3.org/2000/svg", attribute "version" "1.0", attribute "width" "650.000000pt", attribute "height" "650.000000pt", attribute "viewBox" "0 0 650.000000 650.000000", attribute "preserveAspectRatio" "xMidYMid meet" ]
        [ Svg.node "g"
            [ attribute "transform" "translate(0.000000,650.000000) scale(0.100000,-0.100000)", attribute "fill" "#000000", attribute "stroke" "none" ]
            [ Svg.node "path" [ attribute "d" "M4563 4795 c-94 -17 -140 -33 -374 -126 -224 -90 -281 -105 -435 -114 -107 -7 -115 -6 -243 30 -146 41 -112 40 -431 15 -316 -25 -413 -20 -521 29 -39 17 -74 21 -240 27 -182 5 -197 7 -243 31 -36 19 -57 24 -88 20 -39 -5 -99 8 -312 70 -76 22 -103 25 -180 20 -94 -5 -130 -15 -432 -121 -80 -28 -165 -51 -217 -57 -48 -7 -87 -16 -87 -21 0 -31 459 69 605 132 28 12 52 17 57 12 5 -5 9 -32 10 -61 0 -45 2 -51 21 -51 43 0 52 14 34 52 -8 18 -17 44 -19 58 -3 22 1 25 42 32 67 10 123 0 238 -43 57 -22 130 -42 163 -46 67 -7 72 -16 32 -63 -26 -31 -26 -33 -8 -46 34 -25 62 -16 56 19 -1 4 5 23 13 41 l14 34 59 -15 c32 -8 76 -19 98 -24 22 -6 72 -8 113 -4 l72 7 0 -34 c0 -19 -5 -39 -11 -45 -20 -20 -2 -45 28 -41 27 3 28 4 25 61 l-4 57 32 0 c51 0 150 -29 189 -56 20 -13 53 -29 75 -35 35 -10 38 -13 33 -39 -8 -37 11 -54 47 -41 26 10 27 28 4 58 -7 8 9 13 59 18 37 4 115 14 173 23 107 17 291 20 343 5 l28 -8 -25 -38 c-32 -47 -32 -55 -2 -63 31 -7 46 1 46 26 0 11 5 31 12 45 11 25 14 26 72 21 34 -3 96 -8 139 -12 l77 -6 0 -34 c0 -19 -4 -34 -10 -34 -18 0 -11 -29 9 -40 29 -15 52 -2 50 29 -5 67 -5 67 83 79 44 7 125 27 179 46 l97 34 5 -28 c3 -15 4 -36 1 -47 -7 -26 9 -37 42 -29 25 7 32 34 14 52 -5 5 -11 24 -12 42 -3 32 -1 34 77 68 129 58 250 85 408 91 154 6 154 6 120 -64 -18 -39 -9 -53 34 -53 19 0 21 6 21 51 1 73 9 77 89 45 37 -14 120 -37 183 -51 148 -30 233 -61 404 -147 206 -103 248 -121 244 -102 -4 19 -387 199 -541 255 -59 21 -153 48 -210 59 -56 12 -120 30 -143 41 -48 23 -168 25 -281 4z m260 -12 c3 -5 -59 -8 -137 -8 -77 0 -127 3 -111 6 43 9 243 10 248 2z m-3463 -37 c-46 -19 -126 -45 -225 -73 -11 -3 -17 -2 -13 2 9 9 260 95 278 95 8 -1 -10 -11 -40 -24z m3665 -20 c28 -8 41 -14 30 -14 -21 0 -107 25 -90 27 6 0 33 -6 60 -13z m-2978 -42 c-3 -3 -12 -4 -19 -1 -8 3 -5 6 6 6 11 1 17 -2 13 -5z m1406 -101 c37 -8 66 -17 64 -19 -2 -2 -66 4 -143 13 -106 14 -131 19 -104 24 43 8 93 3 183 -18z m-734 -19 c14 -13 -12 -13 -40 0 l-34 16 35 -6 c19 -4 37 -8 39 -10z m266 5 c-22 -4 -56 -7 -75 -7 -32 1 -31 2 10 8 25 4 59 7 75 7 25 1 23 -1 -10 -8z m-137 -16 c-16 -2 -40 -2 -55 0 -16 2 -3 4 27 4 30 0 43 -2 28 -4z" ] []
            , Svg.node "path" [ light blue time h, attribute "d" "M4745 4613 c-20 -19 -15 -78 8 -101 12 -12 17 -10 36 14 47 60 7 139 -44 87z" ] []
            , Svg.node "path" [ light blue time b, attribute "d" "M1908 4549 c-13 -7 -18 -23 -18 -59 0 -27 5 -52 10 -55 6 -4 24 7 40 24 35 34 40 75 11 91 -23 12 -22 12 -43 -1z" ] []
            , Svg.node "path" [ light yellow time a, attribute "d" "M1465 4610 c-13 -7 -18 -23 -18 -59 0 -27 5 -52 10 -55 6 -4 24 7 40 24 35 34 40 75 11 91 -23 12 -22 12 -43 -1z" ] []
            , Svg.node "path" [ light red time c, attribute "d" "M2342 4488 c-17 -17 -15 -69 4 -96 15 -22 17 -22 35 -6 28 26 36 84 14 101 -23 16 -37 17 -53 1z" ] []
            , Svg.node "path" [ light yellow time f, attribute "d" "M3670 4390 c-10 -12 -10 -21 0 -44 15 -36 45 -65 59 -57 16 11 24 72 12 95 -14 25 -53 28 -71 6z" ] []
            , Svg.node "path" [ light red time g, attribute "d" "M4130 4475 c-10 -12 -10 -21 0 -44 15 -36 45 -65 59 -57 16 11 24 72 12 95 -14 25 -53 28 -71 6z" ] []
            , Svg.node "path" [ click 'h', attribute "d" "M4870 4475 c-23 -12 -24 -17 -21 -89 l3 -76 -60 0 c-89 0 -92 2 -92 71 0 53 -2 59 -21 59 -42 0 -47 -19 -49 -171 -1 -79 -2 -150 -1 -157 1 -9 12 -12 34 -10 l32 3 5 75 5 75 75 0 c84 0 77 9 79 -96 1 -52 3 -57 26 -61 14 -3 25 -1 25 6 1 33 10 156 15 186 6 49 -6 167 -19 185 -9 12 -15 12 -36 0z" ] []
            , Svg.node "path" [ light green time d, attribute "d" "M2758 4439 c-26 -14 -22 -59 7 -94 24 -29 25 -29 40 -11 21 27 19 79 -3 99 -21 20 -21 20 -44 6z" ] []
            , Svg.node "path" [ click 'a', attribute "d" "M1458 4402 c-10 -21 -18 -41 -18 -44 0 -4 -10 -28 -22 -55 -11 -26 -22 -52 -24 -58 -1 -5 -16 -47 -32 -92 -25 -68 -28 -84 -16 -93 27 -23 51 -1 75 68 l24 67 50 5 c28 3 56 9 62 13 16 10 45 -36 74 -119 17 -49 28 -64 47 -69 34 -8 36 -3 13 37 -11 18 -31 67 -45 109 -20 61 -68 175 -105 249 -5 8 -21 16 -37 18 -25 2 -31 -3 -46 -36z m89 -114 l14 -28 -41 0 -40 0 21 43 c15 27 24 37 27 27 3 -8 11 -27 19 -42z" ] []
            , Svg.node "path" [ light blue time e, attribute "d" "M3300 4421 c-12 -24 -13 -71 -1 -90 7 -11 13 -10 34 3 34 23 54 71 37 91 -18 21 -57 19 -70 -4z" ] []
            , Svg.node "path" [ click 'b', attribute "d" "M1833 4362 c-45 -19 -103 -80 -86 -90 14 -9 56 -239 49 -267 -3 -11 4 -30 14 -43 15 -19 23 -21 38 -13 11 6 35 8 53 5 92 -16 161 9 192 68 17 33 17 42 5 85 -11 40 -21 53 -60 78 -26 17 -47 32 -47 35 -1 3 13 11 29 18 26 12 30 19 30 53 0 37 -2 40 -53 64 -62 29 -105 31 -164 7z m128 -52 c10 -6 19 -15 19 -20 0 -17 -64 -43 -117 -47 -51 -3 -53 -2 -53 22 0 20 5 25 24 25 13 0 39 7 57 15 41 17 45 18 70 5z m-5 -166 c63 -18 95 -54 87 -97 -8 -39 -30 -47 -115 -44 l-73 3 -9 68 c-13 92 3 102 110 70z" ] []
            , Svg.node "path" [ click 'g', attribute "d" "M4195 4314 c-45 -23 -62 -41 -84 -90 -36 -77 -23 -121 53 -175 39 -29 108 -40 121 -19 3 5 12 7 19 4 20 -8 41 77 26 106 -6 12 -9 28 -6 36 7 19 -32 28 -75 17 -60 -16 -47 -64 19 -66 32 -2 38 -5 29 -14 -26 -25 -82 -19 -112 12 -58 57 -14 160 73 172 25 3 41 10 39 17 -6 18 -69 18 -102 0z" ] []
            , Svg.node "path" [ click 'c', attribute "d" "M2319 4277 c-55 -37 -84 -100 -82 -178 2 -103 48 -172 141 -215 63 -29 115 -27 132 5 13 26 -11 45 -49 38 -66 -14 -181 86 -181 157 0 18 11 55 25 83 29 58 59 74 115 62 71 -15 75 -15 78 7 2 15 -7 29 -26 43 -41 29 -108 28 -153 -2z" ] []
            , Svg.node "path" [ click 'e', attribute "d" "M3249 4273 c-30 -5 -47 -35 -56 -100 -5 -35 -11 -47 -29 -54 -28 -10 -31 -24 -8 -33 14 -5 16 -17 10 -80 -6 -71 -6 -74 19 -90 22 -14 26 -15 31 -2 10 25 32 26 134 10 96 -16 138 -14 125 6 -3 5 -1 10 6 10 7 0 5 8 -6 20 -10 11 -31 20 -46 20 -15 0 -40 5 -56 11 -15 6 -54 11 -86 13 -31 1 -57 5 -57 9 0 4 0 16 0 26 0 19 29 29 133 46 33 5 36 8 22 21 -8 9 -15 20 -15 25 0 5 -27 9 -61 9 l-61 0 7 28 c10 41 20 47 91 52 35 3 65 9 67 15 5 24 -102 49 -164 38z m146 -33 c3 -5 1 -10 -4 -10 -6 0 -11 5 -11 10 0 6 2 10 4 10 3 0 8 -4 11 -10z" ] []
            , Svg.node "path" [ click 'f', attribute "d" "M3662 4248 c-6 -6 -20 -15 -33 -22 -28 -14 -27 -29 3 -36 22 -6 23 -12 32 -118 8 -109 9 -112 32 -112 22 0 24 4 24 49 l0 49 46 11 c39 10 44 14 34 26 -7 8 -27 15 -45 15 -29 0 -33 4 -37 30 -4 28 -3 29 46 35 28 4 56 6 61 5 6 -1 21 -2 35 -1 l25 1 -29 15 c-16 9 -35 14 -42 11 -7 -3 -18 2 -24 9 -7 8 -28 17 -49 21 -20 4 -43 10 -52 15 -9 5 -20 4 -27 -3z" ] []
            , Svg.node "path" [ click 'd', attribute "d" "M2700 4236 c-5 -5 -10 -15 -10 -22 0 -7 -13 -17 -30 -23 -17 -5 -30 -17 -30 -26 0 -13 9 -16 42 -13 43 3 43 2 50 -37 4 -22 7 -89 7 -149 l1 -108 35 6 c80 15 144 57 196 130 45 61 36 153 -18 200 -40 35 -219 66 -243 42z m218 -92 c17 -12 22 -25 22 -60 0 -36 -6 -51 -35 -83 -39 -43 -93 -69 -100 -48 -5 17 -15 92 -21 155 l-5 52 58 0 c37 0 67 -6 81 -16z" ] []
            , Svg.node "path" [ attribute "d" "M925 4039 c-22 -4 -68 -8 -102 -8 -51 -1 -63 -4 -63 -17 0 -13 8 -15 48 -10 26 3 107 9 180 12 146 7 142 9 118 -59 -14 -37 -13 -39 10 -49 34 -16 48 1 45 57 -2 41 0 45 21 45 57 0 248 -66 446 -153 l94 -41 -3 -45 c-3 -68 -1 -71 26 -71 31 0 40 20 27 60 -6 16 -8 30 -4 30 4 0 62 -23 127 -51 66 -28 161 -66 210 -84 128 -48 234 -91 240 -97 3 -3 -6 -22 -20 -42 -21 -31 -23 -41 -14 -52 17 -21 53 -13 57 11 2 11 8 31 13 45 l10 26 164 -1 c159 0 165 -1 165 -20 0 -12 -5 -26 -11 -32 -20 -20 -2 -43 32 -43 29 0 31 2 26 28 -3 15 -3 39 0 55 5 27 6 27 82 27 60 0 97 -7 167 -31 49 -17 121 -33 162 -36 79 -6 79 -7 74 -85 -2 -32 11 -42 44 -34 24 6 32 33 15 51 -4 6 -11 22 -14 36 l-6 25 122 12 c67 7 187 25 267 41 79 17 146 28 147 27 2 -2 -8 -20 -22 -40 -32 -47 -32 -64 0 -72 29 -7 38 -2 40 24 1 9 7 34 14 55 l13 37 89 0 c75 0 100 5 165 30 42 17 83 29 91 26 9 -4 14 -18 13 -38 -3 -54 -1 -58 29 -58 39 0 45 13 26 49 -20 41 -19 51 8 51 12 0 67 16 122 36 143 51 218 74 224 68 3 -2 -1 -25 -7 -51 -14 -52 -7 -66 29 -61 23 3 24 6 21 64 l-4 61 89 11 c192 24 233 25 317 3 44 -12 92 -21 107 -21 35 0 43 -13 27 -40 -11 -17 -11 -22 2 -30 8 -5 25 -10 38 -10 18 0 22 5 22 33 l0 34 173 6 c217 8 287 16 287 33 0 9 -57 14 -247 18 -239 5 -474 19 -558 31 -28 5 -76 -3 -162 -24 -67 -17 -180 -43 -250 -57 -71 -14 -179 -41 -240 -60 -72 -22 -134 -34 -170 -34 -32 0 -101 -10 -153 -21 -52 -12 -158 -25 -236 -30 -141 -8 -209 -20 -357 -60 l-79 -21 -101 22 c-56 11 -131 27 -167 35 -77 17 -201 19 -358 5 -91 -8 -132 -7 -205 5 -122 19 -233 51 -282 80 -93 54 -227 115 -320 145 -55 18 -159 63 -231 100 -138 71 -212 94 -424 130 -120 21 -207 24 -275 9z m618 -116 c31 -14 56 -27 54 -29 -4 -4 -149 55 -157 63 -9 9 44 -8 103 -34z m3380 -130 c-13 -2 -33 -2 -45 0 -13 2 -3 4 22 4 25 0 35 -2 23 -4z m-2977 -43 c79 -32 164 -74 129 -65 -34 8 -231 94 -218 95 7 0 47 -14 89 -30z m3289 20 c11 -18 -18 -20 -85 -6 l-65 14 72 1 c39 0 75 -4 78 -9z m374 -12 c-19 -4 -81 -7 -139 -8 -160 -2 -190 -1 -190 8 0 4 82 7 181 7 100 0 166 -3 148 -7z m-1189 -74 c-46 -20 -150 -44 -150 -35 0 7 142 49 170 50 8 0 -1 -7 -20 -15z m-294 -63 c-12 -19 -130 -42 -171 -34 -40 9 -39 9 40 22 44 7 87 14 95 16 30 6 41 5 36 -4z m-407 -55 c-6 -7 -320 -58 -325 -53 -7 6 74 28 156 42 73 13 178 19 169 11z m-604 -40 c28 -8 41 -14 30 -14 -21 0 -107 25 -90 27 6 0 33 -6 60 -13z" ] []
            , Svg.node "path" [ light blue time i, attribute "d" "M1088 3865 c-9 -21 -8 -32 5 -60 9 -19 23 -35 31 -35 18 0 38 51 34 86 -2 23 -9 30 -30 32 -22 3 -30 -2 -40 -23z" ] []
            , Svg.node "path" [ click 'i', attribute "d" "M941 3718 c-16 -5 -21 -14 -19 -30 3 -25 43 -36 126 -37 l43 -1 -6 -152 c-10 -200 -10 -203 -26 -201 -8 2 -35 7 -61 11 -26 5 -50 7 -53 4 -12 -12 -4 -51 13 -56 50 -15 126 -29 207 -36 50 -5 107 -12 129 -16 l38 -7 -16 25 c-12 19 -32 29 -75 38 -32 7 -64 16 -71 20 -9 6 -10 49 -5 188 7 173 8 181 29 185 11 3 33 4 47 2 17 -2 30 4 37 16 8 13 9 19 1 19 -5 0 -8 4 -5 9 9 15 -35 21 -150 21 -60 0 -121 2 -135 3 -14 2 -35 0 -48 -5z" ] []
            , Svg.node "path" [ light red time j, attribute "d" "M1732 3678 c-18 -18 -14 -52 9 -82 35 -45 59 -30 59 38 0 35 -15 56 -40 56 -9 0 -21 -5 -28 -12z" ] []
            , Svg.node "path" [ light yellow time s, attribute "d" "M1700 2600 c-18 -18 -14 -52 9 -82 35 -45 59 -30 59 38 0 35 -15 56 -40 56 -9 0 -21 -5 -28 -12z" ] []
            , Svg.node "path" [ light red time q, attribute "d" "M5216 3634 c-9 -8 -16 -24 -16 -35 0 -25 27 -79 40 -79 14 0 40 55 40 83 0 43 -35 60 -64 31z" ] []
            , Svg.node "path" [ light yellow time x, attribute "d" "M4100 2475 c-9 -8 -16 -24 -16 -35 0 -25 27 -79 40 -79 14 0 40 55 40 83 0 43 -35 60 -64 31z" ] []
            , Svg.node "path" [ light green time p, attribute "d" "M4615 3587 c-13 -21 -14 -30 -3 -62 7 -21 18 -40 25 -42 23 -8 62 79 46 103 -5 6 -18 14 -30 18 -17 5 -26 1 -38 -17z" ] []
            , Svg.node "path" [ light red time o, attribute "d" "M4258 3509 c-26 -15 -22 -53 8 -89 21 -24 29 -28 40 -19 19 16 18 84 -2 103 -18 19 -23 19 -46 5z" ] []
            , Svg.node "path" [ click 'j', attribute "d" "M1916 3502 c-2 -1 -25 -4 -52 -7 -133 -11 -388 -95 -292 -95 19 0 20 -2 8 -10 -16 -11 60 -5 132 10 l37 8 10 -47 c40 -176 39 -212 -2 -257 -32 -35 -36 -37 -96 -35 -34 0 -76 8 -93 17 -38 20 -42 15 -22 -24 15 -31 34 -39 104 -43 72 -5 101 2 127 29 62 66 74 133 48 281 -8 46 -14 85 -13 87 2 1 29 9 60 17 31 8 62 20 70 26 7 6 24 20 38 30 l25 19 -43 -1 c-24 -1 -45 -3 -46 -5z" ] []
            , Svg.node "path" [ click 'q', attribute "d" "M5165 3432 c-148 -102 -99 -332 76 -356 34 -5 57 -2 92 13 l45 20 57 -50 c31 -27 62 -49 70 -49 7 0 20 -2 27 -5 45 -17 -42 138 -92 165 -13 7 -16 20 -12 68 7 92 -36 164 -119 202 -59 27 -96 25 -144 -8z m160 -46 c46 -30 78 -121 60 -169 -5 -12 -12 -11 -45 5 -21 11 -44 26 -51 34 -14 17 -49 19 -49 3 0 -6 -7 -8 -17 -5 -14 6 -14 3 3 -15 24 -29 63 -65 89 -84 19 -13 16 -14 -31 -15 -89 0 -144 53 -144 138 0 107 99 164 185 108z" ] []
            , Svg.node "path" [ light red time n, attribute "d" "M3756 3434 c-18 -17 -22 -99 -6 -109 6 -4 24 7 40 24 35 34 40 75 11 91 -25 13 -27 13 -45 -6z" ] []
            , Svg.node "path" [ light orange time m, attribute "d" "M3250 3350 c-18 -17 -22 -99 -6 -109 6 -4 24 7 40 24 35 34 40 75 11 91 -25 13 -27 13 -45 -6z" ] []
            , Svg.node "path" [ light yellow time t, attribute "d" "M2100 2520 c-18 -17 -22 -99 -6 -109 6 -4 24 7 40 24 35 34 40 75 11 91 -25 13 -27 13 -45 -6z" ] []
            , Svg.node "path" [ light blue time k, attribute "d" "M2270 3421 c-14 -27 -13 -64 3 -85 12 -17 15 -15 45 18 18 20 32 42 32 49 0 37 -62 51 -80 18z" ] []
            , Svg.node "path" [ light green time l, attribute "d" "M2694 3415 c-13 -32 13 -105 37 -105 15 0 40 60 37 88 -2 22 -9 28 -36 30 -22 2 -34 -2 -38 -13z" ] []
            , Svg.node "path" [ click 'p', attribute "d" "M4621 3411 c-54 -14 -64 -30 -51 -82 6 -24 28 -122 47 -216 l36 -173 39 0 c37 0 38 1 26 23 -7 12 -15 45 -18 72 l-5 50 39 18 c21 9 45 17 53 17 25 0 100 88 106 123 7 47 -20 92 -85 141 -41 31 -124 43 -187 27z m157 -66 c57 -29 93 -82 79 -117 -4 -13 -147 -88 -165 -88 -5 0 -18 39 -29 88 -11 48 -23 94 -27 103 -5 12 1 19 26 26 37 12 75 8 116 -12z" ] []
            , Svg.node "path" [ click 'o', attribute "d" "M4284 3315 c-47 -49 -84 -145 -106 -277 -10 -63 -9 -74 7 -104 10 -19 33 -43 51 -53 66 -39 133 7 192 131 46 99 51 123 37 213 -11 68 -17 83 -44 107 -48 43 -85 38 -137 -17z m115 -14 c44 -44 34 -165 -24 -295 -26 -60 -61 -89 -97 -84 -27 4 -55 53 -40 71 5 7 12 47 15 89 6 86 29 147 77 201 37 43 43 44 69 18z" ] []
            , Svg.node "path" [ click 'n', attribute "d" "M3886 3312 c-3 -5 -1 -49 4 -98 21 -189 26 -254 19 -254 -4 0 -32 33 -62 73 -99 128 -112 141 -125 125 -8 -11 -9 -24 -1 -53 10 -35 9 -222 -2 -254 -6 -20 14 -24 36 -7 18 13 20 25 17 113 l-2 98 27 -31 c83 -92 123 -142 123 -151 0 -6 7 -17 16 -24 14 -11 18 -10 30 6 18 24 17 84 -4 279 -15 131 -21 161 -37 172 -22 16 -32 17 -39 6z" ] []
            , Svg.node "path" [ click 'k', attribute "d" "M2164 3275 c-13 -20 -15 -42 -10 -122 3 -54 5 -128 6 -164 0 -51 4 -68 15 -73 20 -7 34 29 43 109 l7 60 101 -97 c93 -90 102 -97 120 -83 18 13 13 20 -89 120 -59 58 -105 110 -101 116 3 5 42 28 86 50 44 22 92 52 107 67 l26 27 -22 3 c-13 2 -63 -19 -121 -52 -54 -31 -101 -56 -105 -56 -4 0 -7 11 -7 24 0 24 -26 96 -35 96 -2 0 -12 -11 -21 -25z" ] []
            , Svg.node "path" [ click 'l', attribute "d" "M2696 3224 c-3 -9 -6 -76 -6 -149 l0 -134 -30 -18 c-32 -18 -41 -57 -17 -66 8 -3 43 1 78 8 44 9 78 11 109 5 65 -13 147 -18 161 -10 11 7 -75 43 -183 76 l-56 17 -4 121 c-2 84 -8 128 -18 144 -17 26 -26 28 -34 6z" ] []
            , Svg.node "path" [ click 'm', attribute "d" "M3410 3199 c0 -23 -70 -189 -80 -189 -3 0 -11 15 -18 33 -17 45 -81 129 -92 122 -6 -4 -7 -13 -1 -23 5 -8 5 -23 1 -31 -11 -21 -50 -185 -50 -209 0 -23 32 -53 46 -44 6 4 19 42 28 85 10 44 22 75 27 71 6 -3 20 -27 32 -52 16 -33 28 -47 42 -47 16 0 19 6 17 26 -2 28 52 158 60 143 3 -5 26 -75 52 -156 26 -82 50 -148 54 -148 4 0 13 4 21 9 20 13 -32 200 -111 404 -12 32 -28 36 -28 6z" ] []
            , Svg.node "path" [ attribute "d" "M763 2945 c4 -5 51 -12 105 -15 l97 -7 -102 -1 c-69 -1 -103 -6 -103 -13 0 -8 51 -10 183 -5 100 3 200 2 222 -2 37 -7 40 -10 36 -37 -9 -67 -8 -70 24 -70 29 0 30 1 27 44 l-4 44 44 -7 c54 -9 314 -70 389 -92 l55 -16 -11 -42 c-6 -22 -15 -49 -20 -60 -9 -21 8 -36 42 -36 20 0 21 5 22 61 0 34 1 63 3 64 2 2 41 -13 88 -32 103 -43 172 -63 223 -63 35 0 37 -2 39 -32 0 -18 0 -45 -1 -60 -2 -25 1 -28 28 -28 35 0 46 12 33 37 -5 10 -12 32 -15 50 l-6 31 64 7 c35 4 108 2 162 -3 54 -6 144 -14 199 -17 l102 -7 -12 -29 c-12 -34 3 -51 39 -47 16 3 20 10 18 40 l-2 37 55 7 c31 3 100 3 153 -2 53 -5 131 -8 174 -7 77 3 78 3 66 -20 -6 -12 -18 -30 -27 -39 -12 -14 -12 -20 -2 -33 15 -18 49 -20 54 -2 2 6 10 32 18 57 13 41 18 46 54 52 84 15 163 9 224 -17 33 -14 66 -25 75 -25 20 0 37 -46 30 -81 -7 -32 6 -43 41 -35 24 6 34 39 15 50 -5 3 -11 17 -13 31 l-5 25 111 0 c103 0 291 13 362 25 30 5 30 4 27 -27 -3 -18 -9 -43 -16 -56 -13 -27 4 -44 38 -40 16 3 20 11 21 43 1 74 1 75 37 73 17 0 82 5 144 12 62 8 116 10 120 6 4 -4 7 -32 7 -62 -2 -53 -1 -54 28 -54 31 0 47 22 30 43 -6 6 -12 27 -14 46 l-3 34 70 14 c38 8 85 21 105 29 19 8 94 26 165 39 112 21 210 44 303 71 21 6 22 4 16 -22 -4 -16 -14 -39 -21 -51 -13 -19 -12 -23 6 -32 27 -15 51 -14 52 2 2 53 9 101 16 108 4 4 51 12 104 16 77 7 107 5 160 -9 65 -17 229 -24 229 -10 0 4 -39 8 -87 9 -49 1 -99 6 -113 12 -20 9 -1 11 88 7 61 -2 112 0 112 4 0 11 -157 23 -231 18 -33 -2 -87 1 -119 8 -64 13 -118 6 -172 -22 -16 -8 -88 -26 -161 -40 -73 -14 -172 -36 -222 -49 -113 -31 -629 -95 -768 -95 -56 0 -142 -7 -192 -16 -112 -20 -177 -13 -350 33 -173 46 -312 53 -510 25 -107 -15 -160 -18 -225 -12 -47 5 -195 11 -330 14 -200 5 -271 10 -390 31 -271 48 -439 90 -575 145 l-130 53 -170 8 c-93 4 -231 11 -305 15 -74 4 -132 3 -127 -1z m657 -63 c60 -27 35 -26 -80 3 l-95 25 65 -4 c36 -2 85 -13 110 -24z m3940 -42 c-8 -5 -33 -9 -55 -9 -31 0 -36 2 -20 9 29 13 94 13 75 0z m-3332 -124 c75 -14 148 -26 162 -28 18 -3 11 -7 -25 -13 -63 -10 -182 12 -257 49 -29 15 -45 24 -35 21 10 -3 80 -16 155 -29z m1340 -31 c1 -1 -32 -8 -75 -14 -118 -18 -264 -24 -303 -14 -32 9 -26 11 65 22 55 6 118 13 140 14 40 2 167 -4 173 -8z m1257 -6 c-38 -11 -247 -32 -271 -27 -18 4 222 35 276 36 23 0 22 -1 -5 -9z m-1995 -9 l65 -7 -75 0 c-41 -1 -100 2 -130 7 l-55 7 65 0 c36 1 94 -3 130 -7z m1670 -30 c-14 -4 -38 -8 -55 -8 -29 0 -29 0 -5 8 14 4 39 8 55 8 29 0 29 0 5 -8z m-705 -10 c13 -5 14 -9 5 -9 -8 0 -24 4 -35 9 -13 5 -14 9 -5 9 8 0 24 -4 35 -9z" ] []
            , Svg.node "path" [ light green time r, attribute "d" "M1192 2768 c-7 -7 -12 -23 -12 -35 0 -28 26 -83 40 -83 14 0 40 55 40 83 0 27 -17 47 -40 47 -9 0 -21 -5 -28 -12z" ] []
            , Svg.node "path" [ click 'r', attribute "d" "M1146 2590 l-60 -5 -4 -182 c-4 -180 -4 -181 18 -188 14 -4 25 -2 30 5 4 7 13 9 20 5 8 -5 11 1 9 21 -1 16 -1 48 -1 72 2 39 4 42 22 32 11 -6 56 -45 100 -86 77 -71 99 -83 108 -56 4 12 0 16 -106 115 -62 59 -69 77 -30 77 12 0 41 12 65 26 40 23 43 28 41 60 -3 55 -58 97 -138 107 -8 1 -42 0 -74 -3z m142 -96 c18 -13 21 -19 11 -30 -6 -8 -8 -14 -3 -14 21 0 -17 -22 -47 -27 -73 -13 -74 -12 -77 40 l-3 47 48 0 c28 0 58 -7 71 -16z" ] []
            , Svg.node "path" [ attribute "d" "M1265 2440 c-3 -6 1 -7 9 -4 18 7 21 14 7 14 -6 0 -13 -4 -16 -10z" ] []
            , Svg.node "path" [ light blue time u, attribute "d" "M2673 2543 c-18 -7 -16 -74 3 -101 20 -29 39 -16 55 39 17 54 -9 82 -58 62z" ] []
            , Svg.node "path" [ light red time v, attribute "d" "M3116 2508 c-18 -26 -20 -61 -6 -89 10 -17 13 -18 34 -4 21 14 46 54 46 75 0 13 -30 40 -45 40 -8 0 -21 -10 -29 -22z" ] []
            , Svg.node "path" [ light red time y, attribute "d" "M4506 2491 c-14 -15 -15 -23 -6 -47 12 -31 38 -64 51 -64 9 0 29 56 29 81 0 20 -26 49 -44 49 -7 0 -20 -8 -30 -19z" ] []
            , Svg.node "path" [ light orange time z, attribute "d" "M5150 2650 c-14 -15 -15 -23 -6 -47 12 -31 38 -64 51 -64 9 0 29 56 29 81 0 20 -26 49 -44 49 -7 0 -20 -8 -30 -19z" ] []
            , Svg.node "path" [ click 'z', attribute "d" "M5048 2480 c-59 -11 -84 -40 -56 -68 8 -8 20 -7 46 3 36 16 172 21 172 7 0 -4 -34 -41 -75 -82 -41 -41 -75 -79 -75 -85 0 -6 -16 -26 -35 -45 -42 -41 -59 -87 -46 -123 l10 -25 231 -1 231 0 10 26 c17 46 4 49 -203 57 -106 4 -194 9 -196 11 -7 6 197 229 224 245 20 12 24 22 22 50 -2 29 -7 34 -23 32 -27 -4 -29 -4 -120 1 -44 2 -97 1 -117 -3z" ] []
            , Svg.node "path" [ light blue time w, attribute "d" "M3621 2462 c-17 -31 32 -114 58 -98 16 11 24 72 12 95 -14 26 -57 28 -70 3z" ] []
            , Svg.node "path" [ click 's', attribute "d" "M1722 2400 c-58 -19 -112 -63 -112 -91 0 -10 12 -27 28 -38 15 -12 32 -24 37 -29 6 -4 24 -14 42 -21 44 -18 123 -104 123 -134 0 -13 -12 -34 -26 -48 -22 -20 -35 -24 -93 -24 -77 0 -110 14 -135 56 -9 16 -24 29 -32 29 -15 0 -19 -16 -6 -24 5 -3 7 -19 4 -36 -4 -28 -1 -32 39 -49 24 -10 72 -22 106 -25 73 -8 126 11 180 63 29 28 31 33 22 72 -13 56 -56 113 -116 155 -26 18 -61 44 -78 58 l-30 24 30 12 c17 6 42 9 57 6 18 -3 35 2 52 15 60 48 9 64 -92 29z" ] []
            , Svg.node "path" [ click 'y', attribute "d" "M4726 2355 c-10 -8 -22 -12 -26 -10 -4 2 -12 -6 -18 -19 -6 -13 -32 -54 -58 -90 l-47 -65 -36 30 c-113 94 -135 109 -144 100 -21 -21 4 -61 73 -113 38 -29 69 -57 70 -63 0 -5 -18 -34 -40 -63 -22 -29 -40 -55 -40 -58 0 -3 -14 -26 -30 -51 -33 -48 -32 -63 4 -63 17 0 36 19 77 80 29 44 57 80 61 80 5 0 8 5 8 11 0 6 17 31 39 57 21 26 46 61 54 77 8 17 27 41 42 55 38 35 60 90 43 106 -10 10 -17 10 -32 -1z" ] []
            , Svg.node "path" [ click 't', attribute "d" "M2052 2317 c-20 -9 -20 -9 -1 -28 10 -10 33 -19 49 -19 35 0 34 8 15 -145 -16 -130 -12 -148 34 -143 24 3 27 9 38 73 6 39 14 100 18 137 l7 68 60 -4 c33 -2 72 -1 85 3 l25 7 -26 12 c-15 7 -24 16 -21 22 16 26 -229 41 -283 17z" ] []
            , Svg.node "path" [ click 'x', attribute "d" "M4292 2296 c-12 -6 -42 -41 -66 -77 -68 -102 -68 -101 -131 -39 -54 53 -54 53 -63 29 -10 -26 0 -48 51 -108 31 -37 31 -73 -2 -101 -9 -8 -28 -32 -41 -52 -13 -20 -28 -34 -32 -32 -4 3 -6 -9 -5 -26 2 -30 17 -43 40 -35 6 3 33 39 60 81 l47 75 59 -62 c56 -59 90 -73 83 -34 -2 10 -23 48 -48 85 -24 37 -44 70 -44 74 0 3 15 27 34 53 48 69 88 148 84 166 -2 13 -7 14 -26 3z" ] []
            , Svg.node "path" [ click 'v', attribute "d" "M3006 2227 c2 -73 12 -108 57 -207 14 -30 28 -72 32 -93 4 -20 12 -40 17 -43 17 -11 55 17 71 52 9 18 34 62 55 96 21 35 45 74 53 88 8 14 22 34 31 45 10 12 19 30 21 40 1 11 6 26 11 33 14 22 -8 33 -31 17 -20 -14 -99 -133 -151 -227 -12 -23 -24 -43 -27 -46 -6 -6 -30 55 -44 113 -6 28 -18 66 -25 85 -8 19 -20 50 -26 68 -7 18 -20 37 -29 42 -15 8 -17 1 -15 -63z" ] []
            , Svg.node "path" [ click 'w', attribute "d" "M3835 2265 c-18 -39 -39 -104 -75 -227 -24 -81 -40 -100 -40 -48 0 16 -14 73 -31 125 -20 64 -28 106 -24 125 8 38 -5 44 -39 16 -30 -23 -50 -68 -71 -156 l-13 -55 -2 40 c-2 70 -12 126 -26 153 -8 15 -14 33 -14 40 0 17 -17 15 -24 -4 -11 -28 -6 -128 10 -199 8 -38 17 -94 18 -123 2 -29 6 -56 10 -60 16 -15 54 50 77 132 13 47 26 86 29 86 4 0 44 -118 67 -202 5 -16 10 -27 13 -26 3 1 15 -4 28 -11 20 -11 26 -10 41 8 21 24 126 394 117 410 -13 21 -34 11 -51 -24z" ] []
            , Svg.node "path" [ click 'u', attribute "d" "M2764 2269 c-4 -7 -13 -49 -20 -93 -30 -184 -52 -236 -99 -236 -41 0 -53 34 -58 158 -2 62 -7 115 -9 118 -10 9 -37 -8 -44 -29 -20 -63 -4 -220 28 -274 28 -47 45 -53 99 -37 49 15 94 61 103 105 2 13 7 31 10 39 3 8 10 46 15 84 6 37 17 76 26 86 10 11 15 31 13 52 -2 27 -8 34 -30 36 -14 2 -30 -2 -34 -9z" ] []
            ]
        ]
