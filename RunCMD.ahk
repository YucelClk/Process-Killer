#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%


KillApp(param1)
{
	Run %ComSpec% /c "taskkill /f /IM %param1%",, hide
}


fileName = %A_MyDocuments%\processes.txt
file := FileOpen(fileName, "r")
	
if !isObject(file)
		Msgbox, Can't open vars file.
else
{
	Loop, read, %A_ScriptDir%\processes.txt
	{
		 Loop, parse, A_LoopReadLine, %A_Tab%
		{
			process = %A_LoopField%
			KillApp(process)
		}
	}
	
	}
file.Close



