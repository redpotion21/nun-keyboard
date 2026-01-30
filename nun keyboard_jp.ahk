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
q::Send ":_がんばるぞ:"
w::Send ":_やったー:"
e::Send ":_はくしゅ:"
r::Send ":_わらう:"

a::Send ":_おおぉ:"
s::Send ":_たすかる:"
d::Send ":_赤ちゃん:"
f::Send ":_かわいい:"

z::Send ":_新ぬんぬん:"
x::Send ":_おみず:"
c::Send ":_アの絵文字:"
v::Send ":_泣いちゃう:"

t::Send ":_ナンデヨー:"
y::Send ":_もぐもぐ:"
u::Send ":_じゃあ敵だね:"
i::Send ":_らっかちゃん:"

g::Send ":_ナイス:"
h::Send ":_てんてんてん:"
j::Send ":_ジトー:"
k::Send ":_ザリガニちゃん:"

b::Send ":_ヤメテヨー:"
n::Send ":_ああ迷子:"
m::Send ":_あん肝ペンラピンク:"
,::Send ":_あん肝ペンラ青:"

o::Send ":_きゅっ:"
p::Send ":_ぬんぬん1:"
[::Send ":_あん肝:"
]::Send ":_おうた:"

l::Send ":_いかないで:"
`;::Send ":_おかえり:"
'::Send ":_こんそめ:"

.::Send ":_ぬん1:"
/::Send ":_ぬん2:"

1::Send ":_そらザウルス:"
2::Send ":_まいっかちゃん:"
3::Send ":_ぬんぬんちゃん:"
4::Send ":_そっか:"
5::Send ":_ミニソーダちゃん:"
6::Send ":_ソーダちゃん:"
7::Send ":_かさの絵文字:"
8::Send ":_ゴンッ:"
9::Send ":_止まらねえぞ:"
0::Send ":_Imびっくり:"
-::Send ":_スンスタンプ:"

F1::Send ":_Hi1:"
F2::Send ":_Hi2:"
F3::Send ":_Hi3:"
F4::Send ":_Hi4:"

F5::Send ":_はい1:"
F6::Send ":_はい2:"
F7::Send ":_はい3:"
F8::Send ":_はい4:"

#HotIf

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