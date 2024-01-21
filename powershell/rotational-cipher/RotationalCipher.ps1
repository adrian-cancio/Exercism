Function Invoke-RotationalCipher() {
    <#
    .SYNOPSIS
    Rotate a string by a given number of places.

    .DESCRIPTION
    Create an implementation of the rotational cipher, also sometimes called the Caesar cipher.
    
    .PARAMETER Text
    The text to rotate    

    .PARAMETER Shift
    The number of places to shift the text

    .EXAMPLE
    Invoke-RotationalCipher -Text "A" -Shift 1
    #>
    [CmdletBinding()]
    Param(
        [string]$Text, 
        [int]$Shift
    )

    [char]$CHAR_a = "a"
    [char]$CHAR_A = "A"
    $LETTERS_COUNT = 26

    $ROTDictShift = @{}

    foreach ($Letter in "A".."Z"){
        $ROTDictShift[[char]$Letter] = [char](
            ($Letter - $CHAR_A + $Shift) % $LETTERS_COUNT + $CHAR_A
        )
    }
    [String]$ROTShift = ""

    foreach ($Char in $Text.ToCharArray()){
        $ROTChar = $ROTDictShift[$Char]
        $ROTCharLower = ([string]$ROTDictShift[[char](([string]$Char).ToUpper())]).ToLower()
        $ResultChar =
        if ($ROTChar) { $ROTChar }
        elseif ($ROTCharLower) { $ROTCharLower }
        else { $Char }

        $ROTShift += $ResultChar
    }

    return $ROTShift
}
