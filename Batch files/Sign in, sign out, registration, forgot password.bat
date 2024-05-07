@echo off
cd F:\NSCC-Courses\Semester-2\Work Placement\Automated Tests\BNFIN
call robot -d results/logreg -i "Navigation" tests/logreg.robot
start results/logreg/log.html