$source = Read-Host "Please enter your path source folder with HOP files"
Set-Location $source

Get-ChildItem -Recurse |
Where-Object { !($_.PSIsContainer) } |
ForEach-Object {
    $lastTool = ""
    $lastFace = ""

    if ($_.Extension -ne ".hop") {
        Write-Output "Skipping file: $($_.FullName)"
        return
    }

    Write-Output "Processing file: $($_.FullName)"
    $isChanged = $false
        
    $content = Get-Content $_.FullName | Where-Object { $_ -notmatch "^;" } |
    ForEach-Object {
        $line = $_

        if ($line.StartsWith("WZ")) {
            # Cerca comando selezione utensile
            if ($lastTool -ne "" -and $line -eq $lastTool) {
                # Se l'utensile è già equipaggiato, commenta riga
                $isChanged = $false
                $line = "; $line"
            }
            else {
                # Altrimenti, aggiorna lo strumento corrente
                $isChanged = $true
                $lastTool = $line
            }
        }
        elseif ($line.StartsWith("EBENE")) {
            # Se l'utensile non è cambiato, cerca comando selezione faccia
            if (!$isChanged -and $lastFace -ne "" -and $line -eq $lastFace) {
                # Se la faccia è già selezionata, commenta riga
                $line = "; $line"
            }
            else {
                # Altrimenti, aggiorna la faccia corrente
                $lastFace = $line
            }
        }

        $line
    }

    $content | Set-Content $_.FullName
} 


Write-Output "Done. Press any key to exit..."
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
