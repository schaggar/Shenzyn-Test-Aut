set LOGFILE=Stage.log

call :LOG > %LOGFILE%
exit /B

:LOG
cd C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn
call robot --timestampoutputs -d Results -N "Shenzyn Test Automation [Stage]" Tests\stage