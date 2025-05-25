func toGoatLatin(_ sentence: String) -> String {
    if sentence.isEmpty {
        return ""
    }
    
    let vowels = "aeiouAEIOU"
    
    var words = sentence.split(separator: " ")
    
    for (i, word) in words.enumerated() {
        let suffix = String(repeating: "a", count: i + 1)
        
        if let firstCharacter = word.first {
            if vowels.contains(firstCharacter) {
                words[i] = "\(word)ma\(suffix)"
            } else {
                words[i] = "\(word[word.index(after: word.startIndex)...])\(firstCharacter)ma\(suffix)"
            }
        }
    }
    return words.joined(separator: " ")
}

