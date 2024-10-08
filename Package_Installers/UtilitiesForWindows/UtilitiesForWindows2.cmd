<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: UtilitiesForWindows2.cmd - Para instalação de softwares para Windows
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de agilizar na instalação de softwares
:: para Windows durante a formatação e/ou manutenção de computadores.
:: ---------------------------------------------------------------
:: Histórico:
:: v1.0.0 2024-01-15 às 19h18, Marcos Aurélio:
::   - Versão inicial, Opção que limpa os arquivos temporários do diretório C:\Windows\Temp e %temp% do usuário.
:: v1.1.0 2024-02-12 às 03h05, Marcos Aurélio:
::   - Opção para instalação de DriverBoosterFree.
:: v1.2.0 2024-02-12 às 10h25, Marcos Aurélio:
::   - Opção para instalação de CPU-Z.
:: v1.3.0 2024-03-21 às 18h10, Marcos Aurélio:
::   - Opção para instalação do 'Crystal Disk Info'.
:: v1.4.0 2024-03-24 às 23h43, Marcos Aurélio:
::   - Execução de 'Windows Update Activation' e o 'Revo Uninstaller Portable'.
:: v1.5.0 2024-03-29 às 16h30, Marcos Aurélio:
::   - A opção '9' foi mudada para 'Mais…', para acessar a parte 3 do menu de 'Utilitários para Windows'.
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
echo QuickWindows / Utilitários para Windows [Page 2]

:: Opções do Menu
set "menu_Session_6_p2[0]=Voltar…"
set "menu_Session_6_p2[1]=Limpar Spooler de Impressão"
set "menu_Session_6_p2[2]=Limpar Arquivos Temporários"
set "menu_Session_6_p2[3]=Driver Booster Free"
set "menu_Session_6_p2[4]=CPU-Z"
set "menu_Session_6_p2[5]=CPU-Z Portable"
set "menu_Session_6_p2[6]=Crystal Disk Info"
set "menu_Session_6_p2[7]=Crystal Disk Info Portable"
set "menu_Session_6_p2[8]=Windows Update Activation"
set "menu_Session_6_p2[9]=Mais…"

set "default=%1%"

:menu_Session_6_p2
powershell -noprofile "iex (gc \"%~f0\" | out-string)"

:: Voltar…
if %ERRORLEVEL% equ 0 (
    cls
    call UtilitiesForWindows.cmd 9
)

:: Limpar Spooler de Impressão
if %ERRORLEVEL% equ 1 (
    cls
    echo Você selecionou a opção para Limpar Spooler de Impressão.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\ClearPrintSpooler.ps1""' -Verb RunAs}"

    goto menu_Session_6_p2
)

:: Limpar Arquivos Temporários
if %ERRORLEVEL% equ 2 (
    cls
    echo Você selecionou a opção para Limpar Arquivos Temporários.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\ClearTemporaryFiles.ps1""' -Verb RunAs}"

    goto menu_Session_6_p2
)

:: Driver Booster Free
if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a opção para Driver Booster Free.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_DriverBoosterFree.ps1""' -Verb RunAs}"

    goto menu_Session_6_p2
)

:: CPU-Z
if %ERRORLEVEL% equ 4 (
    cls
    echo Você selecionou a opção para CPU-Z.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_CPU_Z.ps1""' -Verb RunAs}"

    goto menu_Session_6_p2
)

:: CPU-Z Portable
if %ERRORLEVEL% equ 5 (
    cls
    echo Você selecionou a opção para CPU-Z Portable.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Run_CPU-Z_Portable.ps1""' -Verb RunAs}"

    goto menu_Session_6_p2
)

:: Crystal Disk Info
if %ERRORLEVEL% equ 6 (
    cls
    echo Você selecionou a opção para Crystal Disk Info.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Install_CrystalDiskInfo.ps1""' -Verb RunAs}"

    goto menu_Session_6_p2
)

:: Crystal Disk Info Portable
if %ERRORLEVEL% equ 7 (
    cls
    echo Você selecionou a opção para Crystal Disk Info Portable.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\Run_CrystalDiskInfo_Portable.ps1""' -Verb RunAs}"

    goto menu_Session_6_p2
)

:: Windows Update Activation
if %ERRORLEVEL% equ 8 (
    cls
    echo Você selecionou a opção para Windows Update Activation.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0\WindowsUpdateActivation.ps1""' -Verb RunAs}"

    goto menu_Session_6_p2
)

:: Mais…
if %ERRORLEVEL% equ 9 (
    call UtilitiesForWindows3.cmd 0
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_6_p2title = "=== QuickWindows / Utilitarios para Windows [Page 2] ==="
$menu_Session_6_p2prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_6_p2prompt.length + 6
$menu_Session_6_p2 = gci env: | ?{ $_.Name -match "^menu_Session_6_p2\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_6_p2.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_6_p2.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_6_p2.length)) -contains $x)) {
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

function menu_Session_6_p2 {
    $line = $ypos
    center $menu_Session_6_p2title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_6_p2[$i]; $i++) {
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
    center $menu_Session_6_p2prompt
    1
}

while (menu_Session_6_p2) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_6_p2.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}

