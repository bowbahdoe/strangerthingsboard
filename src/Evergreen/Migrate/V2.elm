module Evergreen.Migrate.V2 exposing (..)

import Evergreen.V1.Types as Old
import Evergreen.V2.Types as New
import Lamdera.Migrations exposing (..)
import Task 
import Time

defaultBoard =
    { a = New.NotActivated
    , b = New.NotActivated
    , c = New.NotActivated
    , d = New.NotActivated
    , e = New.NotActivated
    , f = New.NotActivated
    , g = New.NotActivated
    , h = New.NotActivated
    , i = New.NotActivated
    , j = New.NotActivated
    , k = New.NotActivated
    , l = New.NotActivated
    , m = New.NotActivated
    , n = New.NotActivated
    , o = New.NotActivated
    , p = New.NotActivated
    , q = New.NotActivated
    , r = New.NotActivated
    , s = New.NotActivated
    , t = New.NotActivated
    , u = New.NotActivated
    , v = New.NotActivated
    , w = New.NotActivated
    , x = New.NotActivated
    , y = New.NotActivated
    , z = New.NotActivated
    }


frontendModel : Old.FrontendModel -> ModelMigration New.FrontendModel New.FrontendMsg
frontendModel old =
    ModelMigrated ( { board = defaultBoard, time = Nothing }, Time.now |> Task.perform New.GotTime )


backendModel : Old.BackendModel -> ModelMigration New.BackendModel New.BackendMsg
backendModel old =
    ModelMigrated ( { board = defaultBoard }, Cmd.none )


frontendMsg : Old.FrontendMsg -> MsgMigration New.FrontendMsg New.FrontendMsg
frontendMsg old =
    MsgOldValueIgnored


toBackend : Old.ToBackend -> MsgMigration New.ToBackend New.BackendMsg
toBackend old =
    MsgUnchanged


backendMsg : Old.BackendMsg -> MsgMigration New.BackendMsg New.BackendMsg
backendMsg old =
    MsgOldValueIgnored


toFrontend : Old.ToFrontend -> MsgMigration New.ToFrontend New.FrontendMsg
toFrontend old =
    MsgOldValueIgnored
