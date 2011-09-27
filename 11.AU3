#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.2.3.8
 Author:         Shafiq Issani


#ce ----------------------------------------------------------------------------

; includes

#include <GUIConstants.au3>

; Script Start
; GUI form init
$form = GUICreate("ASTRA Demonstration Server", 406, 343, 381, 257)

; GUI Button define
$btn_start_default = GUICtrlCreateButton("1. Start Server", 24, 128, 163, 25, 0)
$btn_stop_default = GUICtrlCreateButton("1. Stop Server2Go default", 24, 248, 163, 25, 0)

; GUI Logo
$logo = GUICtrlCreatePic(@ScriptDir & "\server\splash.jpg", 72, 8, 260, 100, BitOR($SS_NOTIFY,$WS_GROUP))

; GUI disable Stop buttons without running server2go
GUICtrlSetState($btn_stop_default, $GUI_DISABLE)

; Show GUI
GUISetState(@SW_SHOW)

; Define vars to get states

$s2g_default_running = False
$s2g_nophp_running = False
$s2g_tomcat5_running = False
$s2g_jboss_running = False

; Wait for Input
While 1
   $nMsg = GUIGetMsg()
   Switch $nMsg
      Case $GUI_EVENT_CLOSE
         Exit
      
      Case $btn_start_default
         ;GUICtrlSetState($btn_start_nophp, $GUI_DISABLE)
         ;GUICtrlSetState($btn_stop_nophp, $GUI_DISABLE)   
         GUICtrlSetState($btn_stop_default, $GUI_ENABLE)         
         ;GUICtrlSetState($btn_start_tomcat5, $GUI_ENABLE)
         ;GUICtrlSetState($btn_start_jboss, $GUI_ENABLE)
         GUICtrlSetState($btn_start_default, $GUI_DISABLE)
         $s2g_default_running = True
         run(@ScriptDir & "\Server2Go.exe",@ScriptDir)
               
      Case $btn_stop_default      
         GUICtrlSetState($btn_start_default, $GUI_ENABLE)
         GUICtrlSetState($btn_stop_default, $GUI_DISABLE)
         $s2g_default_running = False
         

      
   EndSwitch
WEnd 
