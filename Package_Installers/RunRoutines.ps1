# RunRoutines.ps1 - Executa o script de Rotinas.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v1.0.0 2024-03-13 às 19h10, Marcos Aurélio:
#   - Versão inicial, Execução de Rotinas.
# v1.1.0 2024-03-21 às 18h19, Marcos Aurélio:
#   - Adicionada a rotina para o 'Crystal Disk Info'.
# v1.2.0 2024-03-21 às 23h26, Marcos Aurélio:
#   - Adicionada a rotina para Download e execução de CPU-Z portable em Utilitários para Windows.
# v1.3.0 2024-03-24 às 23h43, Marcos Aurélio:
#   - Adicionada a rotina para Execução de 'Windows Update Activation' e o 'Revo Uninstaller Portable' na sessão 'Utilitários para Windows'.
# v1.4.0 2024-03-29 às 16h47, Marcos Aurélio:
#   - Adicionada a rotina para 'Battery Report'.
# v1.5.0 2024-03-31 às 14h48, Marcos Aurélio:
#   - Adicionada a rotina para 'Reset AnyDesk'.
# v1.6.0 2024-04-14 às 17h56, Marcos Aurélio:
#   - Adicionada a rotina na sessão 'Windows' para criar dois atalhos na Área de trabalho do Windows (Desligar e Reiniciar).
# v1.7.0 2024-04-16 às 00h43, Marcos Aurélio:
#   - Adicionada a rotina para execução de Gerenciador de Energia (Desligar ou Reiniciar) na sessão 'Windows'.
# v1.8.0 2024-04-17 às 20h10, Marcos Aurélio:
#   - Adicionada a rotina para Criação dos atalhos dos aplicativos Microsoft Office na área de trabalho do Windows na sessão 'Softwares para escritório'.
# v1.9.1 2024-04-20 às 17h51, Marcos Aurélio:
#   - Ajuste de cores em algumas linhas da lista de rotinas, com a inteção de destacar de vermelho as que não estão funcionando.
# v1.10.1 2024-06-16 às 22h31, Marcos Aurélio:
#   - Incrementação de Configurações do arquivo JSON no diretório raiz.
# v1.10.2 2024-06-27 às 23h34, Marcos Aurélio:
#   - Os recursos do Windows agora serão executados por um arquivo .ps1.
# v1.11.2 2024-07-24 às 00h11, Marcos Aurélio:
#   - Opção para baixar e executar o Open Hardware Monitor.
# v1.12.2 2024-07-28 às 00h49, Marcos Aurélio:
#   - Registro de logs.
# v1.12.3 2024-07-29 às 23h48, Marcos Aurélio:
#   - Ajustes no tamanho da janela e no estreitamento das colunas da tabela de rotinas.
# v1.12.4 2024-07-30 às 00h13, Marcos Aurélio:
#   - Inclusão das opções da sessão de redes nas rotinas.
# v1.13.4 2024-08-06 às 23h56, Marcos Aurélio:
#   - Opção para Download e execução de Moo0 System Monitor Portable em Utilitários para Windows.
# v1.14.4 2024-08-12 às 20h19, Marcos Aurélio:
#   - Opção para Acesso ao Setup da BIOS via PowerShell.
# v1.15.4 2024-09-06 às 17h48, Marcos Aurélio:
#   - Script de criação de atalhos para computadores remotos na Área de trabalho do Windows na sessão Internet/Acesso Remoto.
# v1.15.5 2024-09-09 às 20h10, Marcos Aurélio:
#   - Correção das descrições das ISOs do Windows 10 e 11 Pro na sessão Sistemas Operacionais Microsoft.
# v1.15.6 2025-04-04 às 11h32, Marcos Aurélio:
#   - Atualização dos links das ISOs de 'Win10 22H2 x32v1', 'Win10 22H2 x64v1' e 'Win11 24H2 x64' na sessão de 'Sistemas Operacionais da Microsoft'.
#
# Licença: GPL.

# Configurações
# Tenta encontrar o arquivo config.json na pasta raiz
$configPath = "./config.json"
# Verifica se o arquivo existe no caminho atual
if (-not (Test-Path $configPath)) {
    # Se não existir, tenta o caminho relativo
    $configPath = "../../config.json"
}
# Importa as configurações do arquivo encontrado
$configData = Get-Content -Path $configPath | ConvertFrom-Json

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(80, 25)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = $configData.backgroundColor1
Clear-Host  # Limpa a tela para aplicar a nova cor

# ------Importação da função e configuração de endereço e arquivo para Registrar log------
# Importar a função
. .\functions.ps1

# Executar função que cria logs do sistema
$dirName = "GTiSupport"
$fullPath = Join-Path -Path $env:USERPROFILE -ChildPath $dirName
# ------/Importação da função e configuração de endereço e arquivo para Registrar log-----

$logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Executar Rotinas."

# Definir o título da janela do Prompt
$Host.UI.RawUI.WindowTitle = $configData.promptWindowTitle + " / Rotinas"

Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "                                      ROTINAS                   | (ok) => (.ps1)" -ForegroundColor Green
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "0 = Sair                                                                  [null]" -ForegroundColor Red
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "1 = Menu QuickWindows...                                                  [null]" -ForegroundColor Red
Write-Host "    11 = Atualizar QuickWindows                                           [null]" -ForegroundColor Red
Write-Host "    12 = Deletar QuickWindows                                             [null]" -ForegroundColor Red
Write-Host "    13 = Recarregar QuickWindows                                          [null]" -ForegroundColor Red
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "2 = Windows...                                                            [null]" -ForegroundColor Red
Write-Host "    21 = Desligar o Windows                                               [ ok ]" -ForegroundColor Green
Write-Host "    22 = Reiniciar o Windows                                              [ ok ]" -ForegroundColor Green
Write-Host "    23 = Agendar desligamento do Windows                                  [ ok ]" -ForegroundColor Green
Write-Host "    24 = Atualizar Windows e Softwares                                    [ ok ]" -ForegroundColor Green
Write-Host "    25 = Atualizar o PowerShell                                           [ ok ]" -ForegroundColor Green
Write-Host "    26 = Acesso rapido a Configuracaes...                                 [null]" -ForegroundColor Red
Write-Host "        261 = Painel de Controle (Control)                                [ ok ]" -ForegroundColor Green
Write-Host "        262 = Editor de Registro (RegEdit)                                [ ok ]" -ForegroundColor Green
Write-Host "        263 = Configuracaes do Sistema (MSConfig)                         [ ok ]" -ForegroundColor Green
Write-Host "        264 = Servicas (Services.msc)                                     [ ok ]" -ForegroundColor Green
Write-Host "        265 = Gerenciador de Dispositivos (DevMgmt.msc)                   [ ok ]" -ForegroundColor Green
Write-Host "        266 = Gerenciamento de Discos (DiskMgmt.msc)                      [ ok ]" -ForegroundColor Green
Write-Host "        267 = Explorador de arquivos do Windows                           [ ok ]" -ForegroundColor Green
Write-Host "        268 = Configuracaes - Tela (tipo, ajustes de resolucao de tela)   [ ok ]" -ForegroundColor Green
Write-Host "        269 = Mais...                                                     [null]" -ForegroundColor Red
Write-Host "            2691 = Configuracaes avancadas do sistema (Propriedades       [ ok ]" -ForegroundColor Green
Write-Host "                   do Sistema)                                            [ ok ]" -ForegroundColor Green
Write-Host "            2692 = Editar Configuracaes do Plano                          [ ok ]" -ForegroundColor Green
Write-Host "            2693 = Sobre o Windows (WinVer)                               [ ok ]" -ForegroundColor Green
Write-Host "            2694 = Gerenciar arquivos e pastas                            [ ok ]" -ForegroundColor Green
Write-Host "            2695 = Configuracaes do Windows                               [ ok ]" -ForegroundColor Green
Write-Host "            2696 = Gerenciador de Tarefas do Windows                      [ ok ]" -ForegroundColor Green
Write-Host "            2697 = Opcaes de pastas                                       [ ok ]" -ForegroundColor Green
Write-Host "            2698 = Obtendo Informacaes do Sistema com PowerShell          [ ok ]" -ForegroundColor Green
Write-Host "    27 = Criar atalhos para 'Desligar e Reiniciar'                        [ ok ]" -ForegroundColor Green
Write-Host "    28 = Reiniciar e entrar na BIOS da placa-mae                          [ ok ]" -ForegroundColor Green
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "3 = Internet...                                                           [null]" -ForegroundColor Red
Write-Host "    31 = Acesso Remoto...                                                 [null]" -ForegroundColor Red
Write-Host "        311 = AnyDesk                                                     [ ok ]" -ForegroundColor Green
Write-Host "        312 = Reset AnyDesk                                               [ ok ]" -ForegroundColor Green
Write-Host "        313 = RustDesk                                                    [ ok ]" -ForegroundColor Green
Write-Host "        314 = HopToDesk                                                   [ ok ]" -ForegroundColor Green
Write-Host "        315 = Criar atalho de PCs remotos com AnyDesk                     [ ok ]" -ForegroundColor Green
Write-Host "    32 = Navegador Microsoft Edge                                         [ ok ]" -ForegroundColor Green
Write-Host "    33 = Navegador Google Chrome                                          [ ok ]" -ForegroundColor Green
Write-Host "    34 = Navegador Google Earth Pro                                       [ ok ]" -ForegroundColor Green
Write-Host "    35 = Comunicador Skype                                                [ ok ]" -ForegroundColor Green
Write-Host "    36 = Navegador Opera                                                  [ ok ]" -ForegroundColor Green
Write-Host "    37 = Navegador Mozilla Firefox                                        [ ok ]" -ForegroundColor Green
Write-Host "    38 = Visualizador Real VNC Viewer                                     [ ok ]" -ForegroundColor Green
Write-Host "    39 = Downloads...                                                     [null]" -ForegroundColor Red
Write-Host "        391 = Transmission                                                [ ok ]" -ForegroundColor Green
Write-Host "        392 = IDM - Internet Download Manager                             [ ok ]" -ForegroundColor Green
Write-Host "        393 = Baixar URL                                                  [ ok ]" -ForegroundColor Green
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "4 = Redes...                                                              [null]" -ForegroundColor Red
Write-Host "    41 = Obter IP publico                                                 [ ok ]" -ForegroundColor Green
Write-Host "    42 = Obter IP local                                                   [ ok ]" -ForegroundColor Green
Write-Host "    43 = Obter IPs de uma determinada rota                                [ ok ]" -ForegroundColor Green
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "5 = Execucao de Comandos no PowerShell                                    [ ok ]" -ForegroundColor Green
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "6 = Utilitarios para Windows...                                           [null]" -ForegroundColor Red
Write-Host "    61 = Instalar Revo Uninstaller                                        [ ok ]" -ForegroundColor Green
Write-Host "    62 = Compactadores...                                                 [null]" -ForegroundColor Red
Write-Host "        621 = WinRAR                                                      [ ok ]" -ForegroundColor Green
Write-Host "        622 = WinZip                                                      [ ok ]" -ForegroundColor Green
Write-Host "        623 = 7-Zip                                                       [ ok ]" -ForegroundColor Green
Write-Host "    63 = Leitores de PDF...                                               [null]" -ForegroundColor Red
Write-Host "        631 = Acrobat Reader DC                                           [ ok ]" -ForegroundColor Green
Write-Host "        632 = Foxit PDF Reader                                            [ ok ]" -ForegroundColor Green
Write-Host "    64 = Players Multimidia...                                            [null]" -ForegroundColor Red
Write-Host "        641 = VLC Media Player                                            [ ok ]" -ForegroundColor Green
Write-Host "    65 = Software de congelamento do sistema...                           [null]" -ForegroundColor Red
Write-Host "        651 = Deep Freeze Standard                                        [ ok ]" -ForegroundColor Green
Write-Host "        652 = Shadow Defender                                             [ ok ]" -ForegroundColor Green
Write-Host "    66 = Backup e Restauracao...                                          [null]" -ForegroundColor Red
Write-Host "        661 = Compressao de arquivos, PowerShell Backup Automatico (.zip) [ ok ]" -ForegroundColor Green
Write-Host "        662 = Cobian Backup                                               [ ok ]" -ForegroundColor Green
Write-Host "    67 = Software de gerenciamento de particaes...                        [null]" -ForegroundColor Red
Write-Host "        671 = MiniTool Partition Wizard v12 Installation                  [ ok ]" -ForegroundColor Green
Write-Host "        672 = MiniTool Partition Wizard v12 32bit portable                [ ok ]" -ForegroundColor Green
Write-Host "        673 = MiniTool Partition Wizard v12 64bit portable                [ ok ]" -ForegroundColor Green
Write-Host "    68 = Ferramentas de restauracao do sistema...                         [null]" -ForegroundColor Red
Write-Host "        681 = WinToHDD                                                    [ ok ]" -ForegroundColor Green
Write-Host "        682 = Hasleo WinToHDD Free                                        [ ok ]" -ForegroundColor Green
Write-Host "        683 = Rufus                                                       [ ok ]" -ForegroundColor Green
Write-Host "        684 = DriverMax                                                   [ ok ]" -ForegroundColor Green
Write-Host "    69 = Mais...                                                          [null]" -ForegroundColor Red
Write-Host "        691 = Limpar Spooler de Impressao                                 [ ok ]" -ForegroundColor Green
Write-Host "        692 = Limpar Arquivos Temporarios                                 [ ok ]" -ForegroundColor Green
Write-Host "        693 = Driver Booster Free                                         [ ok ]" -ForegroundColor Green
Write-Host "        694 = CPU-Z                                                       [ ok ]" -ForegroundColor Green
Write-Host "        695 = CPU-Z Portable                                              [ ok ]" -ForegroundColor Green
Write-Host "        696 = Crystal Disk Info                                           [ ok ]" -ForegroundColor Green
Write-Host "        697 = Crystal Disk Info Portable                                  [ ok ]" -ForegroundColor Green
Write-Host "        698 = Windows Update Activation                                   [ ok ]" -ForegroundColor Green
Write-Host "        699 = Mais...                                                     [null]" -ForegroundColor Red
Write-Host "            6991 = Revo Uninstaller Portable                              [ ok ]" -ForegroundColor Green
Write-Host "            6992 = Battery Report                                         [ ok ]" -ForegroundColor Green
Write-Host "            6993 = SiberiaProg-CH341A                                     [ ok ]" -ForegroundColor Green
Write-Host "            6994 = SiberiaProg-CH341A Portable                            [ ok ]" -ForegroundColor Green
Write-Host "            6995 = Open Hardware Monitor                                  [ ok ]" -ForegroundColor Green
Write-Host "            6996 = Moo0 System Monitor                                    [ ok ]" -ForegroundColor Green
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "7 = Softwares para Escritorio...                                          [null]" -ForegroundColor Red
Write-Host "    71 = Microsoft Office 2016 a 2019                                     [ ok ]" -ForegroundColor Green
Write-Host "    72 = Microsoft Office 2019 a 2021                                     [ ok ]" -ForegroundColor Green
Write-Host "    73 = Microsoft Office 365                                             [ ok ]" -ForegroundColor Green
Write-Host "    74 = Criar atalhos para Apps do Office 2021                           [ ok ]" -ForegroundColor Green
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "8 = Sistemas Operacionais Microsoft...                                    [null]" -ForegroundColor Red
Write-Host "    81 = Windowns 10 22H2 BrazilianPortuguese x32v1                       [ ok ]" -ForegroundColor Green
Write-Host "    82 = Windowns 10 22H2 BrazilianPortuguese x64v1                       [ ok ]" -ForegroundColor Green
Write-Host "    83 = Windowns 11 24H2 BrazilianPortuguese x64                         [ ok ]" -ForegroundColor Green
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Green

# Array associativo que mapeia as rotinas aos arquivos .ps1
$Files = @{
    # "0" = "" # Sair
    # "1" = "" # Menu QuickWindows…
        # "11" = "" # Atualizar QuickWindows
        # "12" = "" # Deletar QuickWindows
        # "13" = "" # Recarregar QuickWindows
    # "2" = "" # Windows…
        "21" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\PowerStateManager.ps1 1" # Desligar o Windows
        "22" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\PowerStateManager.ps1 2" # Reiniciar o Windows
        # "23" = "" # Agendar desligamento do Windows
        "24" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\UpdatingSoftwareInWindows.ps1" # Atualizar Windows e Softwares
        "25" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\Update_PowerShell.ps1" # Atualizar o PowerShell
        # "26" = "" # Acesso rápido à Configurações…
            "261" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 1" # Painel de Controle (Control)
            "262" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 2" # Editor de Registro (RegEdit)
            "263" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 3" # Configurações do Sistema (MSConfig)
            "264" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 4" # Serviços (Services.msc)
            "265" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 5" # Gerenciador de Dispositivos (DevMgmt.msc)
            "266" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 6" # Gerenciamento de Discos (DiskMgmt.msc)
            "267" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 7" # Explorador de arquivos do Windows
            "268" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 8" # Configurações - Tela (tipo, ajustes de resolução de tela)
            # "269" = "" # Mais…
                "2691" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 9" # Configurações avançadas do sistema (Propriedades do Sistema)
                "2692" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 10" # Editar Configurações do Plano
                "2693" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 11" # Sobre o Windows (WinVer)
                "2694" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\ManageFilesAndFolders.ps1" # Gerenciar arquivos e pastas
                "2695" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 12" # Configurações do Windows
                "2696" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 13" # Gerenciador de Tarefas do Windows
                "2697" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\StartingWindowsFeature.ps1 14" # Opções de pastas
                "2698" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\ObtainingSystemInformation.ps1" # Obtendo Informações do Sistema com PowerShell
        "27" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\ShortcutMaker.ps1" # Criar atalhos para 'Desligar e Reiniciar'
        "28" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\PowerStateManager.ps1 3" # Reiniciar e entrar na BIOS da placa-mãe
    # "3" = "" # Internet…
        # "31" = "" # Acesso Remoto…
            "311" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_AnyDesk.ps1" # AnyDesk
            "312" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Reset_AnyDesk.ps1" # Reset AnyDesk
            "313" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_RustDesk.ps1" # RustDesk
            "314" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_HopToDesk.ps1" # HopToDesk
            "315" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\RemoteComputerShortcuts.ps1" # Criar atalho de PCs remotos com AnyDesk
        "32" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_Microsoft_Edge.ps1" # Navegador Microsoft Edge
        "33" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_Google_Chrome.ps1" # Navegador Google Chrome
        "34" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_Google_Earth_Pro.ps1" # Navegador Google Earth Pro
        "35" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_Skype.ps1" # Comunicador Skype
        "36" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_Opera.ps1" # Navegador Opera
        "37" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_Mozilla_Firefox.ps1" # Navegador Mozilla Firefox
        "38" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_RealVNCViewer.ps1" # Visualizador Real VNC Viewer
        # "39" = "" # Downloads…
            "391" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_Transmission.ps1" # Transmission
            "392" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_Internet_Download_Manager.ps1" # IDM - Internet Download Manager
            "393" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\DownloadURL.ps1" # Baixar URL
    # "4" = "" # Redes…
        "41" = "$env:TEMP\QuickWindows\Package_Installers\Networking_Session\GetPublicIPAddress.ps1" # Obter IP público
        "42" = "$env:TEMP\QuickWindows\Package_Installers\Networking_Session\GetLocalIPAddress.ps1" # Obter IP local
        "43" = "$env:TEMP\QuickWindows\Package_Installers\Networking_Session\GetConnectionIPRoute.ps1" # Obter IPs de uma determinada rota
    "5" = "$env:TEMP\QuickWindows\Package_Installers\RunPowerShellCommands.ps1" # Execução de Comandos no PowerShell
    # "6" = "" # Utilitários para Windows…
        "61" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_Revo_Uninstaller.ps1" # Instalar Revo Uninstaller
        # "62" = "" # Compactadores…
            "621" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_WinRAR.ps1" # WinRAR
            "622" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_WinZip.ps1" # WinZip
            "623" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_7_Zip.ps1" # 7-Zip
        # "63" = "" # Leitores de PDF…
            "631" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_AdobeReaderPDF.ps1" # Acrobat Reader DC
            "632" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_FoxitPDFReader.ps1" # Foxit PDF Reader
        # "64" = "" # Players Multimídia…
            "641" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_VLCMediaPlayer.ps1" # VLC Media Player
        # "65" = "" # Software de congelamento do sistema…
            "651" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_Deep_Freeze.ps1" # Deep Freeze Standard
            "652" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_Shadow_Defender.ps1" # Shadow Defender
        # "66" = "" # Backup e Restauração…
            "661" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\FileCompressionForZip.ps1" # Compressão de arquivos, PowerShell Backup Automático (.zip)
            "662" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_CobianBackup.ps1" # Cobian Backup
        # "67" = "" # Software de gerenciamento de partições…
            "671" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_MiniToolPartitionWizardInstallation.ps1" # MiniTool Partition Wizard v12 Installation
            "672" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_MiniToolPartitionWizard32bitPortable.ps1" # MiniTool Partition Wizard v12 32bit portable
            "673" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_MiniToolPartitionWizard64bitPortable.ps1" # MiniTool Partition Wizard v12 64bit portable
        # "68" = "" # Ferramentas de restauração do sistema…
            "681" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_WinToHDD.ps1" # WinToHDD
            "682" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_Hasleo_WinToHDD_Free.ps1" # Hasleo WinToHDD Free
            "683" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_Rufus.ps1" # Rufus
            "684" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_DriverMax.ps1" # DriverMax
        # "69" = "" # Mais…
            "691" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\ClearPrintSpooler.ps1" # Limpar Spooler de Impressão
            "692" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\ClearTemporaryFiles.ps1" # Limpar Arquivos Temporários
            "693" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_DriverBoosterFree.ps1" # Driver Booster Free
            "694" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_CPU_Z.ps1" # CPU-Z
            "695" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_CPU-Z_Portable.ps1" # CPU-Z Portable
            "696" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_CrystalDiskInfo.ps1" # Crystal Disk Info
            "697" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_CrystalDiskInfo_Portable.ps1" # Crystal Disk Info Portable
            "698" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\WindowsUpdateActivation.ps1" # Windows Update Activation
            # "699" = "" # Mais…
                "6991" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_RevoUninstallerPortable.ps1" # Revo Uninstaller Portable
                "6992" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_BatteryReport.ps1" # Battery Report
                "6993" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Install_SiberiaProg-CH341A.ps1" # SiberiaProg-CH341A
                "6994" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_SiberiaProg-CH341A_Portable.ps1" # SiberiaProg-CH341A Portable
                "6995" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_OpenHardwareMonitor.ps1" # Open Hardware Monitor
                "6996" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_Moo0_System_Monitor.ps1" # Moo0 System Monitor
    # "7" = "" # Softwares para Escritório…
        "71" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\Install_Microsoft_Office_2016_to_2019.ps1" # Microsoft Office 2016 a 2019
        "72" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\Install_Microsoft_Office_2019_to_2021.ps1" # Microsoft Office 2019 a 2021
        "73" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\Install_Microsoft_Office_365.ps1" # Microsoft Office 365
        "74" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\MicrosoftAppShortcuts.ps1" # Criar atalhos para Apps do Office 2021
    # "8" = "" # Sistemas Operacionais Microsoft…
        "81" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 1" # Windows 7, todas as versões
        "82" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 2" # Windows 7 Lite
        "83" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 3" # Windows 10 Pro 32bits
        "84" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 4" # Windows 10 Pro 64bits Versão 21H1 Compilação 19043.1165
        "85" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 5" # Windows 10 1909 PRO MSDN LITE Build
        "86" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 6" # Windows 11 Pro 64bits Versão 21h2 Compilação 22000.2538
        "87" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 7" # Windows Server 2022
}

# Função para executar um arquivo .ps1 em uma nova janela do PowerShell
function Execute-Script {
    param(
        [string]$File
    )

    # Construir o comando para executar o arquivo .ps1 em uma nova janela
    $Command = "Start-Process powershell -ArgumentList '-NoExit','-File','$File' -Wait"

    # Executar o comando
    Invoke-Expression $Command
}

# Loop para solicitar entrada até que uma entrada válida seja fornecida
do {
    Write-Host 'Enter one or more of a routine, example: 123, 456, 789:'
    $Input = Read-Host

    if ([string]::IsNullOrWhiteSpace($Input)) {
        Write-Host 'Please introduce a routine!'
    }
} until (-not [string]::IsNullOrWhiteSpace($Input))

$Routines = $Input -split ','
foreach ($Routine in $Routines) {
    $File = $Files[$Routine.Trim()]
    if ($File) {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Executada a rotina $Routine."
        Execute-Script $File
        Write-Host "Waiting for $File to finish. Press Enter to continue..."
        Read-Host
    } else {
        $logPath = QWLogFunction -Address $fullPath -FileName "QWLog.txt" -Message "Rotina inválida: $Routine"
        Write-Host "Invalid routine: $Routine"
    }
}
