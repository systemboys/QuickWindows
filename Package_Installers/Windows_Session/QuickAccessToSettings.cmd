<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: QuickAccessToSettings.cmd - Para executar algumas funcionalidades do Windows.
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de dar acesso rápido a algumas funcionalidades do Windows.
:: ---------------------------------------------------------------
:: Histórico:
:: v1.0.0 2023-11-14 às 00h15, Marcos Aurélio:
::   - Versão inicial, Menu de sessão a acesso rápido a algumas funcionalidades do Windows.
:: v1.1.0 2023-11-30 às 12h03, Marcos Aurélio:
::   - Abrir Gerenciador de Arquivos com Endereço Específico.
:: v1.2.0 2024-06-27 às 23h29, Marcos Aurélio:
::   - Os recursos do Windows agora serão executados por um arquivo .ps1.
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
echo QuickWindows / Access Settings [Page 1]

:: Opções do Menu
set "menu_Session_2_1_p1[0]=Voltar…"
set "menu_Session_2_1_p1[1]=Painel de Controle (Control)"
set "menu_Session_2_1_p1[2]=Editor de Registro (RegEdit)"
set "menu_Session_2_1_p1[3]=Configurações do Sistema (MSConfig)"
set "menu_Session_2_1_p1[4]=Serviços (Services.msc)"
set "menu_Session_2_1_p1[5]=Gerenciador de Dispositivos (DevMgmt.msc)"
set "menu_Session_2_1_p1[6]=Gerenciamento de Discos (DiskMgmt.msc)"
set "menu_Session_2_1_p1[7]=Explorador de arquivos do Windows"
set "menu_Session_2_1_p1[8]=Configurações - Tela (tipo, ajustes de resolução de tela)"
set "menu_Session_2_1_p1[9]=Mais…"

set "default=%1%"

:menu_Session_2_1_p1
powershell -noprofile "iex (gc \"%~f0\" | out-string)"

:: Voltar…
if %ERRORLEVEL% equ 0 (
    cls
    call Windows_Session.cmd 5
)

:: Painel de Controle (Control)
if %ERRORLEVEL% equ 1 (
    cls
    echo Você selecionou a Opção Painel de Controle - Control.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 1' -Verb RunAs"

    goto menu_Session_2_1_p1
)

:: Editor de Registro (RegEdit)
if %ERRORLEVEL% equ 2 (
    cls
    echo Você selecionou a Opção Editor de Registro - RegEdit.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 2' -Verb RunAs"

    goto menu_Session_2_1_p1
)

:: Configurações do Sistema (MSConfig)
if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a Opção Configurações do Sistema - MSConfig.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 3' -Verb RunAs"

    goto menu_Session_2_1_p1
)

:: Serviços (Services.msc)
if %ERRORLEVEL% equ 4 (
    cls
    echo Você selecionou a Opção Serviços - Services.msc.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 4' -Verb RunAs"

    goto menu_Session_2_1_p1
)

:: Gerenciador de Dispositivos (DevMgmt.msc)
if %ERRORLEVEL% equ 5 (
    cls
    echo Você selecionou a Opção Gerenciador de Dispositivos - DevMgmt.msc.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 5' -Verb RunAs"

    goto menu_Session_2_1_p1
)

:: Gerenciamento de Discos (DiskMgmt.msc)
if %ERRORLEVEL% equ 6 (
    cls
    echo Você selecionou a Opção Gerenciamento de Discos - DiskMgmt.msc.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 6' -Verb RunAs"

    goto menu_Session_2_1_p1
)

:: Explorador de arquivos do Windows
if %ERRORLEVEL% equ 7 (
    cls
    echo Você selecionou a Opção Explorador de arquivos do Windows.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 7' -Verb RunAs"

    goto menu_Session_2_1_p1
)

:: Configurações - Tela (tipo, ajustes de resolução de tela)
if %ERRORLEVEL% equ 8 (
    cls
    echo Você selecionou a Opção Configurações - Tela - tipo, ajustes de resolução de tela.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 8' -Verb RunAs"

    goto menu_Session_2_1_p1
)

:: Mais…
if %ERRORLEVEL% equ 9 (
    cls
    call QuickAccessToSettings2.cmd 0
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_2_1_p1title = "=== QuickWindows / Windows / Access Settings [Page 1] ==="
$menu_Session_2_1_p1prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_2_1_p1prompt.length + 6
$menu_Session_2_1_p1 = gci env: | ?{ $_.Name -match "^menu_Session_2_1_p1\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_2_1_p1.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_2_1_p1.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_2_1_p1.length)) -contains $x)) {
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

function menu_Session_2_1_p1 {
    $line = $ypos
    center $menu_Session_2_1_p1title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_2_1_p1[$i]; $i++) {
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
    center $menu_Session_2_1_p1prompt
    1
}

while (menu_Session_2_1_p1) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_2_1_p1.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}

