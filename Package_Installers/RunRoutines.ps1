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
    26 = Acesso rapido a Configuracoes...
        261 = Painel de Controle (Control)
        262 = Editor de Registro (RegEdit)
        263 = Configuracoes do Sistema (MSConfig)
        264 = Servicos (Services.msc)
        265 = Gerenciador de Dispositivos (DevMgmt.msc)
        266 = Gerenciamento de Discos (DiskMgmt.msc)
        267 = Explorador de arquivos do Windows
        268 = Configuracoes - Tela (tipo, ajustes de resolucao de tela)
        269 = Mais...
            2691 = Configuracoes avancadas do sistema (Propriedades do Sistema)
            2692 = Editar Configuracoes do Plano
            2693 = Sobre o Windows (WinVer)
            2694 = Gerenciar arquivos e pastas
            2695 = Configuracoes do Windows
            2696 = Gerenciador de Tarefas do Windows
            2697 = Opcoes de pastas
            2698 = Obtendo Informacoes do Sistema com PowerShell
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
    41 = Obter IP público
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
    64 = Players Multimídia...
        640 = Voltar...
        641 = VLC Media Player
    65 = Software de congelamento do sistema...
        651 = Deep Freeze Standard
        652 = Shadow Defender
    66 = Backup e Restauracao...
        661 = Compressao de arquivos, PowerShell Backup Automatico (.zip)
        662 = Cobian Backup
    67 = Software de gerenciamento de particoes...
        671 = MiniTool Partition Wizard v12 Installation
        672 = MiniTool Partition Wizard v12 32bit portable
        673 = MiniTool Partition Wizard v12 64bit portable
    68 = Ferramentas de restauracao do sistema...
    69 = Mais...
        691 = Limpar Spooler de Impressao
        692 = Limpar Arquivos Temporarios
        693 = Driver Booster Free
        694 = CPU-Z
681 = WinToHDD
682 = Hasleo WinToHDD Free
683 = Fufus
684 = DriverMax
7 = Softwares para Escritorio...
    71 = Microsoft Office 2016 a 2019
    72 = Microsoft Office 2019 a 2021
    73 = Microsoft Office 365
8 = Sistemas Operacionais Microsoft...
    81 = Windows 7, todas as versoes
    82 = Windows 7 Lite
    83 = Windows 10 Pro 32bits
    84 = Windows 10 Pro 64bits
    85 = Windows 10 1909 PRO MSDN LITE Build
    86 = Windows 11 Pro
    87 = Windows Server 2022
"

# Array associativo que mapeia as rotinas aos arquivos .ps1
$Files = @{
    '0'    = ''
    '1'    = ''
    '11'   = ''
    '12'   = ''
    '13'   = ''
    '2'    = ''
    '21'   = ''
    '22'   = ''
    '23'   = ''
    '24'   = ''
    '25'   = ''
    '26'   = ''
    '261'  = ''
    '262'  = ''
    '263'  = ''
    '264'  = ''
    '265'  = ''
    '266'  = ''
    '267'  = ''
    '268'  = ''
    '269'  = ''
    '2691' = ''
    '2692' = ''
    '2693' = ''
    '2694' = ''
    '2695' = ''
    '2696' = ''
    '2697' = ''
    '2698' = ''
    '3'    = ''
    '31'   = ''
    '311'  = PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Internet_Session\Install_AnyDesk.ps1""' -Verb RunAs}"
    '312'  = PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Internet_Session\Install_RustDesk.ps1""' -Verb RunAs}"
    '313'  = ''
    '32'   = ''
    '33'   = ''
    '34'   = ''
    '35'   = ''
    '36'   = ''
    '37'   = ''
    '38'   = ''
    '39'   = ''
    '391'  = PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Internet_Session\Install_Transmission.ps1""' -Verb RunAs}"
    '392'  = ''
    '393'  = ''
    '4'    = ''
    '41'   = ''
    '42'   = ''
    '43'   = ''
    '5'    = ''
    '6'    = ''
    '61'   = ''
    '62'   = ''
    '621'  = ''
    '622'  = ''
    '623'  = ''
    '63'   = ''
    '631'  = ''
    '632'  = ''
    '64'   = ''
    '640'  = ''
    '641'  = ''
    '65'   = ''
    '651'  = ''
    '652'  = ''
    '66'   = ''
    '661'  = ''
    '662'  = ''
    '67'   = ''
    '671'  = ''
    '672'  = ''
    '673'  = ''
    '68'   = ''
    '69'   = ''
    '691'  = ''
    '692'  = ''
    '693'  = ''
    '694'  = ''
    '681'  = ''
    '682'  = ''
    '683'  = ''
    '684'  = ''
    '7'    = ''
    '71'   = ''
    '72'   = ''
    '73'   = ''
    '8'    = ''
    '81'   = ''
    '82'   = ''
    '83'   = ''
    '84'   = ''
    '85'   = ''
    '86'   = ''
    '87'   = ''
}

# Função para executar um arquivo .ps1
function Execute-Script {
    param(
        [string]$File
    )

    if (Test-Path $File) {
        & $File
    } else {
        Write-Host "File not found: $File"
    }
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
        if ($Routines.Count -gt 1) {
            Write-Host "Waiting for $File to finish. Press Enter to continue..."
            Read-Host
        }
    } else {
        Write-Host "Invalid routine: $Routine"
    }
}
