Get-ChildItem -Directory -Path "$Env:USERPROFILE\AppData\Roaming\Mozilla\Firefox\Profiles" -Filter '*.default-release' | % {
   # copy contents to *.default-release folder
   if($_.Name -match "\.default-release$"){
      Copy-Item -Path .\firefox\* -Destination $_.FullName -recurse
  }
}