@echo off
cd F:\NSCC-Courses\Semester-2\Work Placement\Automated Tests\BNFIN
call robot -d results/submittedLead tests/Submitted-Lead.robot
start results/submittedLead/log.html