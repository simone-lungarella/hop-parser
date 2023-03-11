# hop-reclaimer
<img src="https://img.shields.io/badge/Powershell-2CA5E0?style=for-the-badge&logo=powershell&logoColor=white" />


This is a script that parses files having extension <b>.hop</b> to search for duplicated lines that make a <i>CNC machine</i> stop, execute an operation, and restart when selecting the tool that is already being used or a face that is already set. This behavior is caused by the <i>WZ*</i> and <i>EBENE*</i> commands when these commands are duplicated in more modern CNC machines while not causing any issues with older ones.

This simple program iterates over a root folder required as a parameter and recursively searches for files with extension <b>.hop</b>. Then, it parses each file, and for each line starting with <i>WZ</i>: if it's equal to the previously assigned tool, the line will be commented out by adding a semicolon at the start. Does the same for commands starting with <i>EBENE</i> and the previously assigned face.

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

