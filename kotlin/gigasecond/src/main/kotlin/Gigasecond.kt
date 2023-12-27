import java.time.LocalDateTime
import java.time.LocalDate

val GS: Long = 1E9.toLong()

class Gigasecond(startDate: LocalDateTime) {
    
    val date: LocalDateTime = startDate.plusSeconds(GS)

    constructor(ld: LocalDate) : this(ld.atStartOfDay())
    
}
