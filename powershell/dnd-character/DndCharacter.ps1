<#
.SYNOPSIS
    Generate a DnD character with all the classic abilities by rolling 4 dice.

.DESCRIPTION
    A DnD character starts has, among other things, six abilities:
    strength, dexterity, constitution, intelligence, wisdom and charisma.
    These abilities score are determined randomly by throwing dice.
    Throw 4 six-sided dice and return the the sum of the largest three.
    Your character's inittial hitpoints are: 10 + your character's constitution modifier.
    You find your character's constitution modifier by but this formula : (Constitution - 10) / 2 and then round down.
    
.EXAMPLE
    $character = [Character]::new()
    $character | Format-Table
    
    Strength Dexterity Constitution Intelligence Wisdom Charisma HitPoints
    -------- --------- ------------ ------------ ------ -------- ---------
           7        10           15            9     13       13        12

#>
Class Character {

    [int]$HitPoints

    # Abilities
    [int]$Dexterity
    [int]$Constitution
    [int]$Intelligence
    [int]$Wisdom
    [int]$Charisma
    [int]$Strength

    Character() {
        $this.Dexterity = $this.Ability()
        $this.Constitution = $this.Ability()
        $this.Intelligence = $this.Ability()
        $this.Wisdom = $this.Ability()
        $this.Charisma = $this.Ability()
        $this.Strength = $this.Ability()

        $this.HitPoints = 10 + [Character]::GetModifier($this.Constitution)
    }

    static [int] GetModifier([int]$Score) {
        return [math]::Floor(($Score - 10) / 2)
    }

    [int] Ability(){
        # Throw dices
        $Results = Get-Random -Minimum 1 -Maximum 6 -Count 4

        # Get value of minimum dice thrown
        $MinValue = $Results |
            Measure-Object -Minimum |
            Select-Object -ExpandProperty Minimum

        # Delete value of minimum dice thrown
        $DeletedMinimum =$false
        $Best3Results = $Results | 
            ForEach-Object {
                if (!$DeletedMinimum -and $_ -eq $MinValue){
                    $DeletedMinimum = $true
                }
                else { $_ }
            }

        # Return sum of 3 best results
        return ($Best3Results | Measure-Object -Sum).Sum

        # This method could be done by simply making:
        # return Get-Random -Minimum 3 -Maximum 18
        # But i've done this to 'emulate' dice throws

    }
}