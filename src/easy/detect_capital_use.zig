const std = @import("std");

pub fn allLowerCased(word: []const u8) bool {
    for (word) |char| {
        if (char < 97 or char > 122) return false;
    }
    return true;
}

pub fn allUpperCase(word: []const u8) bool {
    for (word) |char| {
        if (char < 65 or char > 90) return false;
    }
    return true;
}

pub fn firstLetterCapital(char: u8) bool {
    return char >= 65 and char <= 90;
}

pub fn detectCapitalUse(word: []const u8) bool {
    if (firstLetterCapital(word[0])) {
        return allUpperCase(word[1..]) or allLowerCased(word[1..]);
    }
    return allLowerCased(word);
}
