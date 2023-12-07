# **Bem-vindo ao  QuickWindows!**

> **( ! )** Esse menu ainda está em desenvolvimento!

![Menu de instalações de pacotes Linux](./Images/QuickWindows.png "Menu de instalações de pacotes Windows")

QuickWindows: Facilite a vida no Windows com um menu interativo. Instale pacotes, atualize o sistema e execute comandos essenciais com apenas alguns cliques. Simplifique sua experiência no Windows.

**Recursos Principais:**

1. **Instalação Descomplicada:** Esqueça os comandos complexos e a pesquisa por tutoriais. Nosso menu oferece opções para os comandos simples e diretos para instalar programas populares com seleção de opções via setas direcionais ou apenas cliques.

2. **Variedade de Pacotes:** Desde navegadores populares como Google Chrome e Mozilla Firefox até ferramentas de desenvolvimento como Visual Studio Code e Docker, o menu cobre uma ampla gama de necessidades.

3. **Configurações Pré-Definidas:** Além de instalar pacotes, o menu também oferece opções para configurações pré-definidas, economizando tempo e esforço dos usuários.

4. **Documentação Clara:** Cada comando é acompanhado por documentação clara e instruções detalhadas. Não importa se você é um iniciante ou um usuário avançado, você encontrará orientações claras para cada passo.

5. **Comunidade Ativa:** Faça parte de nossa comunidade crescente de usuários. Compartilhe suas experiências, faça perguntas e contribua para melhorias contínuas.

**Como Usar:**

1. **Clone o Repositório:** Clone nosso repositório do GitHub para ter acesso ao **_QuickWindows_**.

   ```
   git clone https://github.com/systemboys/QuickWindows.git
   ```

2. **Navegue e Execute:** Navegue até o diretório do menu e execute os comandos diretamente do terminal `Windows PowerShell`. É tão simples quanto isso!

   ```
   cd QuickWindows
   .\QuickWindows.cmd
   ```
   
   > **_( ! )_** Sertifique-se de que o [`Git`](https://git-scm.com/download/win "Página de download do Git") esteja instalado em seu Linux!

   > No **_Prompt de Comandos_**
   > Há uma linha para executar o clone e ao mesmo tempo executá-lo:
   > ```batch
   > cd %TEMP% && git clone https://github.com/systemboys/QuickWindows.git & cd QuickWindows & call QuickWindows.cmd
   > ```
   > No **_Microsoft PowerShell_**
   > ```batch
   > cd $env:TEMP ; git clone https://github.com/systemboys/QuickWindows.git ; cd .\QuickWindows\ ; .\QuickWindows.cmd
   > ```
   >
   > Inclusão do `Git` no **_Microsoft PowerShell_**
   > ```powershell
   > irm qw.gti1.com.br/menu.ps1 | iex
   > ```

3. **Explore e Instale:** Explore as categorias, escolha os pacotes que deseja instalar e siga as instruções. Em poucos instantes, você terá os programas desejados em seu sistema Linux.

**Contribua e Compartilhe:**

Este menu é um projeto de código aberto, e encorajamos contribuições da comunidade. Sinta-se à vontade para abrir problemas, enviar solicitações de pull e ajudar a melhorar esta ferramenta para todos.

Com o QuickWindows, queremos tornar a experiência de instalação de software no Linux tão simples e acessível quanto possível. Esperamos que você aproveite usar o menu tanto quanto nós gostamos de criá-lo!

*Divirta-se instalando, configurando e explorando no Linux!* 🚀🐧

> Marcos Aurélio Rocha da Silva | [https://www.gti1.com.br](https://www.gti1.com.br "Site em desenvolvimento") | systemboys@hotmail.com

---

## Estrutura de arquivos

Este Menu contêm scripts de instalação de pacotes de software dentro do diretório "/QuickWindows/". Estão armazenados vários arquivos.cmd. Veja a estrutura de arquivos:

```tex
/QuickWindows/
├─ /Images/
│  └─ QuickWindows.png
├─ /Package_Installers/
│  ├─ /Internet_Session/
│  │  ├─ Downloads.cmd
│  │  ├─ Install_AnyDesk.ps1
│  │  ├─ Install_Google_Chrome.ps1
│  │  ├─ Install_Google_Earth_Pro.ps1
│  │  ├─ Install_Internet_Download_Manager.ps1
│  │  ├─ Install_Microsoft_Edge.ps1
│  │  ├─ Install_Mozilla_Firefox.ps1
│  │  ├─ Install_Opera.ps1
│  │  ├─ Install_RealVNCViewer.ps1
│  │  ├─ Install_RustDesk.ps1
│  │  ├─ Install_Skype.ps1
│  │  ├─ Install_Transmission.ps1
│  │  ├─ Internet_Session.cmd
│  │  └─ Session_RemoteAccessSoftware.cmd
│  ├─ /Menu_QuickWindows/
│  │  └─ Menu_QuickWindows.cmd
│  ├─ /Networking_Session/
│  │  ├─ GetConnectionIPRoute.ps1
│  │  ├─ GetLocalIPAddress.ps1
│  │  ├─ GetPublicIPAddress.ps1
│  │  └─ Networking_Session.cmd
│  ├─ /OfficeSoftware/
│  │  ├─ Install_Microsoft_Office_2016_to_2019.ps1
│  │  ├─ Install_Microsoft_Office_2019_to_2021.ps1
│  │  ├─ Install_Microsoft_Office_365.ps1
│  │  └─ OfficeSoftware.cmd
│  ├─ /UtilitiesForWindows/
│  │  ├─ Compactors.cmd
│  │  ├─ Install_AdobeReaderPDF.ps1
│  │  ├─ Install_Deep_Freeze.ps1
│  │  ├─ Install_Revo_Uninstaller.ps1
│  │  ├─ Install_Shadow_Defender.ps1
│  │  ├─ Install_VLCMediaPlayer.ps1
│  │  ├─ Install_WinRAR.ps1
│  │  ├─ Install_WinToHDD.ps1
│  │  ├─ Install_WinZip.ps1
│  │  ├─ MultimediaPlayers.cmd
│  │  ├─ PDFReaders.cmd
│  │  ├─ SystemFreezeSoftware.cmd
│  │  ├─ SystemRestoreTools.cmd
│  │  └─ UtilitiesForWindows.cmd
│  ├─ /Windows_Session/
│  │  ├─ ManageFilesAndFolders.ps1
│  │  ├─ QuickAccessToSettings.cmd
│  │  ├─ QuickAccessToSettings2.cmd
│  │  ├─ ScheduleWindowsShutdown.ps1
│  │  ├─ Update_PowerShell.ps1
│  │  ├─ UpdatingSoftwareInWindows.ps1
│  │  └─ Windows_Session.cmd
│  └─ RunPowerShellCommands.ps1
├─ QuickWindows.cmd
├─ README.md
└─ menu.ps1
```

Dentro do diretório "Package_Installers", você pode ter vários `arquivos.cmd`, cada um responsável por instalar um pacote de software específico. Isso torna a estrutura do seu projeto organizada e fácil de entender.

---

## Estrutura de opções

Todas as opções do QuickWindows

Aqui estão todas as opções em desenvolvimento.

- [x] **Menu QuickWindows**
  - [x] Sair
  - [x] **Menu QuickWindows**
    - [x] Voltar...
    - [x] Atualizar QuickWindows
    - [x] Deletar QuickWindows
    - [x] Recarregar QuickLinux
  - [x] **Windows**
    - [x] Voltar...
    - [x] Desligar o Windows
    - [x] Reiniciar o Windows
    - [x] Agendar desligamento do Windows
    - [x] Atualizar Windows e Softwares
    - [x] Atualizar o PowerShell
    - [x] **Acesso rápido à Configurações**
      - [x] Painel de controle
      - [x] RegEdit
      - [x] MSConfig
      - [x] Services
      - [x] Gerenciador de dispositivos
      - [x] Gerenciamento de discos
      - [x] Explorador de arquivos do Windows
      - [x] Configurações - Tela (tipo, ajustes de resolução de tela)
      - [x] Configurações avançadas do sistema (Propriedades do Sistema)
      - [x] Editar Configurações do Plano
      - [x] Sobre o Windows (WinVer)
      - [x] Gerenciar arquivos e pastas
      - [x] Configurações do Windows
      - [x] Gerenciador de Tarefas do Windows
  - [x] **Internet**
    - [x] Voltar...
    - [x] Acesso Remoto...
      - [x] AnyDesk
      - [x] RustDesk
    - [x] Instalar Microsoft Edge
    - [x] Instalar Google Chrome
    - [x] Instalar Google Earth Pro
      ( ! ) Fase de teste...
    - [x] Instalar Skype
      > ( ! ) O tamanho do instalador do "Skype-setupe.exe" é 84.74 MB, está hospedado no GitHub e não é recomendado! Procurar um hospedeiro em breve.
    - [x] Instalar Opera
    - [x] Instalar Mozilla Firefox
    - [x] Instalar TigerVNC Viewer
    - [ ] Pesquisar na Web
      > ( i ) O usuário clica na opção, aparece uma pop-up com um campo de formulário e após digitar, a o navegador padrão do Windows abrirá com a pesquisa já indexada.
    - [x] Downloads
      - [x] Transmission
        > ( i ) Ferramenta para download de turrents.
      - [x] IDM - Internet Download Manager
  - [x] **Redes**
    - [x] Voltar...
    - [x] Obter IP público
    - [x] Obter IP local
    - [x] Obter IP's de uma determinada rota
  - [x] Execução de Comandos no PowerShell
  - [x] **Utilitários para Windows**
    - [x] Voltar...
    - [x] Instalar Revo Unistaller
      > ( ! ) Apresentou problemas chegando a não baixar o arquivo!
    - [x] **Compactadores**
      - [x] Instalar WinRAR
      - [x] Instalar WinZIP
    - [x] **Leitores de PDF**
      - [x] Instalar Acrobat Reader DC Win10
      - [x] Instalar Acrobat Reader DC Win11
    - [x] **Players Multimídia**
      - [x] Instalar VLC Media Player
    - [x] **Software de congelamento do sistema**
      - [x] Instalar Deep Freeze
      - [x] Instalar Shadow Defender
    - [x] **Backup e Restauração**
      - [ ] Instalar Veeam Backup
      - [ ] Copiar arquivos de origem para destino
        > ( ! ) Via comando PowerShell, o usuário deverá informar a origem e o destino.
    - [x] **Software de gerenciamento de partições**
      - [ ] Partition Magic
      - [ ] MiniTool Partition Wizard
      - [ ] GParted
    - [x] **Ferramentas de restauração do sistema**
      - [x] WinToHDD
      - [x] Hasleo WinToHDD Free
  - [x] **Softwares para Escritório**
    - [x] Microsoft Office 2016 a 2019
    - [x] Microsoft Office 2019 a 2021
    - [x] Microsoft Office 365

> ***( ! ) Atenção!*** Esses recursos que estão marcos **[x]** estão concluídos, apenas os desmarcados **[_]** ainda serão incluídos!
>
> Alguns que tiveram mal funcionamento foram comentados com ( ! ) e, outros com informações ( i )...

---

# Rascunho para novos itens

Aqui você pode editar o arquivo caso necessário, adicionando mais recursos.

## Incrementações de itens

Para adicionar uma nova sessão, crie um diretório com o nome da sua nova sessão (Ex.: `/New_Session_A/`), dentro do diretório `/Package_Installers/` e dentro do diretório de sua nova sessão crie o arquivo `.cmd` (Ex.: `New_Session_A.cmd`) e segue abaixo seu conteúdo:

```batch
<# : Batch portion
@echo off & setlocal enabledelayedexpansion

:: menu_Session_1.cmd - Para instalação de softwares para Windows
::
:: Autor: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
:: Manutenção: Marcos Aurélio R. da Silva "systemboys@hotmail.com"
::
:: ---------------------------------------------------------------
:: Este programa tem a finalidade de agilizar na instalação de softwares
:: para Windows durante a formatação e/ou manutenção de computadores.
:: ---------------------------------------------------------------
:: Histórico:
:: v0.0.1 2023-10-28 às 16h40, Marcos Aurélio:
::   - Versão inicial, menu_Session_1 de instalações de programas para Windows.
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
echo QuickWindows / Sessão

:: Opções do Menu
set "menu_Session_1[0]=Voltar..."
set "menu_Session_1[1]=Opção 1"
set "menu_Session_1[2]=Opção 2"
set "menu_Session_1[3]=Opção 3"

set "default=%1"

:menu_Session_1
powershell -noprofile "iex (gc \"%~f0\" | out-string)"

:: Voltar...
if %ERRORLEVEL% equ 0 (
    cls
    cd ..
    cd ..
    call QuickWindows.cmd
)

:: Opção 1
if %ERRORLEVEL% equ 1 (
    cls
    echo Você selecionou a Opção 1.

    @REM  Your commands here...

    goto menu_Session_1
)

:: Opção 2
if %ERRORLEVEL% equ 2 (
    cls
    echo Você selecionou a Opção 2.

    @REM  Your commands here...

    goto menu_Session_1
)

:: Opção 3
if %ERRORLEVEL% equ 3 (
    cls
    echo Você selecionou a Opção 3.

    @REM  Your commands here...

    goto menu_Session_1
)

goto :EOF
: end batch / begin PowerShell hybrid chimera #>

$menu_Session_1title = "=== QuickWindows / New Session ==="
$menu_Session_1prompt = "Use as teclas direcionais. Pressione Enter para selecionar."

$maxlen = $menu_Session_1prompt.length + 6
$menu_Session_1 = gci env: | ?{ $_.Name -match "^menu_Session_1\[\d+\]$" } | %{
    $_.Value.trim()
    $len = $_.Value.trim().Length + 6
    if ($len -gt $maxlen) { $maxlen = $len }
}
[int]$selection = $env:default
$h = $Host.UI.RawUI.WindowSize.Height
$w = $Host.UI.RawUI.WindowSize.Width
$xpos = [math]::floor(($w - ($maxlen + 5)) / 2)
$ypos = [math]::floor(($h - ($menu_Session_1.Length + 4)) / 3)

$offY = [console]::WindowTop;
$rect = New-Object Management.Automation.Host.Rectangle `
    0,$offY,($w - 1),($offY+$ypos+$menu_Session_1.length+4)
$buffer = $Host.UI.RawUI.GetBufferContents($rect)

function destroy {
    $coords = New-Object Management.Automation.Host.Coordinates 0,$offY
    $Host.UI.RawUI.SetBufferContents($coords,$buffer)
}

function getKey {
    while (-not ((37..40 + 13 + 48..(47 + $menu_Session_1.length)) -contains $x)) {
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

function menu_Session_1 {
    $line = $ypos
    center $menu_Session_1title
    $line++
    center " "
    $line++

    for ($i=0; $item = $menu_Session_1[$i]; $i++) {
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
    center $menu_Session_1prompt
    1
}

while (menu_Session_1) {

    [int]$key = getKey

    switch ($key) {

        37 {}   # left or up
        38 { if ($selection) { $selection-- }; break }

        39 {}   # right or down
        40 { if ($selection -lt ($menu_Session_1.length - 1)) { $selection++ }; break }

        # number or enter
        default { if ($key -gt 13) {$selection = $key - 48}; destroy; exit($selection) }
    }
}
```

> ***( i )*** Nas opções, de forma que fique bem organizadas, quando for uma opção para acessar uma sessão, após o nome, adicione três pontos (Opção 1...), para indicar que é uma sessão.

Para chamar sua nova sessão a partir do menu inicial, adicione a função que executa a mesma:

```batch
:: ... (outras funções)

:: Opção 1
if %ERRORLEVEL% equ 1 (
    cd Package_Installers\New_Session_A
    call New_Session_A.cmd 0
    cd ..
)

:: ... (restante do código)
```

**_( i )_** Se por a caso desejar colocar apenas um comando sem sessão, altere o trecho:

```batch
:: ... (restante do código)

:: Opção 2
if %ERRORLEVEL% equ 2 (
    echo Você selecionou a Opção 2.

    @REM  Your commands here...

    pause
    goto menu
)

:: ... (restante do código)
```

Dê a opção no menu:

```batch
:: ... (outras opções)
set "menu[5]=Redes"
:: ... (restante do código)
```

> **_( i )_** A partir daqui, os comandos devem ser colocados nas condições da nova sessão, se quiser separar os arquivos (.cmd) para escrever os comandos para instalação de pacotes, crie arquivos e nomei como `Install_Mozilla_Firefox.cmd` dentro do mesmo diretório da nova sessão, na condição da nova sessão, mande executar o arquivo e, após a execução dos comandos no arquivo (.cmd) de instalação do pacote, coloque o comando para voltar ao menu anterior.

Pode executar um `arquivo.ps1` para scripts de instalação via PowerShell:

```batch
:: ... (restante do código)

if %ERRORLEVEL% equ 1 (
    cls
    echo Você selecionou a Opção para instalar o Your_Package.

    PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Install_Your_Package.ps1""' -Verb RunAs}"

    goto menu_Session_3
)

:: ... (restante do código)
```

> **_( ! )_** Cuidado com a linha `goto menu_Session_3`, confira nas `:: Opções do Menu`!

Para escrever o `arquivo.ps1` para scripts de instalação:

```powershell
# Install_YourPackage.ps1 - Executa o script de instalação de YourPackage.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar na instalação de
# pacotes para Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-10-31 às 01h10, Marcos Aurélio:
#   - Versão inicial, Instalação de YourPackage.
#
# Licença: GPL.

# Se o YourPackage não estiver instalado, faz o download e instala
$programFiles = "$env:SystemDrive\Program Files"
$directory = "$programFiles\YourPackage"

if (Test-Path $directory) {
    Write-Host "YourPackage is installed!"
} else {
    Write-Host "YourPackage is not installed! Starting installation process."
    Write-Host "File size: 9.9 MB"

    # Link do download e o diretório Temp
    $downloadUrl = "https://download.anydesk.com/YourPackage.exe"
    $downloadPath = "$env:temp\YourPackage.exe"
    
    # Faz o download do YourPackage
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    
    # Instala o YourPackage
    Start-Process -FilePath "$downloadPath" -Wait

    # Apagar o arquivo
    Remove-Item -Path $downloadPath -Force
}

Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

```

> **_( i )_** Neste arquivo você pode escrever os comandos para instalação de pacotes e outros comandos.

