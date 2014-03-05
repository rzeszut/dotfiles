import System.Taffybar

import System.Taffybar.Systray
import System.Taffybar.XMonadLog
import System.Taffybar.SimpleClock
import System.Taffybar.FreedesktopNotifications
import System.Taffybar.Weather

import System.Taffybar.Widgets.PollingGraph

import System.Information.Memory
import System.Information.CPU

import Colors

colorUint8ToDouble r g b a = (r / 255, g / 255, b / 255, a / 255)

memCallback = do
  mi <- parseMeminfo
  return [memoryUsedRatio mi]

cpuCallback = do
  (userLoad, systemLoad, totalLoad) <- cpuLoad
  return [totalLoad, systemLoad]

main =  defaultTaffybar defaultTaffybarConfig { startWidgets = [log, note]
                                              , endWidgets   = [tray, weather, clock, mem, cpu]
                                              , barHeight    = 22
                                              }

  where
    log           = xmonadLogNew
    note          = notifyAreaNew defaultNotificationConfig
    tray          = systrayNew
    weather       = weatherNew weatherConfig 10
    clock         = textClockNew Nothing (taffybarColor colorOrange "" "%a, %_d %b %H:%M") 1
    mem           = pollingGraphNew memCfg 1 memCallback
    cpu           = pollingGraphNew cpuCfg 0.5 cpuCallback
    memCfg        = defaultGraphConfig { graphDataColors = [colorUint8ToDouble 0xcc 0x66 0x66 0xff]
                                       , graphLabel = Just "M"
                                       }
    cpuCfg        = defaultGraphConfig { graphDataColors = [ colorUint8ToDouble 0xb5 0xbd 0x68 0xff
                                                           , colorUint8ToDouble 0x68 0x2a 0x96 0x80
                                                           ]
                                       , graphLabel = Just "C"
                                       }
    weatherConfig = (defaultWeatherConfig "EPKK") { weatherTemplate = "$tempC$°C"
                                                  }

