package medium
import kotlin.text.StringBuilder

fun kodeeMaskEmail(email: String): String {
    val first = email[0]
    val atIndex = email.indexOf("@")
    val last = email[atIndex - 1]
    val domain = email.substring(atIndex)
    return "$first*****$last$domain".lowercase()
}

fun kodeeMaskPhone(phone: String): String {
    var sb = StringBuilder()
    val totalDigits = phone.count { it.isDigit() }

    var chars = 0
    var count = 0
	
    for (i in phone.indices.reversed()) {
        if (chars == totalDigits) break
        if (!phone[i].isDigit()) continue
        if (count == 4 || count == 8 || count == 12) {
            count++
            sb.append("-")
        }
        if (count <= 4) {
            sb.append(phone[i])
        } else {
            sb.append("*")
        }
        count++
        chars++
    }
    if (chars > 10) {
        sb.append("+")
    }
    return sb.reversed().toString()
}

fun kodeeMaskingPersonallyIdentifiableInformation(s: String): String {
    if (s.contains("@")) return kodeeMaskEmail(s)
    return kodeeMaskPhone(s)
}
