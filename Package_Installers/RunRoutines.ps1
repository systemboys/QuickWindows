# Array associativo que mapeia as rotinas aos recursos
$Resources = @{
    '123' = 'calc'
    '456' = 'control'
    '789' = 'winver'
}

# Função para executar um recurso
function Execute-Resource {
    param(
        [string]$Resource
    )

    Start-Process $Resource
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
    $Resource = $Resources[$Routine.Trim()]
    if ($Resource) {
        Execute-Resource $Resource
        if ($Routines.Count -gt 1) {
            Write-Host "Waiting for $Resource to finish. Press Enter to continue..."
            Read-Host
        }
    } else {
        Write-Host "Invalid routine: $Routine"
    }
}