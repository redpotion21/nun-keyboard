#Requires AutoHotkey v2.0
#SingleInstance Force

toggle := false

^!e:: {    ; Ctrl + Alt + E to toggle
    global toggle
    toggle := !toggle
    
    if (toggle) {
        ToolTip "Emoji Mode ON!"
    } else {
        ToolTip "Emoji Mode OFF"
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
; keep adding more like ↓
;c::Send ":_your_emoji_here:"
#HotIf