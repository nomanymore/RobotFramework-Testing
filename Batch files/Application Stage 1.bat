@echo off
cd F:\NSCC-Courses\Semester-2\Work Placement\Automated Tests\BNFIN
call robot -d results/appstage1 tests/Application-Stage-1.robot
start results/appstage1/log.html