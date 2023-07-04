setlocal EnableDelayedExpansion
set NL=^


@rem echo %1 !NL!song%|%artist
set message=%1
set np=":headphone: 04 - Upper Egypt | The Roots | Dilla Joints"

git add .

git commit -m %message% -m %np%