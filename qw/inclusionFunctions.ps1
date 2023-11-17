function headerContent() {
    Write-Host "A Tecnologia da Informacao e o Futuro"
}

function footerContent() {
    # Definition of variables
    $currentYear = Get-Date -Format yyyy
    $timeOnMarket = ($currentYear - 2008)
    $footer = " (C) $currentYear GLOBAL TEC Informatica (R) - GTi, $timeOnMarket anos no mercado de Informatica
 Website: https://gti1.com.br | Email: systemboys@hotmail.com
 Author: Marcos Aurelio - Engenheiro de Software"
    # Variables display
    Write-Host $footer
}

