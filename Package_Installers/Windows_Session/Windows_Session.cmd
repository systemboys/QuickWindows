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
:: v1.0.0 2023-10-31 às 02h38, Marcos Aurélio:
::   - Versão inicial, menu_Session_2 de instalações de programas para Windows.
:: v1.1.0 2023-10-31 às 22h40, Marcos Aurélio:
::   - Código PowerShell para atualizar softwares do Windows usando o comando winget.
:: v1.2.0 2023-10-31 às 23h55, Marcos Aurélio:
::   - Script para instalar o Winget via Powershell.
:: v1.3.0 2023-11-11 às 19h10, Marcos Aurélio:
::   - Opção para atualizar o PowerShell.
:: v1.4.0 2023-11-14 às 00h15, Marcos Aurélio:
::   - Opção para Menu de sessão a acesso rápido a algumas funcionalidades do Windows.
:: v1.5.0 2023-11-30 às 22h22, Marcos Aurélio:
::   - Opção para "Configurações do Windows".
:: v1.6.0 2023-12-05 às 14h45, Marcos Aurélio:
::   - Opção para agendar desligamento automático.
:: v1.7.0 2024-04-16 às 00h43, Marcos Aurélio:
::   - Opção para execução de Gerenciador de Energia (Desligar ou Reiniciar).
:: v1.8.0 2024-08-12 às 20h09, Marcos Aurélio:
::   - Opção para Acesso ao Setup da BIOS via PowerShell.
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
echo QuickWindows / Sessão Windows

:: Opções do Menu
set "menu_Session_2[0]=Voltar…"
set "menu_Session_2[1]=Desligar o Windows"
set "menu_Session_2[2]=Reiniciar o Windows"
set "menu_Session_2[3]=Agendar desligamento do Windows"
set "menu_Session_2[4]=Atualizar Windows e Softwares"
set "menu_Session_2[5]=Atualizar o PowerShell"
set "menu_Session_2[6]=Acesso rápido à Configurações…"
set "menu_Session_2[7]=Criar atalhos para 'Desligar e Reiniciar'"
set "menu_Session_2[8]=Reiniciar e iniciar a BIOS da placa-mãe"

set "default=%1"

:menu_Session_2
powershell -noprofile "iex (gc \"%~f0\" | out-string)"

:: Voltar…
if %ERRORLEVEL% equ 0 (
    cls
    cd ..
    cd ..
    call QuickWindows.cmd 2
)

:: Desligar o Windows
if %ERRORLEVEL% equ 1 (
    cls
    echo Você selecionou a Opção para Desligar o Windows.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0PowerStateManager.ps1" "1"

    goto menu_Session_2
)

:: Reiniciar o Windows
if %ERRORLEVEL% equ 2 (
    cls
    echo Você selecionou a Opção para Reiniciar o Windows.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0PowerStateManager.ps1" "2"

    goto menu_Session_2
)

:: Agendar desligamento do Windows
if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a Opção para Agendar desligamento do Windows.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0ScheduleWindowsShutdown.ps1""' -Verb RunAs}"

    goto menu_Session_2
)

:: Atualizar Windows e Softwares
if %ERRORLEVEL% equ 4 (
    cls
    echo Você selecionou a Opção para atualizar softwares no Windows.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0UpdatingSoftwareInWindows.ps1""' -Verb RunAs}"

    goto menu_Session_2
)

:: Atualizar o PowerShell
if %ERRORLEVEL% equ 5 (
    cls
    echo Você selecionou a Opção para atualizar o Microsoft PowerShell.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Update_PowerShell.ps1""' -Verb RunAs}"

    goto menu_Session_2
)

:: Acesso rápido à Configurações…
if %ERRORLEVEL% equ 6 (
    cd Package_Installers\Windows_Session
    call QuickAccessToSettings.cmd 0
    cd ..
)

:: Criar atalhos para 'Desligar e Reiniciar'
if %ERRORLEVEL% equ 7 (
    cls
    echo Você selecionou a Opção para Criar atalhos para 'Desligar e Reiniciar'.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0ShortcutMaker.ps1""' -Verb RunAs}"

    goto menu_Session_2
)

:: Reiniciar e iniciar a BIOS da placa-mãe
if %ERRORLEVEL% equ 8 (
    cls
    echo Você selecionou a Opção para Reiniciar e iniciar a BIOS da placa-mãe.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0PowerStateManager.ps1" "3"

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
