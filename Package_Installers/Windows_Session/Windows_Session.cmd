<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: Windows_Session.cmd - Para sessão relacionada a instalação a Windows
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de executar a sessão relacionada a instalação a Windows.
:: ---------------------------------------------------------------
:: Histórico:
:: v0.0.1 2023-10-31 às 02h38, Marcos Aurélio:
::   - Versão inicial, menu_Session_2 de instalações de programas para Windows.
:: v0.0.2 2023-10-31 às 22h40, Marcos Aurélio:
::   - Código PowerShell para atualizar softwares do Windows usando o comando winget.
:: v0.0.3 2023-10-31 às 23h55, Marcos Aurélio:
::   - Script para instalar o Winget via Powershell.
:: v0.0.4 2023-11-11 às 19h10, Marcos Aurélio:
::   - Versão inicial, atualizar o PowerShell.
::
:: Licença: GPL.

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
echo QuickWindows / Sessão Windows

:: Opções do Menu
set "menu_Session_2[0]=Voltar..."
set "menu_Session_2[1]=Desligar o Windows"
set "menu_Session_2[2]=Reiniciar o Windows"
set "menu_Session_2[3]=Atualizar Windows e Softwares"
set "menu_Session_2[4]=Atualizar o PowerShell"

set "default=0"

:menu_Session_2
powershell -noprofile "iex (gc \"%~f0\" | out-string)"
if %ERRORLEVEL% equ 0 (
    cls
    cd ..
    cd ..
    call QuickWindows.cmd
)

if %ERRORLEVEL% equ 1 (
    cls
    :: Desligar o Windows
    shutdown -s -t 00
)

if %ERRORLEVEL% equ 2 (
    cls
    :: Reiniciar o Windows
    shutdown -r -t 00
)

if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a Opção para atualizar softwares no Windows.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0UpdatingSoftwareInWindows.ps1""' -Verb RunAs}"

    goto menu_Session_2
)

if %ERRORLEVEL% equ 4 (
    cls
    echo Você selecionou a Opção para atualizar o Microsoft PowerShell.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Update_PowerShell.ps1""' -Verb RunAs}"

    goto menu_Session_2
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_2title = "=== QuickWindows / Windows ==="
$menu_Session_2prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_2prompt.length + 6
$menu_Session_2 = gci env: | ?{ $_.Name -match "^menu_Session_2\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_2.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_2.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_2.length)) -contains $x)) {
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

function menu_Session_2 {
    $line = $ypos
    center $menu_Session_2title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_2[$i]; $i++) {
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
    center $menu_Session_2prompt
    1
}

while (menu_Session_2) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_2.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}
