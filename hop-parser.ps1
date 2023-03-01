$source=Read-Host "Please enter your path source folder with HOP files"
Set-Location $source

Get-ChildItem -Recurse |
    Where-Object {!($_.PSIsContainer)} |
    ForEach-Object {
        $prevLine = ""
        $label = ""

        if ($_.Extension -ne ".hop") {
            Write-Output "Skipping file: $($_.FullName)"
            return
        }

        Write-Output "Processing file: $($_.FullName)"
        $content = Get-Content $_.FullName |
            ForEach-Object {
                $line = $_

                if ($line.StartsWith("WZ")) {
                    if ($label -ne "" -and $line -eq $label) {
                        $line = ";$line"
                    } else {
                        $label = $line
                    }
                }

                $prevLine = $line
                $line
            }

        $content | Set-Content $_.FullName
    }

Write-Output "Done. Press any key to exit..."
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
