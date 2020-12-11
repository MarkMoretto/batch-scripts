@ECHO off && SETLOCAL EnableExtensions EnableDelayedExpansion

:: Purpose: To automate opening of commonly-visited URLs in a modern web browser.

:: Note: 
:: 	* Browser must be installed and available locally.
:: 		*** You can test this by opening a command line and running `start chrome` or `start firefox` ***


:: Other tips:
:: 	* When in doubt, remove a whitespace.
:: 	* If unsure, put your values in double-quotation marks.


:: *** Chrome URLs ***
SET ChromeURLs="https://www.python.org/"


:: *** Firefox URLs *** 
:: We can set variable values individually, too.
:: Just switch current URLs for whichever you'd like to have the browser open.
SET FirefoxURLs="https://www.google.com/"
SET FirefoxURLs=%FirefoxURLs% "https://pypi.org/search/?q=rref"



:: Deermine which browsers to open when you run the file.
:: Values can be:
:: 	y
:: 	n
:: 	yes
:: 	no
SET ChromeYN=yes
SET FirefoxYN=yes


:: Get first character from our browser options.
CALL :FirstChar %ChromeYN% chr_res
CALL :FirstChar %FirefoxYN% ff_res


:: Check results (if debugging)
REM ECHO Chrome value %chr_res%
REM ECHO Firefox value %ff_res%
REM PAUSE
REM GOTO :eof


:: Evaluate results and start each program with a 1 second pause to allow for processing.
If "!chr_res!"=="y" (

    :: To start a current instance of Chrome, remove `--new-window`
    start chrome --new-window !ChromeURLs!

    :: Timeout echoes to the command line.  Adding `>nul` mitigates this output.
    TIMEOUT /T 1 >nul

    :: Check our Firefox result and run Firefox with our URLs, if present.
    If "!ff_res!"=="y" (
        :: To open tabs in a currently-running instance, you can try 
        :: using: start firefox --new-tab !FirefoxURLs!
        start firefox !FirefoxURLs!
        GOTO :EOF
    )
)


:: Function to get first character from string variable value.
:FirstChar
SET first=%~1
SET "%~2=%first:~0,1%"
