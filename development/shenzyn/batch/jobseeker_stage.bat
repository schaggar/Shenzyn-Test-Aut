@echo off
set LOGFILE=jobseeker_automation.log
call :LOG > %LOGFILE%
exit /B

:LOG
cd C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn
call robot --timestampoutputs -d results tests\js_email_test.robot
call robot --timestampoutputs -d results tests\js_profile_update.robot
call robot --timestampoutputs -d results tests\jobseeker_automation_stage.robot
timeout /t 50 /nobreak
call py  C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\emailTrigger\js_log_zipper.py