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
   .\QuickWindows.ps1
   ```
   
   > **_( ! )_** Sertifique-se de que o [`Git`](https://git-scm.com/download/win "Página de download do Git") esteja instalado em seu Linux!

   > No **_Prompt de Comandos_**
   > Há uma linha para executar o clone e ao mesmo tempo executá-lo:
   > ```batch
   > cd %TEMP% && git clone https://github.com/systemboys/QuickWindows.git & cd QuickWindows & call QuickWindows.ps1
   > ```
   > No **_Microsoft PowerShell_**
   > ```batch
   > cd $env:TEMP ; git clone https://github.com/systemboys/QuickWindows.git ; cd .\QuickWindows\ ; .\QuickWindows.ps1
   > ```
   >
   > Inclusão do `Git` no **_Microsoft PowerShell_**
   > ```powershell
   > irm https://gti1.com.br/quick-w/menu.ps1 | iex
   > ```

3. **Explore e Instale:** Explore as categorias, escolha os pacotes que deseja instalar e siga as instruções. Em poucos instantes, você terá os programas desejados em seu sistema Linux.

**Contribua e Compartilhe:**

Este menu é um projeto de código aberto, e encorajamos contribuições da comunidade. Sinta-se à vontade para abrir problemas, enviar solicitações de pull e ajudar a melhorar esta ferramenta para todos.

Com o QuickWindows, queremos tornar a experiência de instalação de software no Linux tão simples e acessível quanto possível. Esperamos que você aproveite usar o menu tanto quanto nós gostamos de criá-lo!

*Divirta-se instalando, configurando e explorando no Linux!* 🚀🐧

> Marcos Aurélio Rocha da Silva | [https://www.gti1.com.br](https://www.gti1.com.br "Site em desenvolvimento") | systemboys@hotmail.com

---

## Estrutura de arquivos

Este Menu contêm scripts de instalação de pacotes de software dentro do diretório "/QuickWindows/". Estão armazenados vários arquivos.ps1. Veja a estrutura de arquivos:

```batch
/QuickWindows
├─ /Imagens/
│  └─ QuickWindows.png
├─ /Package_Installers/
│  ├─ /Internet_Session/
│  │  ├─ Internet_Session.ps1
│  │  ├─ Install_Package1.ps1
│  │  ├─ Install_Package2.ps1
│  │  ├─ Install_Package3.ps1
│  │  └─ ...
│  ├─ /Menu_QuickWindows/
│  │    └─ Menu_QuickWindows.ps1
│  ├─ /Networking_Session/
│  │  ├─ Networking_Session.ps1
│  │  ├─ Install_Package3.ps1
│  │  └─ ...
│  └─ /Windows_Session/
│     ├─ Windows_Session.ps1
│     ├─ Install_Package1.ps1
│     └─ ...
├─ QuickWindows.ps1
└─ README.md
```

Dentro do diretório "Package_Installers", você pode ter vários `arquivos.ps1`, cada um responsável por instalar um pacote de software específico. Isso torna a estrutura do seu projeto organizada e fácil de entender.

# Rascunho para novos itens

Aqui você pode editar o arquivo caso necessário, adicionando mais recursos.

## Incrementações de itens

Para adicionar uma nova sessão, crie um diretório com o nome da sua nova sessão (Ex.: `/New_Session_A/`), dentro do diretório `/Package_Installers/` e dentro do diretório de sua nova sessão crie o arquivo `.ps1` (Ex.: `New_Session_A.ps1`) e segue abaixo seu conteúdo:

```batch
<# Title: PowerShell Menu QuickWindows | Author: Marcos Aurélio | Date: November 14, 2023 | Website: https://gti1.com.br/ #>

#!/bin/bash

# QuickWindows.ps1 - Executa o menu com várias linhas de comandos
# para instalação de softwares para Windows
#
# URL: https://github.com/systemboys/QuickWindows.git
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de ...
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-11-14 às 18h02, Marcos Aurélio:
#   - Versão inicial, Menu Interativo para instalações de softwares e configurações do Windows.
#
# Licença: GPL.

# Importar variáveis do arquivo inclusionFunctions.ps1.ps1
. .\inclusionFunctions.ps1

# My functions
. .\globalFunctions.ps1

# Adjusting PowerShell window dimensions
$width = "120"
$height = "30"
$size = New-Object System.Management.Automation.Host.Size($width, $height)
$host.UI.RawUI.WindowSize = $size

# Useful variables
$fileName = $MyInvocation.MyCommand.Name # This variable must be in this file
# If there is an argument, set the variable to the value of that argument
$defaultSelection = 0
if ($args) {
    $defaultSelection = $args[0]
}

# Colors
$Host.UI.RawUI.BackgroundColor = "Black" # Background
$Host.UI.RawUI.ForegroundColor = "Green" # Font
 
# Sample list data to populate menu:
# Set $List to any array to populate the menu with custom options
$List =
"Sair...                                                     ",
"Opção 1                                                     ",
"Opção 2                                                     ",
"Opção 3                                                     "

$List = for ($i = 0; $i -lt $List.Length; $i++) { "$($i). $($List[$i])" }

# menu offset to allow space to write a message above the menu
$xmin = 3
$ymin = 3

# Write Menu
Clear-Host
Write-Host "                    ┌─────────────────────────────┐"
Write-Host " ┌──────────────────┤░▒▓ QuackQindows | Início ▓▒░├──────────────────┐"
Write-Host "┌┴──────────────────┘                             └──────────────────┴┐"

# Menu Options
[Console]::SetCursorPosition(0, $ymin)
foreach ($name in $List) {
    for ($i = 0; $i -lt $xmin; $i++) {
        Write-Host -NoNewline
    }
    Write-Host "│ ►"$name" ◄ │"
}

# End of menu
Write-Host "└┬───────────────────────────────────────────────────────────────────┬┘"
Write-Host " │ Use as setas ↓ e ↑ para navegar e Enter ◄┘ para fazer uma seleção │"
Write-Host " └───────────────────────────────────────────────────────────────────┘"

# Footer
footerContent
 
# Highlights the selected line
function Write-Highlighted {
    [Console]::SetCursorPosition(1 + $xmin, $cursorY + $ymin)
    Write-Host -BackgroundColor Yellow -ForegroundColor Black -NoNewline
    Write-Host $List[$cursorY] -BackgroundColor DarkGreen -ForegroundColor White
    [Console]::SetCursorPosition(0, $cursorY + $ymin)     
}

# Undoes highlight
function Write-Normal {
    [Console]::SetCursorPosition(1 + $xmin, $cursorY + $ymin)
    Write-Host $List[$cursorY]  
}
 
# highlight first item by default
$cursorY = $defaultSelection
Write-Highlighted
 
$selection = ""
$menu_active = $true
while ($menu_active) {
    if ([console]::KeyAvailable) {
        $x = $Host.UI.RawUI.ReadKey()
        [Console]::SetCursorPosition(1, $cursorY)
        Write-Normal
        switch ($x.VirtualKeyCode) { 
            # Down key
            38 {
                if ($cursorY -gt 0) {
                    $cursorY = $cursorY - 1
                }
            }
            # Up key
            40 {
                if ($cursorY -lt $List.Length - 1) {
                    $cursorY = $cursorY + 1
                }
            }
            # Enter key
            13 {
                clear
                $selection = $List[$cursorY]
                $ID = $cursorY
                $menu_active = $false
                Invoke-Command -ScriptBlock (Get-Command "commandExecution_$ID").ScriptBlock
            }
        }
        Write-Highlighted
    }
}
```

Para chamar sua nova sessão a partir do menu inicial, adicione a função que executa a mesma:

```batch
:: ... (outras funções)

if %ERRORLEVEL% equ 1 (
    cd Package_Installers\New_Session_A
    call New_Session_A.ps1
    cd ..
)

:: ... (restante do código)
```

**_( i )_** Se por a caso desejar colocar apenas um comando sem sessão, altere o trecho:

```batch
:: ... (restante do código)

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

> **_( i )_** A partir daqui, os comandos devem ser colocados nas condições da nova sessão, se quiser separar os arquivos (.ps1) para escrever os comandos para instalação de pacotes, crie arquivos e nomei como `Install_Mozilla_Firefox.ps1` dentro do mesmo diretório da nova sessão, na condição da nova sessão, mande executar o arquivo e, após a execução dos comandos no arquivo (.ps1) de instalação do pacote, coloque o comando para voltar ao menu anterior.

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
# URL: https://github.com/github_user/project_on_github.git
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

