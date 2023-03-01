# hop-parser

This is a script that parses files having extension <b>.hop</b> to search for duplicated lines that make a <i>CNC machine</i> to stop, select a tool, and restart when selecting the tool that is already being used. This behavior is caused by the <i>WZ</i> command, which is used to select a tool in a more modern CNC machines while not causing any issues with older ones.

This simple program iterate over a root folder required as parameter and recursively search for files with extension <b>.hop</b>. Then, it parses each file and for each line starting with "WZ": if its equal the the previous assigned tool, the line will be commented out by adding a semicolon at the start.

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

