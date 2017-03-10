@echo off
title Rede
:inicio

echo.
echo.
cls



echo		*****************************************************************
echo		                      ANALISE DE DOMINIOS
echo		*****************************************************************
echo.
echo QUAL O DOMINIO?
echo.
echo.
SET /p dom=
cls
echo ============================================== PING =======================================================

echo SITE TESTADO  %dom%
echo.

for /f "tokens=3 delims=[] " %%a in ('ping -4 -n 1 %dom% ^|find /i "pinging"') do set IP=%%a  




for /f "tokens=6 delims=TTL^ " %%y in ('ping -4 -n 1 %dom% ^|find /i "reply"') do set  "TTL=%%y"






for /f "tokens=2 delims=. " %%f in ('ping -a -4 -n 1 %IP% ^|find /i "pinging"') do echo IP=   %IP%   TTL%TTL%  SERVIDOR=   %%f    SE NAO RETORNAR "HM", PROCURAR NO CEGONHA

 SET _linOuWin=%TTL:~1,5%

 echo.
if %_linOuWin% GEQ 90 ( 
echo Sistema operacional: Windows 
) else (
 echo Sistema Operacional: Linux 
 )


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


REM AUTOR WILLIAN VIEIRA