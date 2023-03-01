# hop-parser
<img src="https://img.shields.io/badge/Powershell-2CA5E0?style=for-the-badge&logo=powershell&logoColor=white" />


This is a script that parses files having extension <b>.hop</b> to search for duplicated lines that make a <i>CNC machine</i> stop, select a tool, and restart when selecting the tool that is already being used. This behavior is caused by the <i>WZ</i> command, which is used to select a tool in a more modern CNC machine while not causing any issues with older ones.

This simple program iterates over a root folder required as a parameter and recursively searches for files with extension <b>.hop</b>. Then, it parses each file, and for each line starting with "WZ": if it's equal to the previously assigned tool, the line will be commented out by adding a semicolon at the start.

## Usage in Powershell

```powershell
C:\Users\user\Desktop\files\hop-parser.ps1

Please enter your path source folder with HOP files: # C:\Users\user\Desktop\files
# Skipping file: C:\Users\user\Desktop\files\hop-parser.ps1
# Processing file: C:\Users\user\Desktop\files\Finestra1\MONTANTE_1.hop
# Processing file: C:\Users\user\Desktop\files\Finestra2\MONTANTE_2.hop
# Processing file: C:\Users\user\Desktop\files\Finestra2\MONTANTE_3.hop
# Done. Press any key to exit...
```

