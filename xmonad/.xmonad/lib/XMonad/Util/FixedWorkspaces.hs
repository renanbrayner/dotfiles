module XMonad.Util.FixedWorkspaces where

import Data.List
import Data.Maybe
import XMonad
import qualified XMonad.StackSet as W

-- Get the screen that a workspace is fixed to.
workspaceScreen :: (WorkspaceId -> Int) -> WorkspaceId -> WindowSet -> W.Screen WorkspaceId (Layout Window) Window ScreenId ScreenDetail
workspaceScreen f ws s =
    screens !! index
      where
        screens = sortOn W.screen $ W.screens s
        index = if length screens < f ws then 0 else f ws

-- Focus the monitor that a workspace is fixed to, without viewing the workspace.
focusScreen :: (WorkspaceId -> Int) -> WorkspaceId -> WindowSet -> WindowSet
focusScreen f ws s = W.view (W.tag . W.workspace $ workspaceScreen f ws s) s

-- View a workspace on a predefined monitor.
fixedView :: (WorkspaceId -> Int) -> WorkspaceId -> WindowSet -> WindowSet
fixedView f ws s
    -- Workspace already has focus, switch to last used workspace for this screen.
    | W.currentTag s == ws =
        let toShow = find (\h -> W.screen (workspaceScreen f (W.tag h) s) == W.screen (W.current s)) (W.hidden s)
        in maybe s (\a -> W.view (W.tag a) s) toShow
    -- Workspace does not have focus (visible or hidden).
    | otherwise = W.view ws . focusScreen f ws $ s

