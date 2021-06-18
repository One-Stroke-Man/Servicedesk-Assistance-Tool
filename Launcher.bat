@ECHO OFF
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'invoke-expression (invoke-webrequest -uri ""https://raw.githubusercontent.com/One-Stroke-Man/Servicedesk-Assistance-Tool/main/Servicedesk%20Assistance%20Tool.ps1"")' -Verb RunAs}"
