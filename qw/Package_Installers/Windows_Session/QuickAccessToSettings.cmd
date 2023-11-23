@echo off
setlocal enabledelayedexpansion

cls
chcp 65001 > nul

:: Definição das opções do menu
set "menu_Session_2_1[0]=Voltar..."
set "menu_Session_2_1[1]=Painel de Controle (Control)"
set "menu_Session_2_1[2]=Editor de Registro (RegEdit)"
set "menu_Session_2_1[3]=Configurações do Sistema (MSConfig)"
set "menu_Session_2_1[4]=Serviços (Services.msc)"
set "menu_Session_2_1[5]=Gerenciador de Dispositivos (DevMgmt.msc)"
set "menu_Session_2_1[6]=Gerenciamento de Discos (DiskMgmt.msc)"
set "menu_Session_2_1[7]=Explorador de arquivos do Windows"
set "menu_Session_2_1[8]=Configurações - Tela (tipo, ajustes de resolução de tela)"
set "menu_Session_2_1[9]=Configurações avançadas do sistema (Propriedades do Sistema)"
set "menu_Session_2_1[10]=Nova Opção"
set "menu_Session_2_1[11]=Outra Opção"
set "menu_Session_2_1[12]=Mais uma Opção"

set "default=0"

:display_menu
cls
echo © %date:~6,4% - GLOBAL TEC Informática ® - A !date:~6,4! no mercado de Informática.
echo www.gti1.com.br - gti.inf@hotmail.com - systemboys@hotmail.com
echo QuickWindows / Access Settings

set "menu_Session_2_1title=== QuickWindows / Windows / Access Settings ==="
echo %menu_Session_2_1title%
echo Use as teclas direcionais. Pressione Enter para selecionar.

set /a maxlen=0
for /l %%a in (0,1,12) do (
    set "option=!menu_Session_2_1[%%a]!"
    if defined option (
        set /a len=9+%%a
        if !len! gtr !maxlen! set maxlen=!len!
        echo %%a: !option!
    )
)

set /a selection=%default%

:read_key
choice /c 0123456789ABCDEFGHIJ /n >nul
set "key=!errorlevel!"
if %key% geq 48 (
    set /a selection=%key%-48
    goto execute_option
) else if %key% geq 13 goto execute_option
goto read_key

:execute_option
cls
echo Você selecionou a Opção: !menu_Session_2_1[%selection%]!
rem Aqui você executa a ação da opção selecionada
pause
goto display_menu
