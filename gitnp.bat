CHCP 65001
setlocal EnableDelayedExpansion
set NL=^


@rem echo %1 !NL!song%|%artist
set message=%1
set np="🎧 Figaro | Madvillain | Madvillainy (The Demo)"

git add .

git commit -m %message% -m %np%