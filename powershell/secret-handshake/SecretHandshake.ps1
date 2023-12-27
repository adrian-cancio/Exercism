Function Invoke-SecretHandshake() {
    <#
    .SYNOPSIS
    Convert a number between 1 and 31 to a sequence of actions in the secret handshake.

    .DESCRIPTION
    The sequence of actions is chosen by looking at the rightmost five digits of the number once it's been converted to binary.
    Start at the right-most digit and move left.

    The actions for each number place are:
    00001 = wink
    00010 = double blink
    00100 = close your eyes
    01000 = jump
    10000 = Reverse the order of the operations in the secret handshake.
    
    .PARAMETER Number
    The value to be converted into a sequence of actions.

    .EXAMPLE
    Invoke-SecretHandshake -Number 2
    Returns: @("double blink")
     #>
    [CmdletBinding()]
    Param(
        [int]$Number
    )
    
    $Actions = @()
    $AllActions = @("jump", "close your eyes", "double blink", "wink")
    $Binary = [Convert]::ToString($Number, 2)
    if ($Binary.Length -lt 5) {
        $Binary = "0" * (5 - $Binary.Length) + $Binary
    }

    foreach ($i in 1..4) {
        if ($Binary[$i] -eq "1") {
            $Actions += $AllActions[$i-1]
        }
    }

    

    if ($Binary[0] -eq "0") {
        $Actions = $Actions[-1..-$Actions.Length]
    }

    return $Actions
}


for ($i = 1; $i -le 31; $i++) {
    # Print the number and the handshake but showing handshake separated by commas
    Write-Host "$i --> $($(Invoke-SecretHandshake -Number $i) -join ", ")"
}
