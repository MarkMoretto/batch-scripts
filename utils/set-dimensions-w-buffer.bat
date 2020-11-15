@ECHO OFF

:: Set dimensions (W, H) for a command prompt window
:: Use a buffer multiplier (or add a static value) to create a BUFFER_HEIGHT variable

SET /A W=100
SET /A H=20
SET /A BUFF_MULTIPLR=10
SET /A BUFFER_HEIGHT=%W%*%BUFF_MULTIPLR%
MODE %W%, %H%
POWERSHELL -command "&{$H=get-host;$W=$H.ui.rawui;$B=$W.buffersize;$B.width=%W%;$B.height=%BUFFER_HEIGHT%;$W.buffersize=$B;}"
