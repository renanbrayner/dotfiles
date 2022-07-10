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

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
myBorderWidth = 2

-- Super as mod
myModMask = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
-- myWorkspaces     = withScreens 3 ["1","2","3","4"]

-- Border colors for unfocused and focused windows, respectively.
--

-- ATENTION! DON'T COMMENT/UNCOMMENT THIS TWO LINES MANUALLY!!! USE rice-ctrl --set-theme-themename INSTEAD
-- THEME_START
myNormalBorderColor = "#073642"
myFocusedBorderColor = "#2aa198"
-- THEME_END

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList $
    [ -- close focused window
      ((modm .|. shiftMask, xK_q), kill),
      -- Rotate through the available layout algorithms
      ((modm, xK_Tab), sendMessage NextLayout),
      --  Reset the layouts on the current workspace to default
      ((modm .|. shiftMask, xK_Tab), setLayout $ XMonad.layoutHook conf),
      -- Resize viewed windows to the correct size
      -- , ((modm,               xK_n     ), refresh) -- this map is being used in sxhkdrc
      -- Swap the focused window and the master window
      ((modm, xK_space), windows W.swapMaster),
      -- Move focus to the next window
      ((modm, xK_j), windows W.focusDown),
      -- Move focus to the previous window
      ((modm, xK_k), windows W.focusUp),
      -- Move focus to the master window
      ((modm, xK_m), windows W.focusMaster),
      -- Inc Spacing
      ((modm .|. shiftMask, xK_equal), incWindowSpacing 1),
      -- Dec Spacing
      ((modm .|. shiftMask, xK_minus), decWindowSpacing 1),
      -- Toggle Gap
      ((modm .|. shiftMask, xK_BackSpace), sendMessage ToggleGaps),
      -- Swap the focused window with the next window
      ((modm .|. shiftMask, xK_j), windows W.swapDown),
      -- Swap the focused window with the previous window
      ((modm .|. shiftMask, xK_k), windows W.swapUp),
      -- Move focus to the next window
      ((modm, xK_Down), windows W.focusDown),
      -- Move focus to the previous window
      ((modm, xK_Up), windows W.focusUp),
      -- Swap the focused window with the next window
      ((modm .|. shiftMask, xK_Down), windows W.swapDown),
      -- Swap the focused window with the previous window
      ((modm .|. shiftMask, xK_Up), windows W.swapUp),
      -- Shrink the master area
      ((modm, xK_h), sendMessage Shrink),
      -- Expand the master area
      ((modm, xK_l), sendMessage Expand),
      -- Shrink the master area
      ((modm, xK_Left), sendMessage Shrink),
      -- Expand the master area
      ((modm, xK_Right), sendMessage Expand),
      -- Push window back into tiling
      ((modm, xK_t), withFocused $ windows . W.sink),
      -- Increment the number of windows in the master area
      ((modm, xK_equal), sendMessage (IncMasterN 1)),
      -- Deincrement the number of windows in the master area
      ((modm, xK_minus), sendMessage (IncMasterN (-1))),
      -- Toggle full screen
      ((modm, xK_f), sendMessage $ Toggle NBFULL),
      -- Toggle the status bar gap
      -- Use this binding with avoidStruts from Hooks.ManageDocks.
      -- See also the statusBar function from Hooks.DynamicLog.
      --
      -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

      -- Restart xmonad
      ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
    ]
      ++
      --
      -- mod-[1..9], Switch to workspace N
      -- mod-shift-[1..9], Move client to workspace N
      --
      [ ((m .|. mod4Mask, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9],
          (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
      ]
      ++
      --
      -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
      -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
      --
      [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_comma, xK_semicolon, xK_period] [0 ..],
          (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
      ]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) =
  M.fromList
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ( (modm, button1),
        \w ->
          focus w >> mouseMoveWindow w
            >> windows W.shiftMaster
      ),
      -- mod-button2, Raise the window to the top of the stack
      ((modm, button2), \w -> focus w >> windows W.shiftMaster),
      -- mod-button3, Set the window to floating mode and resize by dragging
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

    gapSize = 0

    spaceingSize = 0

    ratio = 1 / 2

    delta = 3 / 100

------------------------------------------------------------------------
-- Window rules

myManageHook =
  composeAll
    [ className =? "MPlayer" --> doCenterFloat,
      className =? "trayer" --> doF W.swapDown,
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
------------------------------------------------------------------------

-- myLogHook = dynamicLogWithPP $ xmobarPP $ def { ppOutput = hPutStrLn xmproc }

------------------------------------------------------------------------

-- startup
-- myStartupHook = do
-- spawnOnce "lxsession"
-- spawnOnce "cbatticon"
-- spawnOnce "nm-applet"
-- spawnOnce "nitrogen --restore"
-- spawnOnce "picom"
-- spawnOnce "~/.local/bin/hotkeys.bash"
-- spawnOnce "trayer --edge top --align right --widthtype pixel --height 18 --width 90 --monitor 1 --tint 0x00000000 --transparent false"

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
            -- workspaces         = myWorkspaces,
            workspaces = withScreens nScreens ["1", "2", "3", "4"],
            normalBorderColor = myNormalBorderColor,
            focusedBorderColor = myFocusedBorderColor,
            -- keybinds
            keys = myKeys,
            mouseBindings = myMouseBindings,
            -- hooks, layouts
            layoutHook = myLayout,
            manageHook = myManageHook,
            -- handleEventHook    = myEventHook,
            logHook =
              dynamicLogWithPP $
                xmobarPP
                  { ppOutput = hPutStrLn xmproc,
                    -- XMOBAR_START
ppCurrent = xmobarColor "#859900" "",
ppVisible = xmobarColor "#2aa198" "",
ppHidden = xmobarColor "#d33682" "",
ppTitle = xmobarColor "#93a1a1" "" . shorten 60,
ppSep = "<fc=#666666> <fn=1>|</fn> </fc>",
ppUrgent = xmobarColor "#dc322f" "" . wrap "!" "!",
                    -- XMOBAR_END
                    ppOrder = \(ws : _ : t : ex) -> [ws] ++ ex ++ [t]
                  }
                  -- startupHook        = myStartupHook
          }
