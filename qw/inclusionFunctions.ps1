# Encoding Correction for Text Display
function ShowEncodedString($text) {
    $encodedText = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes($text))
    return $encodedText
}

function footerContent() {
    # Definition of variables
    $currentYear = Get-Date -Format yyyy
    $timeOnMarket = ($currentYear - 2008)
    $footer = " .....................................................................
 :                (C) $currentYear GLOBAL TEC Informática (R)                :
 :              GTi, $timeOnMarket anos no mercado de Informática               :
 :   Website: https://gti1.com.br | Email: systemboys@hotmail.com    :
 :          Author: Marcos Aurélio - Engenheiro de Software          :
 :...................................................................:"
    # Variables display
    Write-Host (ShowEncodedString $footer)
}

