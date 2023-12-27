object ScrabbleScore {

    fun scoreLetter(c: Char): Int {
        var uc : Char = c.toUpperCase()
        when {
            uc in "QZ"      -> return 10
            uc in "JX"      -> return 8
            uc in "K"       -> return 5
            uc in "FHVWY"   -> return 4
            uc in "BCMP"    -> return 3
            uc in "DG"      -> return 2
            else            -> return 1
        }
    }

    fun scoreWord(word: String): Int {
        var score: Int = 0
        for (letter in word){
            score += scoreLetter(letter)
        }
        return score
    }
}
