# Definition of variables
$header = "text1"
$current_year = Get-Date -Format yyyy
$time_on_market = ($current_year - 2008)
$footer = " © $currentYear GLOBAL TEC Informática ® - GTi, $time_on_market anos no mercado de Informática
     Website: https://gti1.com.br | Email: systemboys@hotmail.com
            Author: Marcos Aurélio - Engenheiro de Software"

Export-ModuleMember -Variable header, current_year, time_on_market, footer