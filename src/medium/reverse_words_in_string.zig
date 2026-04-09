const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;

const Allocator = std.mem.Allocator;
const ArrayList = std.ArrayList;

pub fn reverseWordsInString(allocator: Allocator, s: []const u8) ?[]const u8 {
    const trimmed = std.mem.trim(u8, s, &std.ascii.whitespace);

    var iter = std.mem.splitAny(u8, trimmed, &std.ascii.whitespace);

    var size: usize = 0;
    var words: ArrayList([]const u8) = .empty;

    while (iter.next()) |word| {
        if (word.len > 0 and !std.ascii.eqlIgnoreCase(word, &std.ascii.whitespace)) {
            size += word.len;
            words.append(allocator, word) catch return null;
        }
    }

    var result = allocator.alloc(u8, words.items.len - 1 + size) catch return null;

    var reversed = std.mem.reverseIterator(words.items);

    var index: usize = 0;

    while (reversed.next()) |word| {
        for (word) |char| {
            result[index] = char;
            index += 1;
        }
        if (index < result.len - 1) {
            result[index] = ' ';
            index += 1;
        }
    }
    defer words.deinit(allocator);
    return result;
}

test "reverse words in the sequence 'the sky is'" {
    const s = "the sky is blue";
    const expected = "blue is sky the";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '  hello wo'" {
    const s = "  hello world  ";
    const expected = "world hello";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'a good   e'" {
    const s = "a good   example";
    const expected = "example good a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'a'" {
    const s = "a";
    const expected = "a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence ' a'" {
    const s = " a";
    const expected = "a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'a '" {
    const s = "a ";
    const expected = "a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence ' a '" {
    const s = " a ";
    const expected = "a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '  a  '" {
    const s = "  a  ";
    const expected = "a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'hello worl'" {
    const s = "hello world";
    const expected = "world hello";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'one two th'" {
    const s = "one two three four five";
    const expected = "five four three two one";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '  spaces  '" {
    const s = "  spaces   between   words  ";
    const expected = "words between spaces";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'word'" {
    const s = "word";
    const expected = "word";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '  word  '" {
    const s = "  word  ";
    const expected = "word";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'a b'" {
    const s = "a b";
    const expected = "b a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'a  b'" {
    const s = "a  b";
    const expected = "b a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'a   b   c'" {
    const s = "a   b   c";
    const expected = "c b a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'Hello Worl'" {
    const s = "Hello World";
    const expected = "World Hello";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'UPPER LOWE'" {
    const s = "UPPER LOWER";
    const expected = "LOWER UPPER";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'camelCase '" {
    const s = "camelCase pascalCase";
    const expected = "pascalCase camelCase";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'abc123 456'" {
    const s = "abc123 456def";
    const expected = "456def abc123";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'foo1 bar2 '" {
    const s = "foo1 bar2 baz3";
    const expected = "baz3 bar2 foo1";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'a1b2c3 d4e'" {
    const s = "a1b2c3 d4e5f6 g7h8i9";
    const expected = "g7h8i9 d4e5f6 a1b2c3";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '123 456 78'" {
    const s = "123 456 789";
    const expected = "789 456 123";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '1'" {
    const s = "1";
    const expected = "1";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence ' 1 '" {
    const s = " 1 ";
    const expected = "1";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '  1  2  3 '" {
    const s = "  1  2  3  ";
    const expected = "3 2 1";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'the   sky '" {
    const s = "the   sky   is   blue";
    const expected = "blue is sky the";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'Alice Bob '" {
    const s = "Alice Bob Charlie Dave Eve";
    const expected = "Eve Dave Charlie Bob Alice";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'foo bar ba'" {
    const s = "foo bar baz qux quux corge grault garply waldo fred";
    const expected = "fred waldo garply grault corge quux qux baz bar foo";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '  leading'" {
    const s = "  leading";
    const expected = "leading";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'trailing  '" {
    const s = "trailing  ";
    const expected = "trailing";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '  both  '" {
    const s = "  both  ";
    const expected = "both";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'a  b  c  d'" {
    const s = "a  b  c  d  e";
    const expected = "e d c b a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'ab cd ef g'" {
    const s = "ab cd ef gh ij kl mn op qr st";
    const expected = "st qr op mn kl ij gh ef cd ab";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'MixED cAsE'" {
    const s = "MixED cAsE wOrDs";
    const expected = "wOrDs cAsE MixED";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'x'" {
    const s = "x";
    const expected = "x";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence ' x '" {
    const s = " x ";
    const expected = "x";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'x y'" {
    const s = "x y";
    const expected = "y x";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence ' x  y '" {
    const s = " x  y ";
    const expected = "y x";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'a b c'" {
    const s = "a b c";
    const expected = "c b a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence ' a  b  c '" {
    const s = " a  b  c ";
    const expected = "c b a";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'word1   wo'" {
    const s = "word1   word2   word3";
    const expected = "word3 word2 word1";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence '  first   '" {
    const s = "  first   second   third  ";
    const expected = "third second first";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'aA bB cC d'" {
    const s = "aA bB cC dD";
    const expected = "dD cC bB aA";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence 'z y x w v '" {
    const s = "z y x w v u t s r q p o n m l k j i h g f e d c b a";
    const expected = "a b c d e f g h i j k l m n o p q r s t u v w x y z";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse words in the sequence ' gtUGyw   '" {
    const s = " gtUGyw       sQ       ZaYYygdFe    Rep6lU  o z      QcspISw       k0b9Ts   KkkRVXY7   OUVxX1zsUL      aQ7iiTy      nKCtoS8       Jp  15uAqvNl   W9Mqf7cep    c      WZJ0M3Z       kX       J     en       wUb6 yY     9v      6eq hQs UmNRei   qEjVjL      xmhQMptz   kT     VBLWqIJXRi       qM      L3jQ78    p    TZH     glfOAYah40   GsaSwLnOs     zIiIXd     YgHsUKFd     i7      0       11lASBGl   LKg3a    LDtzIOvWLt   vPKksW Aa  LFTT      M6FyWJ  y5j02N      lKw sBmxVa1Eh     eLl uM2P  q4    7W8r   GV9    KipYyS0 S pA";
    const expected = "pA S KipYyS0 GV9 7W8r q4 uM2P eLl sBmxVa1Eh lKw y5j02N M6FyWJ LFTT Aa vPKksW LDtzIOvWLt LKg3a 11lASBGl 0 i7 YgHsUKFd zIiIXd GsaSwLnOs glfOAYah40 TZH p L3jQ78 qM VBLWqIJXRi kT xmhQMptz qEjVjL UmNRei hQs 6eq 9v yY wUb6 en J kX WZJ0M3Z c W9Mqf7cep 15uAqvNl Jp nKCtoS8 aQ7iiTy OUVxX1zsUL KkkRVXY7 k0b9Ts QcspISw z o Rep6lU ZaYYygdFe sQ gtUGyw";
    const allocator = std.testing.allocator;
    const result = reverseWordsInString(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
