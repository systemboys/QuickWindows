# Definition of variables
$header = "text1"
$currentYear = Get-Date -Format yyyy
$timeOnMarket = ($currentYear - 2008)
$footer = " © $currentYear GLOBAL TEC Informática ® - GTi, $timeOnMarket anos no mercado de Informática
     Website: https://gti1.com.br | Email: systemboys@hotmail.com
            Author: Marcos Aurélio - Engenheiro de Software"

Export-ModuleMember -Variable header, currentYear, timeOnMarket, footer