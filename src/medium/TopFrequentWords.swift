func topFrequentWords(_ words: [String], _ k: Int)-> [String] {
	var freq: [String: Int] = [:]
	for word in words {
		freq[word, default: 0] += 1
	}


	return freq.sorted{ (a, b) -> Bool in 
	if a.value != b.value {
		return a.value > b.value
	}
	return a.key < b.key
	
	}.prefix(k).map{ $0.key}
}