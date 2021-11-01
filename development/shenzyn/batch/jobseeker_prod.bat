 @echo off
set LOGFILE=jobseeker_automation.log
call :LOG > %LOGFILE%
exit /B

:LOG
cd C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn
<<<<<<< HEAD:development/shenzyn/batch/jobseeker.bat
call robot --timestampoutputs -d results tests\js_automation.robot
call robot --timestampoutputs -d results tests\js_email_test.robot
call robot --timestampoutputs -d results tests\js_profile_update.robot
=======
call robot --timestampoutputs -d results tests\jobseeker_automation_prod.robot
>>>>>>> 7cb0f80e0f1b7be53cf4e2ce63b849557f42645a:development/shenzyn/batch/jobseeker_prod.bat
timeout /t 50 /nobreak
call py  C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\emailTrigger\js_log_zipper.py