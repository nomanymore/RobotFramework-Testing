@echo off
cd F:\NSCC-Courses\Semester-2\Work Placement\Automated Tests\BNFIN
call robot -d results/publiclinks tests/publicpagelinks.robot
start results/publiclinks/log.html