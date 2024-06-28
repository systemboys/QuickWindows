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
:: v1.1.1 2023-10-28 às 16h40, Marcos Aurélio:
::   - Versão inicial, menu de instalações de programas para Windows.
:: v1.1.2 2023-10-31 às 01h20, Marcos Aurélio:
::   - Correções de alguns bugs e algumas alterações na documentação "README.md".
:: v1.2.3 2023-10-31 às 01h55, Marcos Aurélio:
::   - Exibição da versão do QuickWindows no terminal.
:: v1.3.4 2023-10-31 às 02h40, Marcos Aurélio:
::   - Adicionada a "Sessão Windows" e algumas opções.
:: v1.4.5 2023-10-31 às 11h10, Marcos Aurélio:
::   - Funcionalidade das opções que Atualiza, Deleta e Recarrega o QuickWindows na Sessão "Menu QuickWindows".
::   - Versão inicial, menu_Session_2 de instalações de programas para Windows.
:: v1.5.6 2023-10-31 às 22h40, Marcos Aurélio:
::   - Código PowerShell para atualizar softwares do Windows usando o comando winget.
:: v1.6.7 2023-10-31 às 23h55, Marcos Aurélio:
::   - Script para instalar o Winget via Powershell.
:: v1.7.8 2023-10-31 às 01h10, Marcos Aurélio:
::   - Sessão Internet, Instalação de AnyDesk.
:: v1.8.9 2023-11-01 às 07h40, Marcos Aurélio:
::   - Versão inicial, Sessão de Redes para opções relacionadas à redes.
:: v1.9.10 2023-11-01 às 07h40, Marcos Aurélio:
::   - Criada a opção para obter IP público na Sessão de Redes.
:: v1.10.11 2023-11-01 às 07h40, Marcos Aurélio:
::   - Criada a opção para obter IP local na Sessão de Redes.
:: v1.11.12 2023-11-01 às 16h05, Marcos Aurélio:
::   - Criada a opção para obter a rota de IP até a Google.com.
:: v1.11.13 2023-11-01 às 16h54, Marcos Aurélio:
::   - Correção da verificação da existência do AnyDesk no Windows na opção Internet
::     da sessão Internet.
:: v1.12.14 2023-11-01 às 22h50, Marcos Aurélio:
::   - Execução Interativa de Comandos no PowerShell
:: v1.13.15 2023-11-01 às 23h45, Marcos Aurélio:
::   - Script PowerShell que ao informar um domínio de um site, ele
::     retornará com a rota da conexão na sessão QuickWindows / Redes.
:: v1.13.16 2023-11-01 às 22h55, Marcos Aurélio:
::   - Correção na linha de comando que apaga o arquivo de instalação
::     do AnyDesk baixado.
:: v1.14.17 2023-11-11 às 19h10, Marcos Aurélio:
::   - Versão inicial, atualizar o "PowerShell" na sessão "Windows".
:: v1.15.8 2023-11-11 às 23h36, Marcos Aurélio:
::   - Opção para instalar o "Microsoft Edge" na sessão "Internet".
:: v1.16.19 2023-11-11 às 23h50, Marcos Aurélio:
::   - Opção para Instalação o "Google Chrome" na sessão "Internet".
:: v1.16.20 2023-11-12 às 11h00, Marcos Aurélio:
::   - Correção, foi reescrito o script para baixar e executar o instalador
::     do "Microsoft Edge" na sessão "Internet".
:: v1.17.21 2023-11-12 às 15h20, Marcos Aurélio:
::   - Opção para instalar o "Google Earth Pro" na sessão "Internet".
:: v1.17.22 2023-11-13 às 18h10, Marcos Aurélio:
::   - Renomeadas as extensões dos "arquivos.bat" para "arquivos.cmd".
:: v1.18.23 2023-11-13 às 21h10, Marcos Aurélio:
::   - Opção para Instalar o "Skype" na sessão "Internet".
:: v1.19.24 2023-11-13 às 22h15, Marcos Aurélio:
::   - Opção para instalar o navetador "Opera" na sessão "Internet".
:: v1.20.25 2023-11-13 às 22h50, Marcos Aurélio:
::   - Opção para instalar o navetador "Mozilla Firefox" na sessão "Internet".
:: v1.21.26 2023-11-13 às 23h40, Marcos Aurélio:
::   - Opção para instalar o visualizador "Real VNC Viewer" na sessão "Internet".
:: v1.22.27 2023-11-14 às 00h15, Marcos Aurélio:
::   - Opção para Menu de sessão a acesso rápido a algumas funcionalidades do Windows na sessão "Windows".
:: v1.23.28 2023-11-29 às 10h40, Marcos Aurélio:
::   - Sessão para "Utilitários para Windows" onde foram adicionados instaladores diversos.
:: v1.23.29 2023-11-29 às 17h08, Marcos Aurélio:
::   - A opção "Instalar AnyDesk" na sessão "Internet" foi mudada para "Softwares de Acesso Remoto".
:: v1.24.30 2023-11-29 às 22h50, Marcos Aurélio:
::   - Script de Interação: Janela de Comando Interativa para Execução de Comandos.
:: v1.25.31 2023-11-30 às 00h46, Marcos Aurélio:
::   - Opção para "Instalação de WinZip" na sessão "Utilitários para Windows".
:: v1.25.32 2023-11-30 às 01h14, Marcos Aurélio:
::   - Concluindo a sessão "Software de congelamento do sistema".
:: v1.26.33 2023-11-30 às 11h30, Marcos Aurélio:
::   - Foi adicionado uma nova página para sessão "Windows / Acesso rápido à Configurações… / Page 1 e Page 2".
:: v1.27.34 2023-11-30 às 12h03, Marcos Aurélio:
::   - Versão inicial, Abrir Gerenciador de Arquivos com Endereço Específico na sessão "Windows / Acesso rápido à Configurações… / página 2".
:: v1.28.35 2023-11-30 às 19h23, Marcos Aurélio:
::   - Opção para instalação de "Microsoft Office 2019 a 2021" na sessão "Office software".
:: v1.29.36 2023-11-30 às 22h22, Marcos Aurélio:
::   - Opção para "Configurações do Windows" na sessão "Windows / Acesso rápido à Configurações…".
:: v1.30.37 2023-12-01 às 22h28, Marcos Aurélio:
::   - Versão inicial, adicionada a sessão "Downloads" dentro da sessão "Windows" e a opção para instalação de Internet Download Manager.
:: v1.31.38 2023-12-01 às 22h56, Marcos Aurélio:
::   - Opção para "Gerenciador de Tarefas do Windows" na sessão "Windows".
:: v1.32.39 2023-12-02 às 17h46, Marcos Aurélio:
::   - Opção para instalação de "Microsoft Office 365" na sessão "Softwares para Escritório".
:: v1.33.40 2023-12-05 às 14h45, Marcos Aurélio:
::   - Opção para agendar desligamento automático na sessão "Windows".
:: v1.33.41 2023-12-06 às 12h05, Marcos Aurélio:
::   - Removidas as linhas das URL de onde ficam os arquivos no GitHub, não são necessárias.
:: v1.33.42 2023-12-06 às 20h43, Marcos Aurélio:
::   - Foi informado o tamanho dos executáveis em seus arquivos PS1.
:: v1.34.43 2023-12-06 às 21h32, Marcos Aurélio:
::   - Opção para instalar o 'Hasleo WinToHDD Free' na sessão 'Utilitários para Windows'.
:: v1.34.44 2023-12-08 às 20h11, Marcos Aurélio:
::   - Todos os downloads agora exibem uma barra de progresso. Foi modificado as seguintes linhas:
::     Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
::     para
::     Start-BitsTransfer -Source $downloadUrl -Destination $downloadPath
:: v1.35.45 2023-12-10 às 23h12, Marcos Aurélio:
::   - Versão inicial, Opção para colocar URL e iniciar download direto a partir do Windows PowerShell na sessão 'Internet / Downloads'.
:: v1.36.46 2023-12-11 às 20h07, Marcos Aurélio:
::   - Versão inicial, opções para baixar os Sistemas Operacionais da Microsoft e foram mudadas os três pontos (...) por (…) de todos os arquivos .cmd.
:: v1.37.47 2023-12-13 às 20h51, Marcos Aurélio:
::   - Emitir Sequência de Beeps após Downloads das ISO's dos sistemas operacionais da Microsoft.
:: v1.37.48 2023-12-14 às 17h07, Marcos Aurélio:
::   - Ajuste na logo GTi e o nome 'GLOBAL TEC Informática' da tela inicial.
:: v1.37.49 2023-12-16 às 23h44, Marcos Aurélio:
::   - Todos os downloads foram modificados para emitir uma sequência de Beeps.
:: v1.38.50 2023-12-25 às 20h00, Marcos Aurélio:
::   - Opção para instalação de Rufus na sessão "Utilitários para Windows / Ferramentas de restauração do Sistema".
:: v1.38.51 2023-12-28 às 16h58, Marcos Aurélio:
::   - Alterção na execução do utilitário 'WinToHDD', se já estiver instalado, haverá uma pergunta se deseja executá-lo na sessão 'Utilitários para Windows.
::   - Correção do caminho do executável do 'AnyDesk' no arquivo 'Install_AnyDesk.ps1'.
:: v1.39.52 2023-12-29 às 01h41, Sandro de Souza Silva (Servo Informática):
::   - Opção para instalação de 'DriverMax' na sessão 'Utilitários para Windows / Ferramentas de Restauração do Sistema'.
:: v1.39.53 2023-12-29 às 21h34, Marcos Aurélio:
::   - Modificação onde o PowerShell pergunta onde deve salvar o download do arquivo de instalação do 'DriverMax' na sessão
::     'Utilitários para Windows / Ferramentas de Restauração do Sistema'.
:: v1.40.54 2024-01-08 às 18h52, Marcos Aurélio:
::   - Adicionado um comando para mudar a cor do plano de fundo do Windows PowerShell.
:: v1.41.55 2024-01-14 às 11h45, Marcos Aurélio:
::   - Opção para executar "Opções de pastas" na sessão "Windows / Acesso rápido à Configurações".
:: v1.42.56 2024-01-15 às 18h04, Marcos Aurélio:
::   - Opção que para o serviço de spooler de impressão, limpa os arquivos temporários e reinicia o serviço na sessão 'Utilitários para Windows'.
::   - Opção que limpa os arquivos temporários do diretório C:\Windows\Temp e %temp% do usuário.
:: v1.42.57 2024-01-18 às 21h40, Marcos Aurélio:
::   - Alteração no 'menu.ps1' onde verifica se o Windows PowerShell está sendo executado como administrador.
:: v1.42.58 2024-01-19 às 01h08, Marcos Aurélio:
::   - Alteração que mostra a quantidade de arquivos temporários foram apagados na sessão "Utilitários para Windows / Limpar Arquivos Temporários".
:: v1.42.59 2024-01-20 às 17h04, Marcos Aurélio:
::   - Corrigido o nome do arquivo.ps1 que baixa e executa o Revo Uninstaller na função no arquivo 'UtilitiesForWindows.cmd'.
:: v1.43.60 2024-01-20 às 17h04, Marcos Aurélio:
::   - Opção para Sessão 'Software de gerenciamento de partições'. Versão inicial, Menu da Sessão para 'Softwares de Gerenciamento de Partições' no Windows.
:: v1.44.61 2024-01-25 às 19h43, Marcos Aurélio:
::   - Opção para instalação de '7-Zip' na sessão 'Utilitários para Windows / Compactadores'.
:: v1.45.62 2024-01-25 às 20h11, Marcos Aurélio:
::   - Opção para instalação de 'Foxit PDF Reader' na sessão 'Utilitários para Windows / Leitores de PDF'.
:: v1.46.63 2024-02-03 às 20h17, Marcos Aurélio:
::   - Opção para "Compressão de arquivos, PowerShell Backup Automático (.zip)" na sessão "Utilitários para Windows / Backup e Restaruação".
:: v1.47.64 2024-02-04 às 22h57, Marcos Aurélio:
::   - Opção para Obter 'Informações do Sistema com PowerShell' na sessão 'Windows / Acesso rápido às Configurações' página 2.
:: v1.48.65 2024-02-08 às 22h29, Marcos Aurélio:
::   - Inclusão da opção para baixar o 'HopToDesk' na sessão 'Internet / Acesso Remoto'.
:: v1.49.66 2024-02-12 às 03h05, Marcos Aurélio:
::   - Opção para instalação de 'DriverBoosterFree' na sessão 'Utilitários para Windows / Page 2'.
:: v1.50.67 2024-02-12 às 10h27, Marcos Aurélio:
::   - Opção para instalação de 'CPU-Z' na sessão 'Utilitários para Windows / Page 2'.
:: v1.51.68 2024-02-21 às 22h46, Marcos Aurélio:
::   - Opção para instalação de 'Cobian Backup' na sessão 'Utilitários para Windows / Backup e Restauração'.
:: v1.51.69 2024-03-08 às 12h10, Marcos Aurélio:
::   - Condição com uma chave para escolher qual dos comandos serão executados na sessão 'Windows' para atualizar o PowerShell.
:: v1.52.70 2024-03-14 às 00h12, Marcos Aurélio:
::   - Opção para execução de 'Rotinas'.
:: v1.52.71 2024-03-14 às 20h14, Marcos Aurélio:
::   - Correção do nome do 'Rufos', estava escrito 'Fufus' na sessão de utilitários.
:: v1.53.72 2024-03-21 às 18h10, Marcos Aurélio:
::   - Opção para instalação do 'Crystal Disk Info' na sessão 'Utilitários para Windows, na parte 2.
:: v1.54.73 2024-03-21 às 23h26, Marcos Aurélio:
::   - Download e execução de CPU-Z portable em Utilitários para Windows.
:: v1.55.74 2024-03-24 às 23h43, Marcos Aurélio:
::   - Execução de 'Windows Update Activation' e o 'Revo Uninstaller Portable' na sessão 'Utilitários para Windows' e modificação no arquivo './menu.ps1' para criar um ícone da Área de trabalho do Windows que executar o script.
:: v1.55.75 2024-03-29 às 16h38, Marcos Aurélio:
::   - A opção '9' foi mudada para 'Mais…', para acessar a parte 3 do menu de 'Utilitários para Windows' e uma nova opção foi incrementada nesta sessão, a opção foi 'Battery Report'
:: v1.56.76 2024-03-31 às 14h57, Marcos Aurélio:
::   - Adicionada a opção 'Reset AnyDesk' na sessão 'Internet / Acesso remoto' e a rotina 'Reset AnyDesk'.
:: v1.57.77 2024-04-11 às 19h32, Marcos Aurélio:
::   - Adicionada a opção para baixar e instalar o 'SiberiaProg-CH341A', programa de gravação de EPROM.
:: v1.58.78 2024-04-14 às 17h56, Marcos Aurélio:
::   - Adicionada a opção na sessão 'Windows' para criar dois atalhos na Área de trabalho do Windows (Desligar e Reiniciar).
:: v1.59.79 2024-04-16 às 00h43, Marcos Aurélio:
::   - Opção para execução de Gerenciador de Energia (Desligar ou Reiniciar) na sessão 'Windows'.
:: v1.60.80 2024-04-17 às 20h10, Marcos Aurélio:
::   - Opção para criação dos atalhos dos aplicativos Microsoft Office na área de trabalho do Windows na sessão 'Softwares para escritório'.
:: v1.60.81 2024-04-18 às 17h24, Marcos Aurélio:
::   - Ajuste da lista de rotinas para melhor visualizar.
:: v1.60.82 2024-06-14 às 23h17, Marcos Aurélio:
::   - Ajuste na largura da janela do terminal Windows PowerShell para 120.
:: v1.60.83 2024-06-16 às 23h31, Marcos Aurélio:
::   - Incrementação de Configurações do arquivo JSON no diretório raiz.
:: v1.60.84 2024-06-17 às 00h01, Marcos Aurélio:
::   - Correção de um bug, onde o arquivo de configuração './config.json' não era encontrado quando o arquivo que continha a importação era executado de outro local.
:: v1.60.85 2024-06-17 às 18h50, Marcos Aurélio:
::   - Incrementação de novo comando para atualização do PowerShell.
:: v1.61.85 2024-06-26 às 21h24, Marcos Aurélio:
::   - Instalação silenciosa do Git via Winget, se o Winget tiver instalado.
:: v1.62.85 2024-06-27 às 23h25, Marcos Aurélio:
::   - Os recursos do Windows agora serão executados por um arquivo .ps1.
::
:: Licença: GPL.

cls

chcp 65001 > nul

:: Mudar a cor do plano de fundo
powershell -command "$Host.UI.RawUI.BackgroundColor = 'Black'"
cls

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
echo.
echo  ░██████╗░████████╗██╗
echo  ██╔════╝░╚══██╔══╝██║
echo  ██║░░██╗░░░░██║░░░██║
echo  ██║░░╚██╗░░░██║░░░██║
echo  ╚██████╔╝░░░██║░░░██║
echo  ░╚═════╝░░░░╚═╝░░░╚═╝
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo  ▒█▀▀█ ▒█░░░ ▒█▀▀▀█ ▒█▀▀█ ░█▀▀█ ▒█░░░   ▀▀█▀▀ ▒█▀▀▀ ▒█▀▀█
echo  ▒█░▄▄ ▒█░░░ ▒█░░▒█ ▒█▀▀▄ ▒█▄▄█ ▒█░░░   ░▒█░░ ▒█▀▀▀ ▒█░░░
echo  ▒█▄▄█ ▒█▄▄█ ▒█▄▄▄█ ▒█▄▄█ ▒█░▒█ ▒█▄▄█   ░▒█░░ ▒█▄▄▄ ▒█▄▄█
echo.
echo                      ▀█▀ █▀▀▄ █▀▀ █▀▀█ █▀▀█ █▀▄▀█ █▀▀█ ▀▀█▀▀ ░▀░ █▀▀ █▀▀█ 
echo                      ▒█░ █░░█ █▀▀ █░░█ █▄▄▀ █░▀░█ █▄▄█ ░░█░░ ▀█▀ █░░ █▄▄█ 
echo                      ▄█▄ ▀░░▀ ▀░░ ▀▀▀▀ ▀░▀▀ ▀░░░▀ ▀░░▀ ░░▀░░ ▀▀▀ ▀▀▀ ▀░░▀
echo.
echo  ╔══╗╔══╗─────────────╔╗────╔╗───╔══╗──╔═╗───────────────────────╔══╗╔╗
echo  ║╔╗║╚╗╔╩╦═╦═╦╦═╦╗╔═╦═╬╬═╗─╔╝╠═╗─╚║║╬═╦╣═╬═╦╦╦══╦═╗╔═╦═╗╔═╗╔═╗╔═╗║═╦╬╣╚╦╦╦╦╦═╗
echo  ║╠╣║─║║╩╣═╣║║║╬║╚╣╬║╬║║╬╚╗║╬║╬╚╗╔║║╣║║║╔╣╬║╔╣║║║╬╚╣═╣╬╚╣╬║║╩╣║╬║║╔╣║║╔╣║║╔╣╬║
echo  ╚╝╚╝─╚╩═╩═╩╩═╩═╩═╩═╬╗╠╩══╝╚═╩══╝╚══╩╩═╩╝╚═╩╝╚╩╩╩══╩═╩══╩═╝╚═╝╚═╝╚╝╚═╩═╩═╩╝╚═╝
echo  ───────────────────╚═╝
echo  www.gti1.com.br - systemboys@hotmail.com

:: Opções do Menu
set "menu[0]=Sair"
set "menu[1]=Menu QuickWindows…"
set "menu[2]=Windows…"
set "menu[3]=Internet…"
set "menu[4]=Redes…"
set "menu[5]=Execução de Comandos no PowerShell"
set "menu[6]=Utilitários para Windows…"
set "menu[7]=Softwares para Escritório…"
set "menu[8]=Sistemas Operacionais Microsoft…"
set "menu[9]=Executar Rotinas…"

set "default=%1%"

:menu
powershell -noprofile "iex (gc \"%~f0\" | out-string)"

:: Sair
if %ERRORLEVEL% equ 0 (
    echo Você escolheu Sair.
    pause
    goto :EOF
)

:: Menu QuickWindows…
if %ERRORLEVEL% equ 1 (
    cd Package_Installers\Menu_QuickWindows
    call Menu_QuickWindows.cmd 0
    cd ..
)

:: Windows…
if %ERRORLEVEL% equ 2 (
    cd Package_Installers\Windows_Session
    call Windows_Session.cmd 0
    cd ..
)

:: Internet…
if %ERRORLEVEL% equ 3 (
    cd Package_Installers\Internet_Session
    call Internet_Session.cmd 0
    cd ..
)

:: Redes…
if %ERRORLEVEL% equ 4 (
    cd Package_Installers\Networking_Session
    call Networking_Session.cmd 0
    cd ..
)

:: Execução de Comandos no PowerShell
if %ERRORLEVEL% equ 5 (
    cls
    echo Você selecionou a Opção para Execução de Comandos no PowerShell.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Package_Installers\RunPowerShellCommands.ps1""' -Verb RunAs}"

    goto menu
)

:: Utilitários para Windows…
if %ERRORLEVEL% equ 6 (
    cd Package_Installers\UtilitiesForWindows
    call UtilitiesForWindows.cmd 0
    cd ..
)

:: Office software…
if %ERRORLEVEL% equ 7 (
    cd Package_Installers\OfficeSoftware
    call OfficeSoftware.cmd 0
    cd ..
)

:: Sistemas Operacionais Microsoft…
if %ERRORLEVEL% equ 8 (
    cd Package_Installers\MicrosoftOperatingSystems
    call MicrosoftOperatingSystems.cmd 0
    cd ..
)

:: Executar Rotinas…
if %ERRORLEVEL% equ 9 (
    cls
    echo Você selecionou a Opção para Executar Rotinas.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Package_Installers\RunRoutines.ps1""' -Verb RunAs}"

    goto menu
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
