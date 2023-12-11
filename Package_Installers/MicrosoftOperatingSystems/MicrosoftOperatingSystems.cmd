<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: MicrosoftOperatingSystems.cmd - Para downloads de Sistemas Operacionais Microsoft.
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de agilizar os downloads de softwares
:: de ISO's de Sistemas Operacionais Microsoft.
:: ---------------------------------------------------------------
:: Histórico:
:: v0.0.1 2023-11-11 às 20h07, Marcos Aurélio:
::   - Versão inicial, opções para baixar os Sistemas Operacionais da Microsoft.
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
echo QuickWindows / Sistemas Operacionais Microsoft

:: Opções do Menu
set "menu_Session_8[0]=Voltar…"
set "menu_Session_8[1]=Windows 7, todas as versões"
set "menu_Session_8[2]=Windows 7 Lite"
set "menu_Session_8[3]=Windows 10 Pro 32bits"
set "menu_Session_8[4]=Windows 10 Pro 64bits"
set "menu_Session_8[5]=Windows 10 1909 PRO MSDN LITE Build"
set "menu_Session_8[6]=Windows 11 Pro"
set "menu_Session_8[7]=Windows Server 2022"

set "default=%1"

:menu_Session_8
powershell -noprofile "iex (gc \"%~f0\" | out-string)"

:: Voltar…
if %ERRORLEVEL% equ 0 (
    cls
    cd ..
    cd ..
    call QuickWindows.cmd 8
)

:: Opção para baixar o Windows 7, todas as versões
if %ERRORLEVEL% equ 1 (
    cls
    echo "Você selecionou a Opção para baixar o Windows 7, todas as versões"

    @REM Your commands here...

    goto menu_Session_8
)

:: Opção para baixar o Windows 7 Lite
if %ERRORLEVEL% equ 2 (
    cls
    echo "Você selecionou a Opção para baixar o Windows 7 Lite"

    @REM Your commands here...

    goto menu_Session_8
)

:: Opção para baixar o Windows 10 Pro 32bits
if %ERRORLEVEL% equ 3 (
    cls
    echo "Você selecionou a Opção para baixar o Windows 10 Pro 32bits"

    @REM Your commands here...

    goto menu_Session_8
)

:: Opção para baixar o Windows 10 Pro 64bits
if %ERRORLEVEL% equ 4 (
    cls
    echo "Você selecionou a Opção para baixar o Windows 10 Pro 64bits"

    @REM Your commands here...

    goto menu_Session_8
)

:: Opção para baixar o Windows 10 1909 PRO MSDN LITE Build
if %ERRORLEVEL% equ 5 (
    cls
    echo "Você selecionou a Opção para baixar o Windows 10 1909 PRO MSDN LITE Build"

    @REM Your commands here...

    goto menu_Session_8
)

:: Opção para baixar o Windows 11 Pro
if %ERRORLEVEL% equ 6 (
    cls
    echo "Você selecionou a Opção para baixar o Windows 11 Pro"

    @REM Your commands here...

    goto menu_Session_8
)

:: Opção para baixar o Windows Server 2022
if %ERRORLEVEL% equ 7 (
    cls
    echo "Você selecionou a Opção para baixar o Windows Server 2022"

    @REM Your commands here...

    goto menu_Session_8
)



goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_8title = "=== .. / Sistemas Operacionais Microsoft ==="
$menu_Session_8prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_8prompt.length + 6
$menu_Session_8 = gci env: | ?{ $_.Name -match "^menu_Session_8\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_8.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_8.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_8.length)) -contains $x)) {
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

function menu_Session_8 {
    $line = $ypos
    center $menu_Session_8title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_8[$i]; $i++) {
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
    center $menu_Session_8prompt
    1
}

while (menu_Session_8) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_8.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}
