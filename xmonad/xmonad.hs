--
-- xmonad config file.
--

import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.Gaps
import XMonad.Layout.Grid
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.WorkspaceDir 
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Util.EZConfig
import XMonad.Util.Run

import DBus.Client.Simple
import System.Taffybar.XMonadLog

import System.Exit
import System.IO

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified Data.List       as L
import qualified Data.Maybe      as Maybe

import Colors


-- Fonts
--
bitmapMediumFont = "-*-terminus-medium-r-*-*-14-*-*-*-*-*-*-*"

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "urxvtc"

-- Width of the window border in pixels.
--
myBorderWidth = 1

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

-- Workspaces
--
myWorkspaces = map f $ zip [1..l] ws
  where
    f  = (\(x, y) -> show(x) ++ if null y
                                then ""
                                else ":" ++ y)
    ws = ["web", "emacs", "term", "mail", "im", "dev", "dev", "misc", "anime", "music"]
    l  = length ws

getWsId :: String -> String
getWsId q = Maybe.fromMaybe "" $ L.find (L.isInfixOf q) myWorkspaces -- fromJust ?

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = colorBlack
myFocusedBorderColor = colorGrey

-- Split takes a list and returns two lists:
-- elements with even indices go to the first,
-- elements with odd indices go to the second.
--
split :: [a] -> ([a], [a])
split []       = ([], [])
split [x]      = ([x], [])
split (x:y:xys) = (x:xs, y:ys)
  where 
    (xs, ys) = split xys
    
-- Unite is opposite to split - it kinda zips the two lists together,
-- alternating elements.
unite :: [a] -> [a] -> [a]
unite [] _          = []
unite (x:_) []      = [x]
unite (x:xs) (y:ys) = x:y:(unite xs ys)

-- Dmenu default options
--                 
dmenuOpts = [ "-nb", colorBackground
            , "-nf", colorForeground
            , "-sb", colorBrightYellow
            , "-sf", colorBackground
            , "-fn", bitmapMediumFont
            , "-b"
            ]
            
-- Dmenu command as a string - used to run programs
--
myDmenuCommand = unwords $ "dmenu":(unite opts colorsEscaped)
  where
    (opts, colors) = split dmenuOpts
    colorsEscaped  = foldr (\col acc -> ("\"" ++ col ++ "\""):acc) [] colors
                 
-- Screenshots dir
--
myScreenshotsDir = "~/Obrazy/screenshots/"

-- Shutdown/reboot/sleep prompt.
-- All of these are the IO type, not X.
--
shutdownCommand   = spawn "sudo poweroff"
rebootCommand     = spawn "sudo reboot"
lockScreenCommand = spawn "xscreensaver-command -lock"
sleepCommand      = spawn "xscreensaver-command -lock && sudo pm-suspend"
logoutCommand     = exitWith ExitSuccess

commands = M.fromList
           [ ("Shutdown",    shutdownCommand)
           , ("Reboot",      rebootCommand)
           , ("Sleep",       sleepCommand)
           , ("Logout",      logoutCommand)
           , ("Lock screen", lockScreenCommand)
           ]

quitPrompt :: X ()
quitPrompt = liftIO 
             $ runProcessWithInput "dmenu" params opts 
             >>= \key -> commands M.! key
               where
                 params = ["-l", show $ M.size commands, "-p", "Choose:"] ++ dmenuOpts
                 opts   = unlines $ M.keys commands
  
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--

myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList $ [
    -- launch a terminal
    ((modm,   xK_Return), spawn $ XMonad.terminal conf)
    -- launch dmenu
    , ((modm, xK_p     ), spawn $ "exe=`dmenu_path | " ++ myDmenuCommand ++ "` && eval \"exec $exe\"")

      -- close focused window
    , ((modm .|. shiftMask, xK_c), kill)

      -- Rotate through the available layout algorithms
    , ((modm,               xK_space), sendMessage NextLayout)
      --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

      -- Resize viewed windows to the correct size
    , ((modm, xK_n), refresh)

      -- Move focus to the next window
    , ((modm, xK_Tab), windows W.focusDown)
    , ((modm, xK_j  ), windows W.focusDown)

      -- Move focus to the previous window
    , ((modm, xK_k), windows W.focusUp)
      -- Move focus to the master window
    , ((modm, xK_m), windows W.focusMaster)

      -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j), windows W.swapDown)
      -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)

      -- Shrink the master area
    , ((modm, xK_h), sendMessage Shrink)
      -- Expand the master area
    , ((modm, xK_l), sendMessage Expand)
      
      -- Gaps: increment and decrement left gap
    , ((modm .|. shiftMask, xK_a), sendMessage $ DecGap 5 L)
    , ((modm .|. shiftMask, xK_d), sendMessage $ IncGap 5 L)
      -- Toggle gaps
    , ((modm .|. shiftMask, xK_g), sendMessage $ ToggleGaps)

      -- Push window back into tiling
    , ((modm,  xK_t), withFocused $ windows . W.sink)

      -- Increment the number of windows in the master area
    , ((modm, xK_comma ), sendMessage (IncMasterN 1))
      -- Deincrement the number of windows in the master area
    , ((modm, xK_period), sendMessage (IncMasterN (-1)))

      -- Quit xmonad
    , ((modm .|. shiftMask, xK_q), io $ logoutCommand)
      -- Restart xmonad
    , ((modm,               xK_q), restart "xmonad" True)

      -- Screenshot of the current window
    , ((controlMask, xK_Print), spawn $ "sleep 0.2; scrot -s -e 'mv $f " ++ myScreenshotsDir ++ "'")
      -- Screenshot of the whole screen
    , ((0,           xK_Print), spawn $ "scrot -e 'mv $f " ++ myScreenshotsDir ++ "'")

      -- Moving between workspaces, shifting windows
    , ((modm,               xK_Left ), prevWS)
    , ((modm,               xK_Right), nextWS)
    , ((modm .|. shiftMask, xK_Left ), shiftToPrev)
    , ((modm .|. shiftMask, xK_Right), shiftToNext)

      -- Xscreensaver lock
    , ((modm .|. shiftMask, xK_x), io $ lockScreenCommand)
      -- shutdown prompt
    , ((modm,          xK_Escape), quitPrompt)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


myAdditionalKeys =
  [
    -- Volume control
    ("<XF86AudioRaiseVolume>", spawn "amixer set Master 3%+ unmute")
  , ("<XF86AudioLowerVolume>", spawn "amixer set Master 3%- unmute")
    --  , ("<XF86AudioMute>", spawn "amixer set Master toggle") -- doesn't work because pulseaudio

    -- ncmpcpp control
  , ("<XF86AudioPlay>", spawn "ncmpcpp toggle")
  , ("<XF86AudioStop>", spawn "ncmpcpp stop")
  , ("<XF86AudioPrev>", spawn "ncmpcpp prev")
  , ("<XF86AudioNext>", spawn "ncmpcpp next")

    -- suspend
  , ("<XF86Sleep>", io $ sleepCommand)
  ]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = 
  M.fromList $ [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask, button1),   (\w -> focus w >> mouseMoveWindow w))
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--

-- smartBorders -- borders are not visible when only one window is present
-- avoidStruts -- layout provides space for the status bar at the top of the screen
myFullLayout        = named "F"  $ noBorders Full
myMirrorTiledLayout = named "MT" $ myTiledLayout
myFloatingLayout    = named "Fl" $ simplestFloat
myGridLayout        = named "G"  $ spacing 5 $ Grid
myHalfScreen        = named "H"  $ gaps [(L, 800)] $ myFullLayout
myTiledLayout       = named "T"  $ spacing 5 $ ResizableTall nmaster delta ratio []
  where
    nmaster = 1        -- The default number of windows in the master pane
    ratio   = 1/2      -- Default proportion of screen occupied by master pane
    delta   = 3/100    -- Percent of screen to increment by when resizing panes

-- TODO: add Tabbed layout

myLayout = smartBorders $ avoidStruts $ workspaceDir "~"
           $ onWorkspaces [getWsId "im"]    myFloatingLayout
           $ onWorkspaces [getWsId "web"]   myFullLayout
           $ onWorkspaces [getWsId "emacs"] myEmacsLayouts
--           $ onWorkspaces [getWsId "anime"] myAnimeLayouts
           $ allLayouts
             where
               allLayouts     = myFullLayout
                                ||| myTiledLayout
                                ||| myMirrorTiledLayout
                                ||| myFloatingLayout
                                ||| myGridLayout
                                
               myEmacsLayouts = myFullLayout 
                                ||| myHalfScreen
                                
               myAnimeLayouts = workspaceDir "/windows/Filmy/" allLayouts

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = manageDocks <+>
               (composeAll . concat $
                [ [className =? c --> doFloat                         | c <- floatsByClass]
                , [className =? c --> doF (W.shift $ getWsId "im")    | c <- ims]
                , [className =? c --> doF (W.shift $ getWsId "web")   | c <- webs]
                , [className =? c --> doF (W.shift $ getWsId "mail")  | c <- mail]
                , [className =? c --> doF (W.shift $ getWsId "emacs") | c <- emacs]
                , [className =? c --> doF (W.shift $ getWsId "music") | c <- music]
                , [resource  =? r --> doIgnore                        | r <- ignores]
                , [title     =? t --> doFloat                         | t <- floatsByTitle]
                ])
               <+> manageHook defaultConfig
                 where
                   -- classNames
                   floatsByClass = ["MPlayer", "Gimp", "Download"]
                   ims           = ["Pidgin", "Buddy List", "transmission-gtk"]
                   webs          = ["Firefox", "Chromium", "Chromium-browser"]
                   mail          = ["Mail", "Thunderbird"]
                   emacs         = ["Emacs"]
                   music         = ["Banshee"]

                   -- resources
                   ignores       = ["desktop_window", "kdesktop"]

                   -- titles
                   floatsByTitle = ["File Operation Progress", "Extracting files from archive"]

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
myLogHook client = dbusLogWithPP client myPP

myPP :: PP
myPP = defaultPP { ppTitle   = taffybarColor colorWhite "" . shorten 50
                 , ppHidden  = taffybarColor colorGrey ""
                 , ppCurrent = taffybarColor colorBrightYellow "" . wrap "[" "]"
                 , ppUrgent  = taffybarColor colorBrightRed colorGrey  . wrap "{" "}"
                 , ppLayout  = taffybarColor colorGrey "" 
                 , ppSep     = taffybarColor colorGrey "" " | "
                 }

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- Spawn a terminal with ncmpcpp open on start.
--
--myStartupHook spawner = do
--  spawnOn spawner (getWsId "music") $ myTerminal ++ " -e ncmpcpp"
--  return ()

myStartupHook = return ()

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify.
--
main = do 
  client <- connectSession
  spawn "/home/mateusz/.cabal/bin/taffybar"
  xmonad $ withUrgencyHook NoUrgencyHook
    $ defaultConfig
    -- simple stuff
    { terminal           = myTerminal
    , focusFollowsMouse  = myFocusFollowsMouse
    , borderWidth        = myBorderWidth
    , modMask            = myModMask
    , workspaces         = myWorkspaces
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor

    -- key bindings
    , keys               = myKeys
    , mouseBindings      = myMouseBindings

    -- hooks, layouts
    , layoutHook         = myLayout
    , manageHook         = myManageHook
    , logHook            = myLogHook client
    , startupHook        = myStartupHook
    } `additionalKeysP` myAdditionalKeys
