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
#   - Rotina para o 'Crystal Disk Info'.
# v0.0.3 2024-03-21 às 23h26, Marcos Aurélio:
#   - Versão inicial, Download e execução de CPU-Z portable em Utilitários para Windows.
# v0.0.4 2024-03-24 às 23h43, Marcos Aurélio:
#   - Versão inicial, Execução de 'Windows Update Activation' e o 'Revo Uninstaller Portable' na sessão 'Utilitários para Windows'.
#
# Licença: GPL.

# Define a cor de fundo para preto
$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host  # Limpa a tela para aplicar a nova cor

Write-Host "
## Rotinas

0 = Sair
1 = Menu QuickWindows...
    11 = Atualizar QuickWindows
    12 = Deletar QuickWindows
    13 = Recarregar QuickWindows
2 = Windows...
    21 = Desligar o Windows
    22 = Reiniciar o Windows
    23 = Agendar desligamento do Windows
    24 = Atualizar Windows e Softwares
    25 = Atualizar o PowerShell
    26 = Acesso rapido à Configuracaes...
        261 = Painel de Controle (Control)
        262 = Editor de Registro (RegEdit)
        263 = Configuracaes do Sistema (MSConfig)
        264 = Servicas (Services.msc)
        265 = Gerenciador de Dispositivos (DevMgmt.msc)
        266 = Gerenciamento de Discos (DiskMgmt.msc)
        267 = Explorador de arquivos do Windows
        268 = Configuracaes - Tela (tipo, ajustes de resolucao de tela)
        269 = Mais...
            2691 = Configuracaes avancadas do sistema (Propriedades do Sistema)
            2692 = Editar Configuracaes do Plano
            2693 = Sobre o Windows (WinVer)
            2694 = Gerenciar arquivos e pastas
            2695 = Configuracaes do Windows
            2696 = Gerenciador de Tarefas do Windows
            2697 = Opcaes de pastas
            2698 = Obtendo Informacaes do Sistema com PowerShell
3 = Internet...
    31 = Acesso Remoto...
        311 = AnyDesk
        312 = RustDesk
        313 = HopToDesk
    32 = Navegador Microsoft Edge
    33 = Navegador Google Chrome
    34 = Navegador Google Earth Pro
    35 = Comunicador Skype
    36 = Navegador Opera
    37 = Navegador Mozilla Firefox
    38 = Visualizador Real VNC Viewer
    39 = Downloads...
        391 = Transmission
        392 = IDM - Internet Download Manager
        393 = Baixar URL
4 = Redes...
    41 = Obter IP publico
    42 = Obter IP local
    43 = Obter IPs de uma determinada rota
5 = Execucao de Comandos no PowerShell
6 = Utilitarios para Windows...
    61 = Instalar Revo Uninstaller
    62 = Compactadores...
        621 = WinRAR
        622 = WinZip
        623 = 7-Zip
    63 = Leitores de PDF...
        631 = Acrobat Reader DC
        632 = Foxit PDF Reader
    64 = Players Multimidia...
        640 = Voltar...
        641 = VLC Media Player
    65 = Software de congelamento do sistema...
        651 = Deep Freeze Standard
        652 = Shadow Defender
    66 = Backup e Restauracao...
        661 = Compressao de arquivos, PowerShell Backup Automatico (.zip)
        662 = Cobian Backup
    67 = Software de gerenciamento de particaes...
        671 = MiniTool Partition Wizard v12 Installation
        672 = MiniTool Partition Wizard v12 32bit portable
        673 = MiniTool Partition Wizard v12 64bit portable
    68 = Ferramentas de restauracao do sistema...
        681 = WinToHDD
        682 = Hasleo WinToHDD Free
        683 = Rufus
        684 = DriverMax
    69 = Mais...
        691 = Limpar Spooler de Impressao
        692 = Limpar Arquivos Temporarios
        693 = Driver Booster Free
        694 = CPU-Z
        695 = CPU-Z Portable
        696 = Crystal Disk Info
        697 = Crystal Disk Info Portable
        698 = Windows Update Activation
        699 = Revo Uninstaller Portable
7 = Softwares para Escritorio...
    71 = Microsoft Office 2016 a 2019
    72 = Microsoft Office 2019 a 2021
    73 = Microsoft Office 365
8 = Sistemas Operacionais Microsoft...
    81 = Windows 7, todas as versões
    82 = Windows 7 Lite
    83 = Windows 10 Pro 32bits
    84 = Windows 10 Pro 64bits
    85 = Windows 10 1909 PRO MSDN LITE Build
    86 = Windows 11 Pro
    87 = Windows Server 2022
"

# Array associativo que mapeia as rotinas aos arquivos .ps1
$Files = @{
    # "0" = "" # Sair
    # "1" = "" # Menu QuickWindows…
        # "11" = "" # Atualizar QuickWindows
        # "12" = "" # Deletar QuickWindows
        # "13" = "" # Recarregar QuickWindows
    # "2" = "" # Windows…
        # "21" = "" # Desligar o Windows
        # "22" = "" # Reiniciar o Windows
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
                # "2698" = "" # Obtendo Informações do Sistema com PowerShell
    # "3" = "" # Internet…
        # "31" = "" # Acesso Remoto…
            "311" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_AnyDesk.ps1" # AnyDesk
            "312" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_RustDesk.ps1" # RustDesk
            "313" = "$env:TEMP\QuickWindows\Package_Installers\Internet_Session\Install_HopToDesk.ps1" # HopToDesk
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
            "699" = "$env:TEMP\QuickWindows\Package_Installers\UtilitiesForWindows\Run_RevoUninstallerPortable.ps1" # Revo Uninstaller Portable
    # "7" = "" # Softwares para Escritório…
        "71" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\Install_Microsoft_Office_2016_to_2019.ps1" # Microsoft Office 2016 a 2019
        "72" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\Install_Microsoft_Office_2019_to_2021.ps1" # Microsoft Office 2019 a 2021
        "73" = "$env:TEMP\QuickWindows\Package_Installers\OfficeSoftware\Install_Microsoft_Office_365.ps1" # Microsoft Office 365
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
