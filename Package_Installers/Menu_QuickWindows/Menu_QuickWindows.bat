<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: Menu_QuickWindows.bat - Para instalação de softwares para Windows
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finadade de agilizar na instalação de softwares
:: para Windows durante a formatação e/ou manutenção de computadores.
:: ---------------------------------------------------------------
:: Histórico:
:: v0.0.1 2023-10-28 às 16h40, Marcos Aurélio:
::   - Versão inicial, menu_QuickWindows de instalações de programas para Windows.
::
:: Licença: GPL.

cls

chcp 65001 > nul

:: Defina o nome do menu aqui
set "menuName=QuickWindows"

:: Obter o ano atual
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set "ano=%datetime:~0,4%"

:: Subtrair o ano atual por 2008
set /a resultado=ano-2008

:: Mensagem de entrada do Menu com o resultado
echo © %ano% - GLOBAL TEC Informática ® - A %resultado% no mercado de Informática.
echo www.gti1.com.br - gti.inf@hotmail.com - systemboys@hotmail.com

:: Opções do Menu
set "menu_%menuName%[0]=Voltar..."
set "menu_%menuName%[1]=Atualizar QuickWindows"
set "menu_%menuName%[2]=Deletar QuickWindows"
set "menu_%menuName%[3]=Recarregar QuickWindows"

set "default=0"

:menu_QuickWindows
powershell -noprofile "iex (gc \"%~f0\" | out-string)"
if %ERRORLEVEL% equ 0 (
    cls
    cd ..
    cd ..
    call QuickWindows.bat
)

if %ERRORLEVEL% equ 1 (
    cls
    echo Você selecionou a Opção 1.

    @REM  Your commands here...

    goto menu_QuickWindows
)

if %ERRORLEVEL% equ 2 (
    cls
    echo Você selecionou a Opção 2.

    @REM  Your commands here...

    goto menu_QuickWindows
)

if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a Opção 3.

    @REM  Your commands here...

    goto menu_QuickWindows
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_QuickWindowstitle = "=== Menu QuickWindows ==="
$menu_QuickWindowsprompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_QuickWindowsprompt.length + 6
$menu_QuickWindows = gci env: | ?{ $_.Name -match "^menu_QuickWindows\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_QuickWindows.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_QuickWindows.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_QuickWindows.length)) -contains $x)) {
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

function menu_QuickWindows {
    $line = $ypos
    center $menu_QuickWindowstitle
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_QuickWindows[$i]; $i++) {
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
    center $menu_QuickWindowsprompt
    1
}

while (menu_QuickWindows) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_QuickWindows.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}
