:: Simple script to avert the "terminate batch job?" dialog when stopping a process. Works for AMD platforms, so far.
@ECHO OFF

:: Set a command argument here.
SET MyCmd=

:: Run as usual.
IF [%JUSTTERMINATE%] == [OKAY] (
    SET JUSTTERMINATE=
    %ComSpec% /c %MyCmd%
) ELSE (
    SET JUSTTERMINATE=OKAY
    CALL %0 %* <NUL
)
