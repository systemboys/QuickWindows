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
:: v0.0.1 2023-11-14 às 00h15, Marcos Aurélio:
::   - Versão inicial, Menu de sessão a acesso rápido a algumas funcionalidades do Windows.
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
echo QuickWindows / Access Settings

:: Opções do Menu
set "menu_Session_2_1[0]=Voltar..."
set "menu_Session_2_1[1]=Painel de Controle (Control)"
set "menu_Session_2_1[2]=Editor de Registro (RegEdit)"
set "menu_Session_2_1[3]=Configurações do Sistema (MSConfig)"
set "menu_Session_2_1[4]=Serviços (Services.msc)"
set "menu_Session_2_1[5]=Gerenciador de Dispositivos (DevMgmt.msc)"
set "menu_Session_2_1[6]=Gerenciamento de Discos (DiskMgmt.msc)"
set "menu_Session_2_1[7]=Editar Configurações do Plano"
set "menu_Session_2_1[8]=Explorador de arquivos do Windows"
set "menu_Session_2_1[9]=Configurações - Tela (tipo, ajustes de resolução de tela)"
set "menu_Session_2_1[10]=Sobre o Windows (WinVer)"
set "menu_Session_2_1[11]=Configurações avançadas do sistema (Propriedades do Sistema)"

set "default=0"

:menu_Session_2_1
powershell -noprofile "iex (gc \"%~f0\" | out-string)"
if %ERRORLEVEL% equ "0" (
    cls
    call Windows_Session.cmd
)

if %ERRORLEVEL% equ "1" (
    cls
    echo Você selecionou a Opção Painel de Controle - Control.

    control

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "2" (
    cls
    echo Você selecionou a Opção Editor de Registro - RegEdit.

    regedit

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "3" (
    cls
    echo Você selecionou a Opção Configurações do Sistema - MSConfig.

    msconfig

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "4" (
    cls
    echo Você selecionou a Opção Serviços - Services.msc.

    services.msc

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "5" (
    cls
    echo Você selecionou a Opção Gerenciador de Dispositivos - DevMgmt.msc.

    devmgmt.msc

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "6" (
    cls
    echo Você selecionou a Opção Gerenciamento de Discos - DiskMgmt.msc.

    diskmgmt.msc

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "7" (
    cls
    echo Você selecionou a Opção Editar Configurações do Plan.

    powercfg.cpl

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "8" (
    cls
    echo Você selecionou a Opção Explorador de arquivos do Window.

    explorer

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "9" (
    cls
    echo Você selecionou a Opção Configurações - Tela - tipo, ajustes de resolução de tela.

    desk.cpl

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "10" (
    cls
    echo Você selecionou a Opção Sobre o Windows - WinVer.

    winver

    goto menu_Session_2_1
)

if %ERRORLEVEL% equ "11" (
    cls
    echo Você selecionou a Opção Configurações avançadas do sistema - Propriedades do Sistema.

    sysdm.cpl

    goto menu_Session_2_1
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_2_1title = "=== QuickWindows / Windows / Access Settings ==="
$menu_Session_2_1prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_2_1prompt.length + 6
$menu_Session_2_1 = gci env: | ?{ $_.Name -match "^menu_Session_2_1\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_2_1.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_2_1.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_2_1.length)) -contains $x)) {
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

function menu_Session_2_1 {
    $line = $ypos
    center $menu_Session_2_1title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_2_1[$i]; $i++) {
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
    center $menu_Session_2_1prompt
    1
}

while (menu_Session_2_1) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_2_1.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}

