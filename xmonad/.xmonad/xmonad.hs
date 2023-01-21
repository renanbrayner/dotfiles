{-# OPTIONS_GHC -dynamic #-}
{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Map as M
import Data.Monoid
import System.Exit
import XMonad
import XMonad.Actions.Search
import XMonad.Hooks.DynamicLog (PP (..), dynamicLogWithPP, shorten, wrap, xmobarColor, xmobarPP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (doCenterFloat, isDialog)
import XMonad.Layout.Dwindle
import XMonad.Layout.Gaps
import XMonad.Layout.IndependentScreens
import XMonad.Layout.MultiColumns
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import qualified XMonad.StackSet as W
import XMonad.Util.Run
import XMonad.Util.SpawnOnce (spawnOnce)

import Data.Text(pack, unpack, replace)

formatWs :: String -> String
formatWs = unpack . replace "1_" "L" . replace "0_" "R" . pack

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth = 3
myModMask = mod4Mask

-- Comments used by rice-ctrl script
-- THEME_START
myNormalBorderColor = "#073642"
myFocusedBorderColor = "#2aa198"
-- THEME_END

-- most keybinds are defined in ~/.config/sxhkd/sxhkdrc
myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList $
    [
      ((modm .|. shiftMask, xK_q), kill),
      ((modm, xK_Tab), sendMessage NextLayout),
      ((modm .|. shiftMask, xK_Tab), setLayout $ XMonad.layoutHook conf),
      -- , ((modm,               xK_n     ), refresh) -- this map is being used in sxhkdrc
      ((modm, xK_space), windows W.swapMaster),
      ((modm, xK_j), windows W.focusDown),
      ((modm, xK_k), windows W.focusUp),
      ((modm, xK_m), windows W.focusMaster),
      ((modm .|. shiftMask, xK_equal), incWindowSpacing 1),
      ((modm .|. shiftMask, xK_minus), decWindowSpacing 1),
      ((modm .|. shiftMask, xK_BackSpace), sendMessage ToggleGaps),
      ((modm .|. shiftMask, xK_j), windows W.swapDown),
      ((modm .|. shiftMask, xK_k), windows W.swapUp),
      ((modm, xK_Down), windows W.focusDown),
      ((modm, xK_Up), windows W.focusUp),
      ((modm .|. shiftMask, xK_Down), windows W.swapDown),
      ((modm .|. shiftMask, xK_Up), windows W.swapUp),
      ((modm, xK_h), sendMessage Shrink),
      ((modm, xK_l), sendMessage Expand),
      ((modm, xK_Left), sendMessage Shrink),
      ((modm, xK_Right), sendMessage Expand),
      ((modm, xK_t), withFocused $ windows . W.sink),
      ((modm, xK_equal), sendMessage (IncMasterN 1)),
      ((modm, xK_minus), sendMessage (IncMasterN (-1))),
      ((modm, xK_f), sendMessage $ Toggle NBFULL),
      -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
      ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
    ]
      ++
      [ ((m .|. mod4Mask, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9],
          (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
      ]
      ++
      [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_period, xK_comma, xK_semicolon] [0 ..],
          (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
      ]

myMouseBindings (XConfig {XMonad.modMask = modm}) =
  M.fromList
    [ ( (modm, button1),
        \w ->
          focus w >> mouseMoveWindow w
            >> windows W.shiftMaster
      ),
      ((modm, button2), \w -> focus w >> windows W.shiftMaster),
      ( (modm, button3),
        \w ->
          focus w >> mouseResizeWindow w
            >> windows W.shiftMaster
      )
      -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

-- LAYOUTS
myLayout =
  smartBorders
    . mkToggle (NOBORDERS ?? NBFULL ?? EOT)
    $ avoidStruts
      ( dwindle
          ||| Mirror dwindle
          ||| full
          ||| tiled
          ||| Mirror tiled
      )
  where
    tiled =
      gaps [(U, gapSize), (R, gapSize), (L, gapSize), (D, gapSize)] $
        spacing spaceingSize $
          Tall nmaster delta ratio

    full =
      gaps [(U, gapSize), (R, gapSize), (L, gapSize), (D, gapSize)] $
        spacing
          spaceingSize
          Full

    dwindle =
      gaps [(U, gapSize), (R, gapSize), (L, gapSize), (D, gapSize)] $
        spacing spaceingSize $
          Dwindle R CW 1 1.1

    nmaster = 1

    gapSize = 5

    spaceingSize = 5

    ratio = 1 / 2

    delta = 3 / 100

myManageHook =
  composeAll
    [ className =? "MPlayer" --> doCenterFloat,
      className =? "trayer" --> doF W.swapDown,
      className =? "eww-calendar" --> hasBorder False,
      -- className =? "eww-calendar" --> doIgnore,
      fmap ("Qalculate" `isPrefixOf`) title --> doCenterFloat,
      fmap ("DevTools" `isPrefixOf`) title --> doCenterFloat,
      fmap ("devtools" `isPrefixOf`) title --> doCenterFloat,
      fmap ("Screen" `isPrefixOf`) title --> doCenterFloat,
      fmap ("Customize" `isPrefixOf`) title --> doCenterFloat,
      fmap ("Nitrogen" `isPrefixOf`) title --> doCenterFloat,
      isDialog --> doCenterFloat,
      -- (isFullscreen                 --> doFullFloat)
      resource =? "desktop_window" --> doIgnore,
      resource =? "kdesktop" --> doIgnore
    ]

------------------------------------------------------------------------
-- myEventHook = mconcat [ fullscreenEventHook
--           ]

-- myLogHook = dynamicLogWithPP $ xmobarPP $ def { ppOutput = hPutStrLn xmproc }
-- myStartupHook = do
--   spawnOnce "eww open bar"

main = do
  nScreens <- countScreens
  xmproc <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc0"
  xmonad $
    ewmh $
      docks $
        def
          { -- simple stuff
            focusFollowsMouse = myFocusFollowsMouse,
            clickJustFocuses = myClickJustFocuses,
            borderWidth = myBorderWidth,
            modMask = myModMask,
            -- workspaces
            workspaces = withScreens nScreens ["1", "2", "3", "4"],
            normalBorderColor = myNormalBorderColor,
            focusedBorderColor = myFocusedBorderColor,
            -- keybinds
            keys = myKeys,
            mouseBindings = myMouseBindings,
            -- hooks, layouts
            layoutHook = myLayout,
            -- startupHook = myStartupHook,
            manageHook = myManageHook
            -- handleEventHook    = myEventHook,
--             logHook =
--               dynamicLogWithPP $
--                 xmobarPP
--                   { ppOutput = hPutStrLn xmproc,
-- ppCurrent = xmobarColor "#b8bb26" "",
-- ppVisible = xmobarColor "#83a598" "",
-- ppHidden = xmobarColor "#d3869b" "",
-- ppTitle = xmobarColor "#928374" "" . shorten 60,
-- ppSep = "<fc=#666666> <fn=1>|</fn> </fc>",
-- ppUrgent = xmobarColor "#fb4934" "" . wrap "!" "!",
--                     ppOrder = \(ws : _ : t : ex) -> [formatWs ws, t]
--                   }
          }
