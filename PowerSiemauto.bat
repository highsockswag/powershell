@echo off
rem this will run with admin priv to powersiem
powershell.exe -ExecutionPolicy Bypass -Command "Start-Process 'powershell.exe'-ArgumentList '-ExecutionPolicy Bypass -File ""D:\Sysmon\PowerSiem.ps1""' -Verb RunAs"
