@echo off

if "%APPVEYOR%" == "" (
   .\src\.nuget\nuget install
)

if "%BUILD_NUMBER%" == "" (
   set BUILD_NUMBER=%APPVEYOR_BUILD_NUMBER%
)

set target=%1
if "%target%" == "" (
   set target=UnitTests
)

if "%target%" == "NuGetPack" (
	if "%BUILD_NUMBER%" == "" (
	 	echo BUILD_NUMBER environment variable is not set.
		exit;
	)
)

%WINDIR%\Microsoft.NET\Framework\v4.0.30319\msbuild Build\build.proj /target:%target% /v:M /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false