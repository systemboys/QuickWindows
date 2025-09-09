<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: UtilitiesForWindows3.cmd - Para instalação de softwares para Windows
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de agilizar na instalação de softwares
:: para Windows durante a formatação e/ou manutenção de computadores.
:: ---------------------------------------------------------------
:: Histórico:
:: v1.0.0 2024-03-29 às 16h25, Marcos Aurélio:
::   - Versão inicial, Opção para 'Revo Uninstaller Portable' e 'Battery Report' em nova página da sessão.
:: v1.1.0 2024-04-11 às 19h36, Marcos Aurélio:
::   - Opção para baixar e instalar o 'SiberiaProg-CH341A', programa de gravação de EPROM.
:: v1.2.0 2024-07-24 às 00h10, Marcos Aurélio:
::   - Opção para baixar e executar o Open Hardware Monitor.
:: v1.3.0 2024-08-06 às 23h51, Marcos Aurélio:
::   - Opção para Download e execução de Moo0 System Monitor Portable.
:: v1.4.0 2025-09-09 às 10h15, Marcos Aurélio:
::   - Opção para Download e execução de WizTree e WizTree64.
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
echo QuickWindows / Utilitários para Windows [Page 3]

:: Opções do Menu
set "menu_Session_6_p3[0]=Voltar…"
set "menu_Session_6_p3[1]=Revo Uninstaller Portable"
set "menu_Session_6_p3[2]=Battery Report"
set "menu_Session_6_p3[3]=SiberiaProg-CH341A"
set "menu_Session_6_p3[4]=SiberiaProg-CH341A Portable"
set "menu_Session_6_p3[5]=Open Hardware Monitor"
set "menu_Session_6_p3[6]=Moo0 System Monitor"
set "menu_Session_6_p3[7]=WizTree"
set "menu_Session_6_p3[8]=WizTree64"

set "default=%1%"

:menu_Session_6_p3
powershell -noprofile "iex (gc \"%~f0\" | out-string)"

:: Voltar…
if %ERRORLEVEL% equ 0 (
    cls
    call UtilitiesForWindows.cmd 9
)

:: Revo Uninstaller Portable
if %ERRORLEVEL% equ 1 (
    cls
    echo Você selecionou a opção para Revo Uninstaller Portable.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Run_RevoUninstallerPortable.ps1""' -Verb RunAs}"

    goto menu_Session_6_p3
)

:: Battery Report
if %ERRORLEVEL% equ 2 (
    cls
    echo Você selecionou a opção para Battery Report.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Run_BatteryReport.ps1""' -Verb RunAs}"

    goto menu_Session_6_p3
)

:: SiberiaProg-CH341A
if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a opção para SiberiaProg-CH341A.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_SiberiaProg-CH341A.ps1""' -Verb RunAs}"

    goto menu_Session_6_p3
)

:: SiberiaProg-CH341A Portable
if %ERRORLEVEL% equ 4 (
    cls
    echo Você selecionou a opção para SiberiaProg-CH341A Portable.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Run_SiberiaProg-CH341A_Portable.ps1""' -Verb RunAs}"

    goto menu_Session_6_p3
)

:: Open Hardware Monitor
if %ERRORLEVEL% equ 5 (
    cls
    echo Você selecionou a opção para Open Hardware Monitor.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Run_OpenHardwareMonitor.ps1""' -Verb RunAs}"

    goto menu_Session_6_p3
)

:: Moo0 System Monitor
if %ERRORLEVEL% equ 6 (
    cls
    echo Você selecionou a opção para Moo0 System Monitor.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Run_Moo0_System_Monitor.ps1""' -Verb RunAs}"

    goto menu_Session_6_p3
)

:: WizTree
if %ERRORLEVEL% equ 7 (
    cls
    echo Você selecionou a opção para WizTree.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Run_WizTree.ps1""' -Verb RunAs}"

    goto menu_Session_6_p3
)

:: WizTree64
if %ERRORLEVEL% equ 8 (
    cls
    echo Você selecionou a opção para WizTree64.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Run_WizTree64.ps1""' -Verb RunAs}"

    goto menu_Session_6_p3
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_6_p3title = "=== QuickWindows / Utilitarios para Windows [Page 3] ==="
$menu_Session_6_p3prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_6_p3prompt.length + 6
$menu_Session_6_p3 = gci env: | ?{ $_.Name -match "^menu_Session_6_p3\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_6_p3.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_6_p3.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_6_p3.length)) -contains $x)) {
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

function menu_Session_6_p3 {
    $line = $ypos
    center $menu_Session_6_p3title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_6_p3[$i]; $i++) {
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
    center $menu_Session_6_p3prompt
    1
}

while (menu_Session_6_p3) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_6_p3.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}

