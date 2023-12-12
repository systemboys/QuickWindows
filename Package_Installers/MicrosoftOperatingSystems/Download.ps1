# Download.ps1 - Executa o script de Download de Softwares.
#
# Autor: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
# Manutenção: Marcos Aurélio R. da Silva <systemboys@hotmail.com>
#
# ---------------------------------------------------------------
# Este programa tem a finalidade de facilitar o Download de Softwares de instalação do Windows.
# ---------------------------------------------------------------
# Histórico:
# v0.0.1 2023-12-31 às 20h51, Marcos Aurélio:
#   - Versão inicial, Download de Softwares.
#
# Licença: GPL.

# [1]=Windows 7, todas as versões
# [2]=Windows 7 Lite
# [3]=Windows 10 Pro 32bits
# [4]=Windows 10 Pro 64bits
# [5]=Windows 10 1909 PRO MSDN LITE Build
# [6]=Windows 11 Pro
# [7]=Windows Server 2022

# Recebe um argumento que pode ser um número
param (
    [Parameter(Mandatory=$true)]
    [int]$numero
)

# Windows 7, todas as versões
$url1 = "https://htciuq.bl.files.1drv.com/y4mt9d6zCC8LoPtWykd16m0C78ToCfoJ-zdWeZYYAC-JDhYnhYcaltM76Ak8fGYw2u82BF5VtA87srqHOQR7mHc0V_FPrm-w0b5J9ns-VT8T8QRg0U4yLxFzCeLVLf-LGAydIKrvwN0LuDZXS9yPyJaRlQSSkguOrvVv6dwq7D8LwANl-NDE2A-ObLZE2dvhtcQGlapagf4_za-Ir_GIdCuNw"

# Windows 7 Lite
$url2 = "https://wiupiq.bl.files.1drv.com/y4mapuTU6SGl-NtIqRdriOzRTv8jqmlEqqp7vbx2dbqc968i9w26S3483DG1tL-GpNyGpovjVmV8OeHEJQfl_rOKZoY_vCeh0ODJE85pRB5e2nOafeEZM5bo6lGLpXHLqeyuQu-z4nx6_h7fCWk-csSPsmyXyybWMYoBxECQdjc5OQrDiuy52kQXg6Wn4Njo-9vJsLR7dV0A4n6fS7huVQTtg"

# Windows 10 Pro 32bits
$url3 = "https://jrfo5g.bl.files.1drv.com/y4mSyioCqp3jImlDW1TCwMSSrjRr9nKaJTq_0YrHKMUjonBmrxTpgn3zgUStM2S8T7Jp3uc7Ggk2x6m3LhO2ZxObGREXlqdwzgx8Lm6eIJDgLzbj39sEwn_g_0LFfbMKpWrM3bzTRIYBANlEkzSlxoiLzXSH4OeIYEOseYcTwimUHup-6hg7Sr5n-xkq4t4CP5OB8vzn730RQpyl3-mr0zXeQ"

# Windows 10 Pro 64bits
$url4 = "https://g1v7fg.bl.files.1drv.com/y4m8DfoQK_e68fwl-96MoPKicK1usQa4LprUOzY_hdbPd-hL5U-95r8byM06mx00XWeCjrbH3EtJg5unyHeOkilCfImrqvB1nUgJ9EgFjh4Z3auIfZ6CKunq5yz_Ft02fgXLSOfdqR2mw_cIoaMYLLjAyjC0NN_1_xtCkKYK80u_6-1JVAIVgtIXs0il82ub2iHLmeSP3nsC3tcF_EGmf0R5w"

# Windows 10 1909 PRO MSDN LITE Build
$url5 = "https://kemhcq.bl.files.1drv.com/y4m29ZLMN-9gkr9xnPXMEuWTk4Q8zs58ud6Tqy6536AVbT154C8qQIthy_Uw3QNhp63x1xPdeAwM4c_90qoga-WcSIysyTYcZ25TCIQB4P1Yx1MmlIFt-RYnoasqrTxhjhItUSQepY3tQQXoUeNTIyoJqPwrRcyedzrI5gXQoxZFg5OlHVkhtAURTJNMydtoPXHH7g4_5oUWO1pWjMnzRHewA"

# Windows 11 Pro
$url6 = "https://wwa4la.bl.files.1drv.com/y4mMrQ82KZWfL4g2Xv87sh53A7wBJcU8aWefOZ0X4vhfwstblCxpDjY6BIjlozd4hfLkEh4V2zV1VRI8MvLKxgtqiNwUnxMYW-i1TUKxespqL7w27kct0QJ5WtyftUvb-fCMs-iFUsDbyriv6RDxonWax3-uvjLvV5yHja1dJVE1ErKZ6LK_rhSAwDWuKNPAOW1bhVUwQd4banYYZu1TJRzhQ"

# Windows Server 2022
$url7 = "https://lf4ufa.bl.files.1drv.com/y4mI-kG_0RZ1EFBvYS8fAhZS67y083H8pTYnueBbUitj5SUoXCKO2P-vFUlwYgxBUH48XtIHi2_C_N1Fp-gj7BY1OsBkKG1C2tJVDwLtjj4y4gmg0DKrYy1EDsOlYBaB5ZZCh4vrfqpc5_tBn03HOpGjqZU85k8zwAgihAgQqZp7rfKlMY0oGtNMf7CvwNWKGpPFWE87uRMGGZP3om40pWGAA"

# Verificação e download do arquivo com base na escolha
switch ($numero) {
    1 { $url = $url1 } # Windows 7, todas as versões
    2 { $url = $url2 } # Windows 7 Lite
    3 { $url = $url3 } # Windows 10 Pro 32bits
    4 { $url = $url4 } # Windows 10 Pro 64bits
    5 { $url = $url5 } # Windows 10 1909 PRO MSDN LITE Build
    6 { $url = $url6 } # Windows 11 Pro
    7 { $url = $url7 } # Windows Server 2022
    default {
        Write-Host "Invalid option. Please choose a valid option."
        exit
    }
}

# Solicitação do local de destino
$destination = Read-Host "Enter the full destination path to save the file"

# Verificação se o destino foi fornecido
if (-not $destination) {
    Write-Host "Destination is mandatory. Please provide the destination path."
    exit
}

# Iniciando o download em uma nova janela do PowerShell
Write-Host "Starting the download in a new window..."
Start-BitsTransfer -Source $url -Destination $destination

Write-Host "Download completed!"
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
