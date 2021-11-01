@echo off
set LOGFILE=HiringPartner_log.log
call :LOG > %LOGFILE%
exit /B

:LOG
cd C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn
call robot --timestampoutputs -d Results Tests\HiringPartner_Stage.robot
timeout /t 50 /nobreak
call py  C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\emailTrigger\hp_log_zipper.py