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
# v0.0.1 2024-03-13 às 19h10, Marcos Aurélio:
#   - Versão inicial, Execução de Rotinas.
# v0.0.2 2024-03-21 às 18h19, Marcos Aurélio:
#   - Adicionada a rotina para o 'Crystal Disk Info'.
# v0.0.3 2024-03-21 às 23h26, Marcos Aurélio:
#   - Adicionada a rotina para Download e execução de CPU-Z portable em Utilitários para Windows.
# v0.0.4 2024-03-24 às 23h43, Marcos Aurélio:
#   - Adicionada a rotina para Execução de 'Windows Update Activation' e o 'Revo Uninstaller Portable' na sessão 'Utilitários para Windows'.
# v0.0.5 2024-03-29 às 16h47, Marcos Aurélio:
#   - Adicionada a rotina para 'Battery Report'.
# v0.0.6 2024-03-31 às 14h48, Marcos Aurélio:
#   - Adicionada a rotina para 'Reset AnyDesk'.
# v0.0.7 2024-04-14 às 17h56, Marcos Aurélio:
#   - Adicionada a rotina na sessão 'Windows' para criar dois atalhos na Área de trabalho do Windows (Desligar e Reiniciar).
# v0.0.8 2024-04-16 às 00h43, Marcos Aurélio:
#   - Adicionada a rotina para execução de Gerenciador de Energia (Desligar ou Reiniciar) na sessão 'Windows'.
# v0.0.9 2024-04-17 às 20h10, Marcos Aurélio:
#   - Adicionada a rotina para Criação dos atalhos dos aplicativos Microsoft Office na área de trabalho do Windows na sessão 'Softwares para escritório'.
# v0.1.0 2024-04-20 às 17h51, Marcos Aurélio:
#   - Ajuste de cores em algumas linhas da lista de rotinas, com a inteção de destacar de vermelho as que não estão funcionando.
#
# Licença: GPL.

# Cria uma nova instância do objeto System.Management.Automation.Host.Size
$size = New-Object System.Management.Automation.Host.Size(100, 30)

# Atribui o novo tamanho à janela do PowerShell
$host.UI.RawUI.WindowSize = $size

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "                                      ROTINAS                                   | (ok) => (.ps1)" -ForegroundColor Green
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "0 = Sair                                                                                [ null ]" -ForegroundColor Red
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "1 = Menu QuickWindows...                                                                [ null ]" -ForegroundColor Red
Write-Host "    11 = Atualizar QuickWindows                                                         [  ok  ]" -ForegroundColor Green
Write-Host "    12 = Deletar QuickWindows                                                           [  ok  ]" -ForegroundColor Green
Write-Host "    13 = Recarregar QuickWindows                                                        [  ok  ]" -ForegroundColor Green
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "2 = Windows...                                                                          [ null ]" -ForegroundColor Red
Write-Host "    21 = Desligar o Windows                                                             [  ok  ]" -ForegroundColor Green
Write-Host "    22 = Reiniciar o Windows                                                            [  ok  ]" -ForegroundColor Green
Write-Host "    23 = Agendar desligamento do Windows                                                [  ok  ]" -ForegroundColor Green
Write-Host "    24 = Atualizar Windows e Softwares                                                  [  ok  ]" -ForegroundColor Green
Write-Host "    25 = Atualizar o PowerShell                                                         [  ok  ]" -ForegroundColor Green
Write-Host "    26 = Acesso rapido a Configuracaes...                                               [ null ]" -ForegroundColor Red
Write-Host "        261 = Painel de Controle (Control)                                              [ null ]" -ForegroundColor Red
Write-Host "        262 = Editor de Registro (RegEdit)                                              [ null ]" -ForegroundColor Red
Write-Host "        263 = Configuracaes do Sistema (MSConfig)                                       [ null ]" -ForegroundColor Red
Write-Host "        264 = Servicas (Services.msc)                                                   [ null ]" -ForegroundColor Red
Write-Host "        265 = Gerenciador de Dispositivos (DevMgmt.msc)                                 [ null ]" -ForegroundColor Red
Write-Host "        266 = Gerenciamento de Discos (DiskMgmt.msc)                                    [ null ]" -ForegroundColor Red
Write-Host "        267 = Explorador de arquivos do Windows                                         [ null ]" -ForegroundColor Red
Write-Host "        268 = Configuracaes - Tela (tipo, ajustes de resolucao de tela)                 [ null ]" -ForegroundColor Red
Write-Host "        269 = Mais...                                                                   [ null ]" -ForegroundColor Red
Write-Host "            2691 = Configuracaes avancadas do sistema (Propriedades do Sistema)         [ null ]" -ForegroundColor Red
Write-Host "            2692 = Editar Configuracaes do Plano                                        [ null ]" -ForegroundColor Red
Write-Host "            2693 = Sobre o Windows (WinVer)                                             [ null ]" -ForegroundColor Red
Write-Host "            2694 = Gerenciar arquivos e pastas                                          [  ok  ]" -ForegroundColor Green
Write-Host "            2695 = Configuracaes do Windows                                             [  ok  ]" -ForegroundColor Red
Write-Host "            2696 = Gerenciador de Tarefas do Windows                                    [  ok  ]" -ForegroundColor Red
Write-Host "            2697 = Opcaes de pastas                                                     [  ok  ]" -ForegroundColor Red
Write-Host "            2698 = Obtendo Informacaes do Sistema com PowerShell                        [  ok  ]" -ForegroundColor Green
Write-Host "    27 = Criar atalhos para 'Desligar e Reiniciar'                                      [  ok  ]" -ForegroundColor Green
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "3 = Internet...                                                                         [ null ]" -ForegroundColor Red
Write-Host "    31 = Acesso Remoto...                                                               [ null ]" -ForegroundColor Red
Write-Host "        311 = AnyDesk                                                                   [  ok  ]" -ForegroundColor Green
Write-Host "        312 = Reset AnyDesk                                                             [  ok  ]" -ForegroundColor Green
Write-Host "        313 = RustDesk                                                                  [  ok  ]" -ForegroundColor Green
Write-Host "        314 = HopToDesk                                                                 [  ok  ]" -ForegroundColor Green
Write-Host "    32 = Navegador Microsoft Edge                                                       [  ok  ]" -ForegroundColor Green
Write-Host "    33 = Navegador Google Chrome                                                        [  ok  ]" -ForegroundColor Green
Write-Host "    34 = Navegador Google Earth Pro                                                     [  ok  ]" -ForegroundColor Green
Write-Host "    35 = Comunicador Skype                                                              [  ok  ]" -ForegroundColor Green
Write-Host "    36 = Navegador Opera                                                                [  ok  ]" -ForegroundColor Green
Write-Host "    37 = Navegador Mozilla Firefox                                                      [  ok  ]" -ForegroundColor Green
Write-Host "    38 = Visualizador Real VNC Viewer                                                   [  ok  ]" -ForegroundColor Green
Write-Host "    39 = Downloads...                                                                   [ null ]" -ForegroundColor Red
Write-Host "        391 = Transmission                                                              [  ok  ]" -ForegroundColor Green
Write-Host "        392 = IDM - Internet Download Manager                                           [  ok  ]" -ForegroundColor Green
Write-Host "        393 = Baixar URL                                                                [  ok  ]" -ForegroundColor Green
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "4 = Redes...                                                                            [ null ]" -ForegroundColor Red
Write-Host "    41 = Obter IP publico                                                               [  ok  ]" -ForegroundColor Green
Write-Host "    42 = Obter IP local                                                                 [  ok  ]" -ForegroundColor Green
Write-Host "    43 = Obter IPs de uma determinada rota                                              [  ok  ]" -ForegroundColor Green
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "5 = Execucao de Comandos no PowerShell                                                  [  ok  ]" -ForegroundColor Green
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "6 = Utilitarios para Windows...                                                         [ null ]" -ForegroundColor Red
Write-Host "    61 = Instalar Revo Uninstaller                                                      [  ok  ]" -ForegroundColor Green
Write-Host "    62 = Compactadores...                                                               [ null ]" -ForegroundColor Red
Write-Host "        621 = WinRAR                                                                    [  ok  ]" -ForegroundColor Green
Write-Host "        622 = WinZip                                                                    [  ok  ]" -ForegroundColor Green
Write-Host "        623 = 7-Zip                                                                     [  ok  ]" -ForegroundColor Green
Write-Host "    63 = Leitores de PDF...                                                             [ null ]" -ForegroundColor Red
Write-Host "        631 = Acrobat Reader DC                                                         [  ok  ]" -ForegroundColor Green
Write-Host "        632 = Foxit PDF Reader                                                          [  ok  ]" -ForegroundColor Green
Write-Host "    64 = Players Multimidia...                                                          [ null ]" -ForegroundColor Red
Write-Host "        641 = VLC Media Player                                                          [  ok  ]" -ForegroundColor Green
Write-Host "    65 = Software de congelamento do sistema...                                         [ null ]" -ForegroundColor Red
Write-Host "        651 = Deep Freeze Standard                                                      [  ok  ]" -ForegroundColor Green
Write-Host "        652 = Shadow Defender                                                           [  ok  ]" -ForegroundColor Green
Write-Host "    66 = Backup e Restauracao...                                                        [ null ]" -ForegroundColor Red
Write-Host "        661 = Compressao de arquivos, PowerShell Backup Automatico (.zip)               [  ok  ]" -ForegroundColor Green
Write-Host "        662 = Cobian Backup                                                             [  ok  ]" -ForegroundColor Green
Write-Host "    67 = Software de gerenciamento de particaes...                                      [ null ]" -ForegroundColor Red
Write-Host "        671 = MiniTool Partition Wizard v12 Installation                                [  ok  ]" -ForegroundColor Green
Write-Host "        672 = MiniTool Partition Wizard v12 32bit portable                              [  ok  ]" -ForegroundColor Green
Write-Host "        673 = MiniTool Partition Wizard v12 64bit portable                              [  ok  ]" -ForegroundColor Green
Write-Host "    68 = Ferramentas de restauracao do sistema...                                       [ null ]" -ForegroundColor Red
Write-Host "        681 = WinToHDD                                                                  [  ok  ]" -ForegroundColor Green
Write-Host "        682 = Hasleo WinToHDD Free                                                      [  ok  ]" -ForegroundColor Green
Write-Host "        683 = Rufus                                                                     [  ok  ]" -ForegroundColor Green
Write-Host "        684 = DriverMax                                                                 [  ok  ]" -ForegroundColor Green
Write-Host "    69 = Mais...                                                                        [ null ]" -ForegroundColor Red
Write-Host "        691 = Limpar Spooler de Impressao                                               [  ok  ]" -ForegroundColor Green
Write-Host "        692 = Limpar Arquivos Temporarios                                               [  ok  ]" -ForegroundColor Green
Write-Host "        693 = Driver Booster Free                                                       [  ok  ]" -ForegroundColor Green
Write-Host "        694 = CPU-Z                                                                     [  ok  ]" -ForegroundColor Green
Write-Host "        695 = CPU-Z Portable                                                            [  ok  ]" -ForegroundColor Green
Write-Host "        696 = Crystal Disk Info                                                         [  ok  ]" -ForegroundColor Green
Write-Host "        697 = Crystal Disk Info Portable                                                [  ok  ]" -ForegroundColor Green
Write-Host "        698 = Windows Update Activation                                                 [  ok  ]" -ForegroundColor Green
Write-Host "        699 = Mais...                                                                   [ null ]" -ForegroundColor Red
Write-Host "            6991 = Revo Uninstaller Portable                                            [  ok  ]" -ForegroundColor Green
Write-Host "            6992 = Battery Report                                                       [  ok  ]" -ForegroundColor Green
Write-Host "            6993 = SiberiaProg-CH341A                                                   [  ok  ]" -ForegroundColor Green
Write-Host "            6994 = SiberiaProg-CH341A Portable                                          [  ok  ]" -ForegroundColor Green
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "7 = Softwares para Escritorio...                                                        [ null ]" -ForegroundColor Red
Write-Host "    71 = Microsoft Office 2016 a 2019                                                   [  ok  ]" -ForegroundColor Green
Write-Host "    72 = Microsoft Office 2019 a 2021                                                   [  ok  ]" -ForegroundColor Green
Write-Host "    73 = Microsoft Office 365                                                           [  ok  ]" -ForegroundColor Green
Write-Host "    74 = Criar atalhos para Apps do Office 2021                                         [  ok  ]" -ForegroundColor Green
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green
Write-Host "8 = Sistemas Operacionais Microsoft...                                                  [ null ]" -ForegroundColor Red
Write-Host "    81 = Windows 7, todas as versoes                                                    [  ok  ]" -ForegroundColor Green
Write-Host "    82 = Windows 7 Lite                                                                 [  ok  ]" -ForegroundColor Green
Write-Host "    83 = Windows 10 Pro 32bits                                                          [  ok  ]" -ForegroundColor Green
Write-Host "    84 = Windows 10 Pro 64bits                                                          [  ok  ]" -ForegroundColor Green
Write-Host "    85 = Windows 10 1909 PRO MSDN LITE Build                                            [  ok  ]" -ForegroundColor Green
Write-Host "    86 = Windows 11 Pro                                                                 [  ok  ]" -ForegroundColor Green
Write-Host "    87 = Windows Server 2022                                                            [  ok  ]" -ForegroundColor Green
Write-Host "------------------------------------------------------------------------------------------------" -ForegroundColor Green

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
            # "261" = "" # Painel de Controle (Control)
            # "262" = "" # Editor de Registro (RegEdit)
            # "263" = "" # Configurações do Sistema (MSConfig)
            # "264" = "" # Serviços (Services.msc)
            # "265" = "" # Gerenciador de Dispositivos (DevMgmt.msc)
            # "266" = "" # Gerenciamento de Discos (DiskMgmt.msc)
            # "267" = "" # Explorador de arquivos do Windows
            # "268" = "" # Configurações - Tela (tipo, ajustes de resolução de tela)
            # "269" = "" # Mais…
                # "2691" = "" # Configurações avançadas do sistema (Propriedades do Sistema)
                # "2692" = "" # Editar Configurações do Plano
                # "2693" = "" # Sobre o Windows (WinVer)
                # "2694" = "" # Gerenciar arquivos e pastas
                # "2695" = "" # Configurações do Windows
                # "2696" = "" # Gerenciador de Tarefas do Windows
                # "2697" = "" # Opções de pastas
                "2698" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\ObtainingSystemInformation.ps1" # Obtendo Informações do Sistema com PowerShell
        "27" = "$env:TEMP\QuickWindows\Package_Installers\Windows_Session\ShortcutMaker.ps1" # Criar atalhos para 'Desligar e Reiniciar'
    # "3" = "" # Internet…
        # "31" = "" # Acesso Remoto…
            "311" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_AnyDesk.ps1" # AnyDesk
            "312" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Reset_AnyDesk.ps1" # Reset AnyDesk
            "313" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_RustDesk.ps1" # RustDesk
            "314" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_HopToDesk.ps1" # HopToDesk
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
        # "41" = "" # Obter IP público
        # "42" = "" # Obter IP local
        # "43" = "" # Obter IPs de uma determinada rota
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
    # "7" = "" # Softwares para Escritório…
        "71" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\Install_Microsoft_Office_2016_to_2019.ps1" # Microsoft Office 2016 a 2019
        "72" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\Install_Microsoft_Office_2019_to_2021.ps1" # Microsoft Office 2019 a 2021
        "73" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\Install_Microsoft_Office_365.ps1" # Microsoft Office 365
        "74" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\MicrosoftAppShortcuts.ps1" # Criar atalhos para Apps do Office 2021
    # "8" = "" # Sistemas Operacionais Microsoft…
        "81" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 1" # Windows 7, todas as versões
        "82" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 2" # Windows 7 Lite
        "83" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 3" # Windows 10 Pro 32bits
        "84" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 4" # Windows 10 Pro 64bits
        "85" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 5" # Windows 10 1909 PRO MSDN LITE Build
        "86" = "$env:TEMP\QuickWindows\Package_Installers\MicrosoftOperatingSystems\Download.ps1 6" # Windows 11 Pro
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
        Execute-Script $File
        Write-Host "Waiting for $File to finish. Press Enter to continue..."
        Read-Host
    } else {
        Write-Host "Invalid routine: $Routine"
    }
}
