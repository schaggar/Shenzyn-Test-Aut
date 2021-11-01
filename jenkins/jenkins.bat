@echo off
set LOGFILE=jenkins.log
call :LOG > %LOGFILE%
exit /B

:LOG
cd C:\gitclonenew\Shenzyn-Test-Aut\jenkins
java -jar jenkins.war
timeout /t 50 /nobreak
