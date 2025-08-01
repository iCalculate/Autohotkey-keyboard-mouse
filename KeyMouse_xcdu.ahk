#InstallKeybdHook

; KeyMouse_xcdu.ahk
; 简化版键盘鼠标控制脚本
; 基于 keyboard_mouse.ahk 实现

; 全局变量
global INSERT_MODE := false
global NORMAL_MODE := false
global LEFT_HELD := false
global RIGHT_HELD := false

; 鼠标移动参数
global FORCE := 1.9
global RESISTANCE := 1.05

global VELOCITY_X := 0
global VELOCITY_Y := 0

; 加速度计算函数
Accelerate(velocity, pos, neg) {
  If (pos == 0 && neg == 0) {
    Return 0
  }
  ; 平滑减速
  Else If (pos + neg == 0) {
    Return velocity * 0.666
  }
  ; 物理运动
  Else {
    Return velocity * RESISTANCE + FORCE * (pos + neg)
  }
}

; 鼠标移动函数
MoveCursor() {
  LEFT := 0
  DOWN := 0
  UP := 0
  RIGHT := 0
  
  ; WASD 控制
  UP := UP - GetKeyState("w", "P")
  LEFT := LEFT - GetKeyState("a", "P")
  DOWN := DOWN + GetKeyState("s", "P")
  RIGHT := RIGHT + GetKeyState("d", "P")
  
  ; 如果不在正常模式，停止移动
  If (NORMAL_MODE == false) {
    VELOCITY_X := 0
    VELOCITY_Y := 0
    SetTimer, MoveCursor, Off
    Return
  }
  
  ; 计算速度
  VELOCITY_X := Accelerate(VELOCITY_X, LEFT, RIGHT)
  VELOCITY_Y := Accelerate(VELOCITY_Y, UP, DOWN)

  ; 启用DPI感知
  RestoreDPI := DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")

  ; 移动鼠标
  MouseMove, %VELOCITY_X%, %VELOCITY_Y%, 0, R
}

; 模式切换函数
EnterInsertMode() {
    ToolTip, INSERT MODE
    SetTimer, RemoveToolTip, -1000
    INSERT_MODE := true
    NORMAL_MODE := false
    SetTimer, MoveCursor, Off
}

EnterNormalMode() {
    ToolTip, NORMAL MODE
    SetTimer, RemoveToolTip, -1000
    INSERT_MODE := false
    NORMAL_MODE := true
    SetTimer, MoveCursor, 16
}

; 移除提示
RemoveToolTip:
ToolTip
return

; 鼠标操作函数
MouseBack() {
  Click, X1
}

MouseForward() {
  Click, X2
}

ScrollUp() {
  Click, WheelUp
}

ScrollDown() {
  Click, WheelDown
}

; 模式切换热键
<#<!n:: EnterNormalMode()
<#<!i:: EnterInsertMode()

; 默认进入插入模式
EnterInsertMode()

; 正常模式下的热键绑定
#If (NORMAL_MODE)

; 拦截 WASD 防止字符输入
w::return
a::return
s::return
d::return

; 鼠标点击
j::Click
k::Click, Right
l::Click, Middle

; 滚轮滚动
q::ScrollUp()
e::ScrollDown()

; 鼠标按键保持/释放
u::
if (LEFT_HELD) {
    Send, {LButton Up}
    LEFT_HELD := false
} else {
    Send, {LButton Down}
    LEFT_HELD := true
}
return

i::
if (RIGHT_HELD) {
    Send, {RButton Up}
    RIGHT_HELD := false
} else {
    Send, {RButton Down}
    RIGHT_HELD := true
}
return

; 屏幕居中
m::
CoordMode, Mouse, Screen
MouseMove, A_ScreenWidth//2, A_ScreenHeight//2
return

; 浏览器前进后退
z::MouseBack()
c::MouseForward()

#If

; 插入模式下的热键绑定
#If (INSERT_MODE)

; 在插入模式下，所有按键都正常传递
; 可以添加一些特殊的热键如果需要

#If
