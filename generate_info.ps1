$songsPath = "C:\Users\emira\Desktop\NightmareVision-dev"

$metaFiles = Get-ChildItem -Path $songsPath -Filter "meta.json" -Recurse | Where-Object { $_.FullName -match "songs\\[^\\]+\\meta.json$" }

foreach ($file in $metaFiles) {
    $dir = $file.DirectoryName
    $infoFile = Join-Path -Path $dir -ChildPath "info.txt"
    
    if (-not (Test-Path $infoFile)) {
        # Parse meta.json
        $json = Get-Content $file.FullName | ConvertFrom-Json
        $songName = "Unknown Song"
        if ($json.displayName) { $songName = $json.displayName }
        elseif ($json.songName) { $songName = $json.songName }
        
        $composer = "Unknown Composer"
        if ($json.composers -and $json.composers.Length -gt 0) { $composer = $json.composers[0] }
        
        # We don't have BPM in meta.json, so put a placeholder or just "Unknown BPM"
        # PlayState.hx will read BPM from the SONG object directly if needed, or we can just say "??? BPM"
        # Wait, user said "info.txt ekle onlardan alacak o bilgileri" -> It will get those infos from info.txt.
        # So we MUST write a placeholder BPM that the user can edit later.
        $bpm = "100"
        
        $content = "$songName`r`n$composer`r`n$bpm"
        Set-Content -Path $infoFile -Value $content
        Write-Host "Created $infoFile"
    }
}
Write-Host "Done!"
