@echo off
cd F:\NSCC-Courses\Semester-2\Work Placement\Automated Tests\BNFIN
call robot -d results/grantsLead1 tests/Grants-Lead1.robot
start results/grantsLead1/log.html