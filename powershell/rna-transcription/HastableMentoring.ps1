<#
Explanation from 'glaxxie' about hastables an their behaviors:

    when hashtable look up value using a key, it will check for 
    both the datatype and the value of the key.

    When you compare [char]'G' to [string]'G' using -eq, it only 
    check for value thus it will result in true. However if you do
    [char]'G' -is [string] then it will give you false because this
    time it is a datatype check.

    Generally speaking from my observation, hashtable really only
    favor two types of datatypes: number and string.
#>

$hashTable = @{}
$hashTable[[char]'A'] = 'AppleChr'
$hashTable[[string]'A'] = 'AppleStr'
$hashTable['B'] = 'Banana'
$hashTable['C'] = 'Cherry'
$hashTable[1] = 'OneNUmber'
$hashTable['1'] = 'OneStr'

foreach ($l in 'ABC'.ToCharArray()) {
    Write-Host "Key is a char: $($hashTable[$l])"
    Write-Host "Key is a str: $($hashTable["$l"])"
}

$hashTable.A #Using dot notation it will only give you the value of key A as string
$hashTable[[char]'A']
$hashTable.1 #Using dot notation it will only give you the value of key 1 as number
$hashTable['1']

foreach ($l in $hashTable.Keys) {
    Write-Host $l.GetType()
}