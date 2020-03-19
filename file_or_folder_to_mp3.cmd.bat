:: Name:     file_or_folder_to_mp3.cmd
:: Purpose:  Turns any media file into mp3 (at 260 VBR) by using ffmpeg
:: Author:   iorga.ton@gmail.com
:: Revision: 17th March 2020 - initial version
::           (Quarantine Code)

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set input_path=%1

IF EXIST %input_path%\* (

	CD /D %input_path% 

	FOR %%i in (*.*) do (

		set folder_file=%%i
		set folder_file_root=%%~ni

		ffmpeg -i "!folder_file!" -vn -q:a 0 "!folder_file_root!.mp3"
	)
) else (

	set input_file=%~nx1
	set input_file_root=%~n1 
	set input_file_folder=%~dp1

	CD /D %input_file_folder%

	ffmpeg -i "!input_file!" -vn -q:a 0 "!input_file_root!.mp3"
	
)

ECHO ON

EXIT /B 0