package easy

fun kodeeMajorityFrequencyGroup(s: String): String {
    var freq = mutableMapOf<Char, Int>()
    var entries = mutableMapOf<Int, String>()
    for (char in s) {
        freq[char] = (freq[char] ?: 0) + 1
    }
	
    for ((key, value) in freq) {
        entries[value] = (entries[value] ?: "") + key.toString()
    }
    return entries.entries
        .sortedWith(
            compareByDescending<Map.Entry<Int, String>> { it.value.length }
                .thenByDescending { it.key },
        ).first()
        .value
}
