# Importar el módulo Pester si aún no está cargado
if (-not (Get-Module -Name Pester)) {
    Import-Module Pester
}

# Definición de las pruebas
Describe "HelloWorldTest" {
    BeforeAll {
        . ".\HelloWorld.ps1"
    }

    It "Outputs: 'Hello, World!'" {
        Get-HelloWorld | Should Be "Hello, World!"
    }
}
