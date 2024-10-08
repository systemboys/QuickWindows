<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: QuickAccessToSettings2.cmd - Para executar algumas funcionalidades do Windows.
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de dar acesso rápido a algumas funcionalidades do Windows.
:: ---------------------------------------------------------------
:: Histórico:
:: v1.0.0 2023-11-30 às 11h30, Marcos Aurélio:
::   - Versão inicial, Menu de sessão a acesso rápido a algumas funcionalidades do Windows.
:: v1.1.1 2023-11-30 às 12h03, Marcos Aurélio:
::   - Opção para "Abrir Gerenciador de Arquivos com Endereço Específico".
:: v1.2.1 2023-11-30 às 22h22, Marcos Aurélio:
::   - Opção para "Configurações do Windows".
:: v1.3.1 2023-12-01 às 22h56, Marcos Aurélio:
::   - Opção para "Gerenciador de Tarefas do Windows".
:: v1.4.1 2024-01-14 às 11h45, Marcos Aurélio:
::   - Opção para executar "Opções de pastas".
:: v1.5.1 2024-02-04 às 22h57, Marcos Aurélio:
::   - Opção para Obter Informações do Sistema com PowerShell.
:: v1.6.1 2024-06-27 às 23h29, Marcos Aurélio:
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
echo QuickWindows / Access Settings [Page 2]

:: Opções do Menu
set "menu_Session_2_1_p2[0]=Voltar…"
set "menu_Session_2_1_p2[1]=Configurações avançadas do sistema (Propriedades do Sistema)"
set "menu_Session_2_1_p2[2]=Editar Configurações do Plano"
set "menu_Session_2_1_p2[3]=Sobre o Windows (WinVer)"
set "menu_Session_2_1_p2[4]=Gerenciar arquivos e pastas"
set "menu_Session_2_1_p2[5]=Configurações do Windows"
set "menu_Session_2_1_p2[6]=Gerenciador de Tarefas do Windows"
set "menu_Session_2_1_p2[7]=Opções de pastas"
set "menu_Session_2_1_p2[8]=Obtendo Informações do Sistema com PowerShell"

set "default=%1%"

:menu_Session_2_1_p2
powershell -noprofile "iex (gc \"%~f0\" | out-string)"

:: Voltar…
if %ERRORLEVEL% equ 0 (
    cls
    call QuickAccessToSettings.cmd 9
)

:: Configurações avançadas do sistema (Propriedades do Sistema)
if %ERRORLEVEL% equ 1 (
    cls
    echo Você selecionou a Opção Configurações avançadas do sistema - Propriedades do Sistema.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 9' -Verb RunAs"

    goto menu_Session_2_1_p2
)

:: Editar Configurações do Plano
if %ERRORLEVEL% equ 2 (
    cls
    echo Você selecionou a Opção Editar Configurações do Plan.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 10' -Verb RunAs"

    goto menu_Session_2_1_p2
)

:: Sobre o Windows (WinVer)
if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a Opção Sobre o Windows - WinVer.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 11' -Verb RunAs"

    goto menu_Session_2_1_p2
)

:: Gerenciar arquivos e pastas
if %ERRORLEVEL% equ 4 (
    cls
    echo Você selecionou a Opção para Gerenciar arquivos e pastas.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\ManageFilesAndFolders.ps1""' -Verb RunAs}"

    goto menu_Session_2_1_p2
)

:: Configurações do Windows
if %ERRORLEVEL% equ 5 (
    cls
    echo Você selecionou a Opção Configurações do Windows.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 12' -Verb RunAs"

    goto menu_Session_2_1_p2
)

:: Gerenciador de Tarefas do Windows
if %ERRORLEVEL% equ 6 (
    cls
    echo Você selecionou a Opção Gerenciador de Tarefas do Windows.

    start PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 13' -Verb RunAs"

    goto menu_Session_2_1_p2
)

:: Opções de pastas
if %ERRORLEVEL% equ 7 (
    cls
    echo Você selecionou a Opções de pastas.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File """"%~dp0\StartingWindowsFeature.ps1"""" -numero 14' -Verb RunAs"

    goto menu_Session_2_1_p2
)

:: Obtendo Informações do Sistema com PowerShell
if %ERRORLEVEL% equ 8 (
    cls
    echo Você selecionou a Opção para Obter Informações do Sistema com PowerShell.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\ObtainingSystemInformation.ps1""' -Verb RunAs}"

    goto menu_Session_2_1_p2
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_2_1_p2title = "=== QuickWindows / Windows / Access Settings [Page 2] ==="
$menu_Session_2_1_p2prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_2_1_p2prompt.length + 6
$menu_Session_2_1_p2 = gci env: | ?{ $_.Name -match "^menu_Session_2_1_p2\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_2_1_p2.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_2_1_p2.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_2_1_p2.length)) -contains $x)) {
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

function menu_Session_2_1_p2 {
    $line = $ypos
    center $menu_Session_2_1_p2title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_2_1_p2[$i]; $i++) {
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
    center $menu_Session_2_1_p2prompt
    1
}

while (menu_Session_2_1_p2) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_2_1_p2.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}

