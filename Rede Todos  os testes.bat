@echo off
title TESTE DE REDE COM MENU
:inicio
echo.
echo.

cls
echo.
echo.
echo		*****************************************************************
echo		  Digite o numero correspondente ao comando que voce quer fazer
echo		*****************************************************************
echo.

echo.
color f
echo 1-Ping 
echo.
echo 2-Ping -a
echo.
echo 3-Tracert  
echo.
echo 4-MX  
echo.
echo 5-NS  
echo.
echo 6-TXT
echo.
echo 7- PTR teste de DNS reverso
echo.
echo 8- TODOS - EXCETO TRACERT
echo.
echo.
echo Digite "s" para sair do programa

echo.
set /p opcao=
if %opcao%==1 goto ping
if %opcao%==2 goto ping-a
if %opcao%==3 goto Tracert
if %opcao%==4 goto mx
if %opcao%==5 goto ns
if %opcao%==6 goto txt
if %opcao%==7 goto ptr
if %opcao%==8 goto ALL
if %opcao%==s exit
echo.
if %opcao% EQU 0 goto :inicio

echo digite uma opção valida
pause
echo.
goto :inicio
pause


:ping
echo Qual o numero do IP ou dominio?
set /p n1=
cls
ping %n1%


echo.
pause
goto :inicio

:ping-a
echo qual o numero do IP?
set /p n1=
cls
ping -a %n1%
pause
echo.
goto :inicio


:tracert
echo Qual o numero do IP ou dominio?
set /p n1=
cls
tracert %n1%
pause
echo.
goto :inicio


:mx
echo Qual o numero do IP ou dominio?
set /p n1=
cls
nslookup -q=mx %n1% 
pause
echo.
goto :inicio

:ns
echo Qual o numero do IP ou dominio?
set /p n1=
cls
nslookup -q=ns %n1%
pause
echo.
goto :inicio



:txt
echo Qual o numero do IP ou dominio?
set /p n1=
cls
nslookup -q=txt %n1%
pause
echo.
goto :inicio




:ptr
echo Qual o numero do IP?
set /p n1=
cls
nslookup -q=ptr %n1% 
pause
echo.
goto :inicio


:ALL
echo QUAL O DOMINIO?
SET /p dom=
cls
echo.
echo.
echo.
echo ============================================== PING =======================================================

echo.
echo.

for /f "tokens=3 delims=[] " %%a in ('ping -4 -n 1 %dom% ^|find /i "pinging"') do set IP=%%a  

for /f "tokens=2 delims=. " %%f in ('ping -a -4 -n 1 %IP% ^|find /i "pinging"') do echo IP=   %IP%  SERVIDOR=   %%f  SE NAO RETORNAR "HM", PROCURAR NO CEGONHA


echo.
echo.
echo.
echo================================================ MX ========================================================
echo.
echo.
nslookup -q=mx %dom% 
echo.
echo.
echo================================================ NS ========================================================
echo.
echo.
nslookup -q=ns %dom%
echo.
echo.
echo================================================ TXT =======================================================
echo.
echo.
nslookup -q=txt %dom%
echo.
echo.
echo============================================= DNS REVERSO ==================================================
echo.
echo.
nslookup -q=ptr %IP%
echo.
echo.
PAUSE
goto :inicio