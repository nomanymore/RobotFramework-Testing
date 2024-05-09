@echo off
cd F:\NSCC-Courses\Semester-2\Work Placement\Automated Tests\BNFIN
call robot -d results/logreg tests/logreg.robot
start results/logreg/log.html