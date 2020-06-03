@ECHO off && SETLOCAL EnableDelayedExpansion

@REM Purpose: To automate opening of specific tabs in a given browser from an x86 machine.


:: Add or remove URLs to these lists. Keep a single space between each element.

:: NOTE: Don't add a space before or after the equals sign or it won't execute.

:: NOTE NOTE: Ampersands and special characters, so we added a caret to the YouTube link
:: in order to stem unusual behavior and error messages. The link works fine
:: without the escape, but that might not always be the case.
SET ChromeURLs=https://www.python.org/
SET FirefoxURLs=https://pypi.org/search/?q=rref

:: Deermine which browsers to open when you run the file.
:: Since we're just capturing the first letter, you can use y or n, but
:: yes or no keeps things clear.
SET ChromeYN=yes
SET FirefoxYN=yes


:: Get first letter of our selections. The syntax is roughtly `:~<start>,<number of characters>`
:: I don't believe this can be dynamically evaluated, so we can just set it to a variable
:: and check it in a sec.
SET chr_res=%ChromeYN:~0,1%
SET ff_res=%FirefoxYN:~0,1%


:: Evaluate results and asynchronously start each program with a brief 1 second pause
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
