package easy

data class TickerCustomer(
    var vouchers: Int,
    val isOriginal: Boolean,
) {
    fun decrement() {
        if (vouchers > 0) vouchers--
    }
}

fun kodeeTimeRequiredToBuy(
    tickets: IntArray,
    k: Int,
): Int {
    var queue: MutableList<TickerCustomer> =
        tickets
            .toMutableList()
            .mapIndexed { index, vouchers ->
                TickerCustomer(vouchers, isOriginal = index == k)
            }.toMutableList()
    var elapsedTime = 0
    while (queue.isNotEmpty()) {
        var person = queue.removeAt(0)
        if (person.vouchers > 0) {
            person.decrement()
            elapsedTime++
        }
        if (person.isOriginal && person.vouchers == 0) break
        if (person.vouchers > 0) {
            queue.add(person)
        }
    }
    return elapsedTime
}
