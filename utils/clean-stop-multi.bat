:: Same as "clean-stop.bat," but for multiple script calls.

:: Set commands
SET cmd1=
SET cmd1=


IF [%JUSTTERMINATE%] == [OKAY] (
    SET JUSTTERMINATE=
    START /min %ComSpec% /c "%cmd1%" && START /min %ComSpec% /c %cmd1%
) ELSE (
    SET JUSTTERMINATE=OKAY
    CALL %0 %* <NUL
)
