@echo off
set LOGFILE=Employer.log
call :LOG > %LOGFILE%
exit /B

:LOG
cd C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn
call robot --timestampoutputs -d Results Tests\Employer.robot
timeout /t 50 /nobreak
call py  C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\emailTrigger\emp_log_zipper.py
timeout /t 50 /nobreak
call py  C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\emailTrigger\consolidated_email.py