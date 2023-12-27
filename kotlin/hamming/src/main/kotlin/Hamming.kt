object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int {
        if (leftStrand.length != rightStrand.length){
            throw IllegalArgumentException("left and right strands must be of equal length")
        }
        var result = 0
        for (i in 1..leftStrand.length){
            if (leftStrand[i-1] != rightStrand[i-1]){
                result++
            }
        }
        return result
    }
}
