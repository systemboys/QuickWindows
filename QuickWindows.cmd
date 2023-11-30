<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: QuickWindows.cmd - Executa o menu com várias linhas de comandos
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
:: v0.1.0 2023-11-01 às 07h40, Marcos Aurélio:
::   - Criada a opção para obter IP público na Sessão de Redes.
:: v0.1.1 2023-11-01 às 07h40, Marcos Aurélio:
::   - Criada a opção para obter IP local na Sessão de Redes.
:: v0.1.2 2023-11-01 às 16h05, Marcos Aurélio:
::   - Criada a opção para obter a rota de IP até a Google.com.
:: v0.1.3 2023-11-01 às 16h54, Marcos Aurélio:
::   - Correção da verificação da existência do AnyDesk no Windows na opção Internet
::     da sessão Internet.
:: v0.1.4 2023-11-01 às 22h50, Marcos Aurélio:
::   - Execução Interativa de Comandos no PowerShell
:: v0.1.5 2023-11-01 às 23h45, Marcos Aurélio:
::   - Script PowerShell que ao informar um domínio de um site, ele
::     retornará com a rota da conexão na sessão QuickWindows / Redes.
:: v0.1.6 2023-11-01 às 22h55, Marcos Aurélio:
::   - Correção na linha de comando que apaga o arquivo de instalação
::     do AnyDesk baixado.
:: v0.1.7 2023-11-11 às 19h10, Marcos Aurélio:
::   - Versão inicial, atualizar o "PowerShell" na sessão "Windows".
:: v0.1.8 2023-11-11 às 23h36, Marcos Aurélio:
::   - Opção para instalar o "Microsoft Edge" na sessão "Internet".
:: v0.1.9 2023-11-11 às 23h50, Marcos Aurélio:
::   - Opção para Instalação o "Google Chrome" na sessão "Internet".
:: v0.2.0 2023-11-12 às 11h00, Marcos Aurélio:
::   - Correção, foi reescrito o script para baixar e executar o instalador
::     do "Microsoft Edge" na sessão "Internet".
:: v0.2.1 2023-11-12 às 15h20, Marcos Aurélio:
::   - Opção para instalar o "Google Earth Pro" na sessão "Internet".
:: v0.2.2 2023-11-13 às 18h10, Marcos Aurélio:
::   - Renomeadas as extensões dos "arquivos.bat" para "arquivos.cmd".
:: v0.2.3 2023-11-13 às 21h10, Marcos Aurélio:
::   - Opção para Instalar o "Skype" na sessão "Internet".
:: v0.2.4 2023-11-13 às 22h15, Marcos Aurélio:
::   - Opção para instalar o navetador "Opera" na sessão "Internet".
:: v0.2.5 2023-11-13 às 22h50, Marcos Aurélio:
::   - Opção para instalar o navetador "Mozilla Firefox" na sessão "Internet".
:: v0.2.6 2023-11-13 às 23h40, Marcos Aurélio:
::   - Opção para instalar o visualizador "Real VNC Viewer" na sessão "Internet".
:: v0.2.7 2023-11-14 às 00h15, Marcos Aurélio:
::   - Opção para Menu de sessão a acesso rápido a algumas funcionalidades do Windows na sessão "Windows".
:: v0.2.8 2023-11-29 às 10h40, Marcos Aurélio:
::   - Sessão para "Utilitários para Windows" onde foram adicionados instaladores diversos.
:: v0.2.9 2023-11-29 às 17h08, Marcos Aurélio:
::   - A opção "Instalar AnyDesk" na sessão "Internet" foi mudada para "Softwares de Acesso Remoto".
:: v0.3.0 2023-11-29 às 22h50, Marcos Aurélio:
::   - Script de Interação: Janela de Comando Interativa para Execução de Comandos.
:: v0.3.1 2023-11-30 às 00h46, Marcos Aurélio:
::   - Opção para "Instalação de WinZip" na sessão "Utilitários para Windows".
:: v0.3.2 2023-11-30 às 01h14, Marcos Aurélio:
::   - Concluindo a sessão "Software de congelamento do sistema".
:: v0.3.3 2023-11-30 às 11h30, Marcos Aurélio:
::   - Foi adicionado uma nova página para sessão "Windows / Acesso rápido à Configurações... / Page 1 e Page 2".
:: v0.3.4 2023-11-30 às 12h03, Marcos Aurélio:
::   - Versão inicial, Abrir Gerenciador de Arquivos com Endereço Específico na sessão "Windows / Acesso rápido à Configurações página 2".
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
echo QuickWindows.cmd - Executa o menu com várias linhas de comandos para instalação de softwares para Windows
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
set "menu[1]=Menu QuickWindows..."
set "menu[2]=Windows..."
set "menu[3]=Internet..."
set "menu[4]=Redes..."
set "menu[5]=Execução de Comandos no PowerShell"
set "menu[6]=Utilitários para Windows..."
set "menu[7]=Office software..."

set "default=%1%"

:menu
powershell -noprofile "iex (gc \"%~f0\" | out-string)"
if %ERRORLEVEL% equ 0 (
    echo Você escolheu Sair.
    pause
    goto :EOF
)

if %ERRORLEVEL% equ 1 (
    cd Package_Installers\Menu_QuickWindows
    call Menu_QuickWindows.cmd 0
    cd ..
)

if %ERRORLEVEL% equ 2 (
    cd Package_Installers\Windows_Session
    call Windows_Session.cmd 0
    cd ..
)

if %ERRORLEVEL% equ 3 (
    cd Package_Installers\Internet_Session
    call Internet_Session.cmd 0
    cd ..
)

if %ERRORLEVEL% equ 4 (
    cd Package_Installers\Networking_Session
    call Networking_Session.cmd 0
    cd ..
)

if %ERRORLEVEL% equ 5 (
    cls
    echo Você selecionou a Opção para Execução de Comandos no PowerShell.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Package_Installers\RunPowerShellCommands.ps1""' -Verb RunAs}"

    goto menu
)

if %ERRORLEVEL% equ 6 (
    cd Package_Installers\UtilitiesForWindows
    call UtilitiesForWindows.cmd 0
    cd ..
)

if %ERRORLEVEL% equ 7 (
    cd Package_Installers\OfficeSoftware
    call OfficeSoftware.cmd 0
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
