@ECHO OFF

REM Using Github Desktop on samba share is very slow

robocopy "Z:\Documents\Linux\fedora" "C:\Users\john\Documents\GitHub\fedora" /s /njh /njs

TIMEOUT 10
