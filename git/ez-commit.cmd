@ECHO OFF & SETLOCAL EnableDelayedExpansion

@REM Script to 'auto commit' changes within repo with a 
@REM given commit message.  If no message is passed
@REM when calling the file, then a generic one is used.


:: Default message if no argument passed.
SET default_msg=committing latest changes


:: Capture commit message to variable.
:: Variable will ignore any quotation marks.
SET msg=%~1


:: Validate msg variable
CALL :check_msg


:: Run git commands with msg variable
git add -A && git commit -m "%msg%"

EXIT /B


:check_msg
:: Subroutine to check if commit message argument was passed.
:: if not, sets message variable to indicated default value.
if "%msg%"=="" (
    SET msg=!default_msg!
)
