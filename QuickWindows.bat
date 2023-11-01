<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: QuickWindows.bat - Executa o menu com várias linhas de comandos
:: para instalação de softwares para Windows
::
:: URL: https://github.com/systemboys/QuickWindows.git
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de agilizar na instalação de softwares
:: para Windows durante a formatação e/ou manutenção de computadores.
:: ---------------------------------------------------------------
:: Histórico:
:: v0.0.1 2023-10-28 às 16h40, Marcos Aurélio:
::   - Versão inicial, menu de instalações de programas para Windows.
:: v0.0.2 2023-10-31 às 01h20, Marcos Aurélio:
::   - Correções de alguns bugs e algumas alterações na documentação "README.md".
:: v0.0.3 2023-10-31 às 01h55, Marcos Aurélio:
::   - Exibição da versão do QuickWindows no terminal.
:: v0.0.4 2023-10-31 às 02h40, Marcos Aurélio:
::   - Adicionada a "Sessão Windows" e algumas opções.
:: v0.0.5 2023-10-31 às 11h10, Marcos Aurélio:
::   - Funcionalidade das opções que Atualiza, Deleta e Recarrega o QuickWindows na Sessão "Menu QuickWindows".
::   - Versão inicial, menu_Session_2 de instalações de programas para Windows.
:: v0.0.6 2023-10-31 às 22h40, Marcos Aurélio:
::   - Código PowerShell para atualizar softwares do Windows usando o comando winget.
:: v0.0.7 2023-10-31 às 23h55, Marcos Aurélio:
::   - Script para instalar o Winget via Powershell.
:: v0.0.8 2023-10-31 às 01h10, Marcos Aurélio:
::   - Sessão Internet, Instalação de AnyDesk.
:: v0.0.9 2023-11-01 às 07h40, Marcos Aurélio:
::   - Versão inicial, Sessão de Redes para opções relacionadas à redes.
::
:: Licença: GPL.

cls

chcp 65001 > nul

:: Obtém o número da última versão do histórico do script
for /f "tokens=2 delims= " %%a in ('findstr /r /c:":: v[0-9]*\.[0-9]*\.[0-9]*" "%~f0"') do (
    set "lastVersion=%%a"
)

:: Obter o ano atual
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set "ano=%datetime:~0,4%"

:: Subtrair o ano atual por 2008
set /a resultado=ano-2008

:: Mensagem de entrada do Menu com o resultado
echo © %ano% - GLOBAL TEC Informática ® - A %resultado% no mercado de Informática - QuickWindows !lastVersion!
echo www.gti1.com.br - gti.inf@hotmail.com - systemboys@hotmail.com
echo Menu.bat - Executa o menu com várias linhas de comandos para instalação de softwares para Windows
echo URL: https://github.com/systemboys/QuickWindows.git
echo Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
echo Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
echo Este programa tem a finadade de agilizar na instalação de softwares para Windows durante a formatação e/ou manutenção de computadores.
echo.
echo ┌────────────────────────┐
echo │ ░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓▓▓ │
echo │                        │
echo │ ░▒▓▓▓      ░▒▓▓▓ ░▒▓▓▓ │
echo │ ░▒▓▓▓░▒▓▓▓ ░▒▓▓▓ ░▒▓▓▓ │
echo │ ░▒▓▓▓▓▓▓▓▓ ░▒▓▓▓ ░▒▓▓▓ │
echo │ GLOBAL TEC Informática │
echo │ A Tecnologia da        │
echo │ informação é o Futuro  │
echo │ www.gti1.com.br        │
echo └────────────────────────┘

:: Opções do Menu
set "menu[0]=Sair"
set "menu[1]=Menu QuickWindows"
set "menu[2]=Windows"
set "menu[3]=Internet"
set "menu[4]=Redes"

set "default=0"

:menu
powershell -noprofile "iex (gc \"%~f0\" | out-string)"
if %ERRORLEVEL% equ 0 (
    echo Você escolheu Sair.
    pause
    goto :EOF
)

if %ERRORLEVEL% equ 1 (
    cd Package_Installers\Menu_QuickWindows
    call Menu_QuickWindows.bat
    cd ..
)

if %ERRORLEVEL% equ 2 (
    cd Package_Installers\Windows_Session
    call Windows_Session.bat
    cd ..
)

if %ERRORLEVEL% equ 3 (
    cd Package_Installers\Internet_Session
    call Internet_Session.bat
    cd ..

    @REM echo Você selecionou a Opção 3.

    @REM @REM  Your commands here...

    @REM pause
    @REM goto menu
)

if %ERRORLEVEL% equ 4 (
    cd Package_Installers\Networking_Session
    call Networking_Session.bat
    cd ..
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menutitle = "=== QuickWindows ==="
$menuprompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menuprompt.length + 6
$menu = gci env: | ?{ $_.Name -match "^menu\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu.length)) -contains $x)) {
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

function menu {
    $line = $ypos
    center $menutitle
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu[$i]; $i++) {
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
    center $menuprompt
    1
}

while (menu) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}
