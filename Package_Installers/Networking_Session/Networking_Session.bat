<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: Networking_Session.bat - Para sessão de opções relacionadas a Redes
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de funções relacionadas à redes.
:: ---------------------------------------------------------------
:: Histórico:
:: v0.0.1 2023-11-01 às 15h45, Marcos Aurélio:
::   - Versão inicial, Sessão de Redes para opções relacionadas à redes.
:: v0.0.2 2023-11-01 às 08h30, Marcos Aurélio:
::   - Criada a opção para obter IP público na Sessão de Redes.
:: v0.0.3 2023-11-01 às 15h45, Marcos Aurélio:
::   - Criada a opção para obter IP local na Sessão de Redes.
:: v0.0.4 2023-11-01 às 16h05, Marcos Aurélio:
::   - Criada a opção para o Script PowerShell que ao informar um domínio
::     de um site, ele retornará com a rota da conexão.
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
echo QuickWindows / Redes

:: Opções do Menu
set "menu_Session_4[0]=Voltar..."
set "menu_Session_4[1]=Obter IP público"
set "menu_Session_4[2]=Obter IP local"
set "menu_Session_4[3]=Obter IP's de uma determinada rota"

set "default=0"

:menu_Session_4
powershell -noprofile "iex (gc \"%~f0\" | out-string)"
if %ERRORLEVEL% equ 0 (
    cls
    cd ..
    cd ..
    call QuickWindows.bat
)

if %ERRORLEVEL% equ 1 (
    cls
    echo Você selecionou a Opção Obter IP público.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0GetPublicIPAddress.ps1""' -Verb RunAs}"

    goto menu_Session_4
)

if %ERRORLEVEL% equ 2 (
    cls
    echo Você selecionou a Opção Obter IP local.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0GetLocalIPAddress.ps1""' -Verb RunAs}"

    goto menu_Session_4
)

if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a Opção Obter IP local.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0GetConnectionIPRoute.ps1""' -Verb RunAs}"

    goto menu_Session_4
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_4title = "=== QuickWindows / Redes ==="
$menu_Session_4prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_4prompt.length + 6
$menu_Session_4 = gci env: | ?{ $_.Name -match "^menu_Session_4\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_4.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_4.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_4.length)) -contains $x)) {
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

function menu_Session_4 {
    $line = $ypos
    center $menu_Session_4title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_4[$i]; $i++) {
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
    center $menu_Session_4prompt
    1
}

while (menu_Session_4) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_4.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}
