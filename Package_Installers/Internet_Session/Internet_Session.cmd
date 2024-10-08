<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: Internet_Session.cmd - Para instalação de softwares para Windows.
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de agilizar na instalação de softwares
:: para Windows durante a formatação e/ou manutenção de computadores.
:: ---------------------------------------------------------------
:: Histórico:
:: v1.0.0 2023-10-28 às 16h40, Marcos Aurélio:
::   - Versão inicial, menu_Session_3 de instalações de programas para Windows.
:: v1.1.0 2023-10-31 às 01h10, Marcos Aurélio:
::   - Sessão Internet, Instalação de "AnyDesk".
:: v1.2.0 2023-11-11 às 23h36, Marcos Aurélio:
::   - Opção para instalar o "Microsoft Edge".
:: v1.3.0 2023-11-11 às 23h50, Marcos Aurélio:
::   - Opção para instalar o "Google Chrome".
:: v1.4.0 2023-11-13 às 21h10, Marcos Aurélio:
::   - Opção para instalar o "Skype".
:: v1.5.0 2023-11-13 às 22h15, Marcos Aurélio:
::   - Opção para instalar o navetador "Opera".
:: v1.6.0 2023-11-13 às 22h50, Marcos Aurélio:
::   - Opção para instalar o navetador "Mozilla Firefox".
:: v1.7.0 2023-11-13 às 23h40, Marcos Aurélio:
::   - Opção para instalar o visualizador "Real VNC Viewer".
:: v1.8.0 2023-11-13 às 17h07, Marcos Aurélio:
::   - A opção "AnyDesk" foi mudada para "Softwares de Acesso Remoto".
:: v1.9.0 2023-12-01 às 22h28, Marcos Aurélio:
::   - Adicionada a sessão "Downloads" e a opção para instalação de Internet Download Manager.
::
:: Licença: GPL.

:: Mudar a cor do plano de fundo
powershell -command "$Host.UI.RawUI.BackgroundColor = 'Black'"
cls

cls

chcp 65001 > nul

:: Obter o ano atual
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set "ano=%datetime:~0,4%"

:: Subtrair o ano atual por 2008
set /a resultado=ano-2008

:: Mensagem de entrada do Menu com o resultado
echo © %ano% - GLOBAL TEC Informática ® - A %resultado% no mercado de Informática.
echo www.gti1.com.br - gti.inf@hotmail.com - systemboys@hotmail.com

:: Opções do Menu
set "menu_Session_3[0]=Voltar…"
set "menu_Session_3[1]=Acesso Remoto…"
set "menu_Session_3[2]=Navegador Microsoft Edge"
set "menu_Session_3[3]=Navegador Google Chrome"
set "menu_Session_3[4]=Navegador Google Earth Pro"
set "menu_Session_3[5]=Comunicador Skype"
set "menu_Session_3[6]=Navegador Opera"
set "menu_Session_3[7]=Navegador Mozilla Firefox"
set "menu_Session_3[8]=Visualizador Real VNC Viewer"
set "menu_Session_3[9]=Downloads…"

set "default=%1"

:menu_Session_3
powershell -noprofile "iex (gc \"%~f0\" | out-string)"

:: Voltar…
if %ERRORLEVEL% equ 0 (
    cls
    cd ..
    cd ..
    call QuickWindows.cmd 3
)

:: Acesso Remoto…
if %ERRORLEVEL% equ 1 (
    call Session_RemoteAccessSoftware.cmd 0
)

:: Navegador Microsoft Edge
if %ERRORLEVEL% equ 2 (
    cls
    echo Você selecionou a Opção para instalar o Microsoft Edge.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_Microsoft_Edge.ps1""' -Verb RunAs}"

    goto menu_Session_3
)

:: Navegador Google Chrome
if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a Opção para instalar o Google Chrome.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_Google_Chrome.ps1""' -Verb RunAs}"

    goto menu_Session_3
)

:: Navegador Google Earth Pro
if %ERRORLEVEL% equ 4 (
    cls
    echo Você selecionou a Opção para instalar o Google Earth Pro.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_Google_Earth_Pro.ps1""' -Verb RunAs}"

    goto menu_Session_3
)

:: Comunicador Skype
if %ERRORLEVEL% equ 5 (
    cls
    echo Você selecionou a Opção para instalar o Skype.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_Skype.ps1""' -Verb RunAs}"

    goto menu_Session_3
)

:: Navegador Opera
if %ERRORLEVEL% equ 6 (
    cls
    echo Você selecionou a Opção para instalar o Opera.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_Opera.ps1""' -Verb RunAs}"

    goto menu_Session_3
)

:: Navegador Mozilla Firefox
if %ERRORLEVEL% equ 7 (
    cls
    echo Você selecionou a Opção para instalar o Mozilla Firefox.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_Mozilla_Firefox.ps1""' -Verb RunAs}"

    goto menu_Session_3
)

:: Visualizador Real VNC Viewer
if %ERRORLEVEL% equ 8 (
    cls
    echo Você selecionou a Opção para instalar o Real VNC Viewer.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_RealVNCViewer.ps1""' -Verb RunAs}"

    goto menu_Session_3
)

:: Downloads…
if %ERRORLEVEL% equ 9 (
    cls
    call Downloads.cmd 0
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_3title = "=== QuickWindows / Internet ==="
$menu_Session_3prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_3prompt.length + 6
$menu_Session_3 = gci env: | ?{ $_.Name -match "^menu_Session_3\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_3.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_3.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_3.length)) -contains $x)) {
        $x = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown').VirtualKeyCode
    }
    $x
}

# http://goo.gl/IAmdR6
function WriteTo-Pos ([string]$str, [int]$x = 0, [int]$y = 0,
    [string]$bgc = [console]::BackgroundColor, [string]$fgc = [Console]::ForegroundColor) {
    if($x -ge 0 -and $y -ge 0 -and $x -le [Console]::WindowWidth -and
        $y -le [Console]::WindowHeight) {
        $saveY = [console]::CursorTop
        $offY = [console]::WindowTop       
        [console]::setcursorposition($x,$offY+$y)
        Write-Host $str -b $bgc -f $fgc -nonewline
        [console]::setcursorposition(0,$saveY)
    }
}

function center([string]$what) {
    $what = "    $what  "
    $lpad = " " * [math]::max([math]::floor(($maxlen - $what.length) / 2), 0)
    $rpad = " " * [math]::max(($maxlen - $what.length - $lpad.length), 0)
    WriteTo-Pos "$lpad   $what   $rpad" $xpos $line blue yellow
}

function menu_Session_3 {
    $line = $ypos
    center $menu_Session_3title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_3[$i]; $i++) {
        # write-host $xpad -nonewline
        $rtpad = " " * ($maxlen - $item.length)
        if ($i -eq $selection) {
            WriteTo-Pos "  > $item <$rtpad" $xpos ($line++) yellow blue
        } else {
            WriteTo-Pos " $i`: $item  $rtpad" $xpos ($line++) blue yellow
        }
    }
    center " "
    $line++
    center $menu_Session_3prompt
    1
}

while (menu_Session_3) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_3.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}
