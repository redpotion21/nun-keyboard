#Requires AutoHotkey v2.0
#SingleInstance Force

TrayTip "(L Ctrl + R Ctrl)でON/OFF `n Esc連続4回で強制終了", "ぬんキーボード", 1
SetTimer () => ToolTip(), -5000

toggle := false
LastPress := 0
CooldownTime := 300
global on :=1

~LCtrl & RCtrl::
~RCtrl & LCtrl::
 {    ; Ctrl + Alt + E to toggle
    global on
    if (on < 1){
        return
}
    global LastPress
    global CooldownTime
    ; Calculate time since last success
    CurrentTime := A_TickCount
    TimePassed := CurrentTime - LastPress

    if (TimePassed < CooldownTime) {
        ; It's too soon! Ignore this input.
        return
    }

    ; If we got here, it's been long enough. Update the timer.
    LastPress := CurrentTime

    global toggle
    toggle := !toggle
    
    if (toggle) {
        ToolTip "スタンプモード ON!"
    } else {
        ToolTip "スタンプモード OFF"
    }
    SetTimer RemoveToolTip, -2000
}

RemoveToolTip() {
    ToolTip
}

#HotIf toggle
q::PasteText(":_がんばるぞ:")
w::PasteText(":_やったー:")
e::PasteText(":_はくしゅ:")
r::PasteText( ":_わらう:")

a::PasteText( ":_おおぉ:")
s::PasteText( ":_たすかる:")
d::PasteText( ":_赤ちゃん:")
f::PasteText( ":_かわいい:")

z::PasteText( ":_新ぬんぬん:")
x::PasteText( ":_おみず:")
c::PasteText( ":_アの絵文字:")
v::PasteText( ":_泣いちゃう:")

t::PasteText( ":_ナンデヨー:")
y::PasteText( ":_もぐもぐ:")
u::PasteText( ":_じゃあ敵だね:")
i::PasteText( ":_らっかちゃん:")

g::PasteText( ":_ナイス:")
h::PasteText( ":_てんてんてん:")
j::PasteText( ":_ジトー:")
k::PasteText( ":_ザリガニちゃん:")

b::PasteText( ":_ヤメテヨー:")
n::PasteText( ":_ああ迷子:")
m::PasteText( ":_あん肝ペンラピンク:")
,::PasteText( ":_あん肝ペンラ青:")

o::PasteText( ":_きゅっ:")
p::PasteText( ":_ぬんぬん1:")
[::PasteText( ":_あん肝:")
]::PasteText( ":_おうた:")

l::PasteText( ":_いかないで:")
`;::PasteText( ":_おかえり:")
'::PasteText( ":_こんそめ:")

.::PasteText( ":_ぬん1:")
/::PasteText( ":_ぬん2:")

1::PasteText( ":_そらザウルス:")
2::PasteText( ":_まいっかちゃん:")
3::PasteText( ":_ぬんぬんちゃん:")
4::PasteText( ":_そっか:")
5::PasteText( ":_ミニソーダちゃん:")
6::PasteText( ":_ソーダちゃん:")
7::PasteText( ":_かさの絵文字:")
8::PasteText( ":_ゴンッ:")
9::PasteText( ":_止まらねえぞ:")
0::PasteText( ":_Imびっくり:")
-::PasteText( ":_スンスタンプ:")

F1::PasteText( ":_Hi1:")
F2::PasteText( ":_Hi2:")
F3::PasteText( ":_Hi3:")
F4::PasteText( ":_Hi4:")

F5::PasteText( ":_はい1:")
F6::PasteText( ":_はい2:")
F7::PasteText( ":_はい3:")
F8::PasteText( ":_はい4:")

#HotIf

PasteText(str) {
    oldClip := ClipboardAll()  ; Save current clipboard
    A_Clipboard := str         ; Set new text
    if ClipWait(1) {           ; Wait up to 1s for clipboard to be ready
        Send "^v"              ; Paste
        Sleep 100              ; Short delay so the app "catches" the paste
    }
    A_Clipboard := oldClip     ; Restore original clipboard
}

global EscCount := 0
global LastEscTime := 0

$Esc::
{
    global on
    global EscCount, LastEscTime
    currentTime := A_TickCount
    
    ; 1.0s Interval check
    if (currentTime - LastEscTime > 1000) {
        EscCount := 1
    } else {
        EscCount += 1
    }
    
    LastEscTime := currentTime
    
    if (EscCount >= 4) {
         on := 0
        MsgBox("ぬんキーボードを終了します。", "終了", "4096 Iconi")
        ExitApp()
    }
    
    ; Show progress to user
    ;ToolTip("Exit Progress: " . EscCount . "/4")
    ;SetTimer(() => ToolTip(), -800)
    
    ; Keep original Esc functionality
    Send("{Esc}")
     KeyWait("Esc")
}