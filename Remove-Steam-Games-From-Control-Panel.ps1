$counter = 0;

foreach ($steamGame in (reg query HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | findstr /C:"Steam App")) {
    reg delete $steamGame /f;
    $counter += 1;
}

foreach ($steamGame in (reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | findstr /C:"Steam App")) {
    reg delete $steamGame /f;
    $counter += 1;
}

if ($counter -NE 0) {
    Write-Host ("Removed " + $counter + " games from Control Panel and Apps list.");
} else {
    Write-Host ("No games found.");
}