@echo off
set "ORDNER=C:\Users\bless\Documents"

:: Startet das erste CMD-Fenster minimiert
start /MIN cmd /K "cd /d %ORDNER%"

:: Startet das zweite CMD-Fenster und öffnet Neovim
start cmd /K "cd /d %ORDNER% && nvim ."

:: Schließt das aktuelle CMD-Fenster
exit