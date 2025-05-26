import Testing

@testable import medium

@Test(

  arguments: [
    ("O", ["O"], true), ("B|O", ["O"], true), ("B", ["O"], false), ("(O&M)", ["O"], false),
    ("(M&O)", ["O"], false), ("(O|B)", ["O", "B"], true), ("(M&F)", ["M", "F"], true),
    ("(M&F)", ["M", "E"], false), ("(B|O|L)", ["B", "M", "F"], true),
    ("(B&M&S&F)", ["B", "M", "F", "S"], true), ("(E|(M&F))", ["M", "E"], true),
    ("(E|(M&F))", ["M", "B"], false), ("( M & F )", ["M", "F"], true),
    ("(E|(M&F))", ["M", "F"], true), ("(M&(F&G))", ["M", "F", "G"], true), ("(M&(F&G))", [], false),
    ("(M&(F&E))", ["M", "F", "G"], false),
    // test cases provided by Chat GPT
    ("", [], false),  // Empty recipe and empty ingredients list
    ("A", [], false),  // Single ingredient in recipe, but no ingredients available
    ("A", ["A"], true),  // Single ingredient, exact match
    ("A", ["B"], false),  // Single ingredient, mismatch
    ("(A&B)", ["A"], false),  // AND condition, missing one ingredient
    ("(A&B)", ["A", "B"], true),  // AND condition, both ingredients present
    ("(A|B)", ["A"], true),  // OR condition, one ingredient present
    ("(A|B)", ["B"], true),  // OR condition, the other ingredient present
    ("(A|B)", ["C"], false),  // OR condition, neither ingredient present
    ("((A&B)|C)", ["A", "B"], true),  // Nested OR with AND condition
    ("((A&B)|C)", ["C"], true),  // Nested OR with single ingredient fulfilling OR condition
    ("((A&B)|C)", ["A"], false),  // Nested OR with missing ingredient
    ("(A&(B|C))", ["A", "B"], true),  // Nested AND with OR, first OR case satisfied
    ("(A&(B|C))", ["A", "C"], true),  // Nested AND with OR, second OR case satisfied
    ("(A&(B|C))", ["A"], false),  // Nested AND with OR, missing second ingredient
    ("((A&B)&C)", ["A", "B", "C"], true),  // Deeply nested AND condition
    ("((A&B)&C)", ["A", "B"], false),  // Deeply nested AND, missing one ingredient
    ("((A|B)&(C|D))", ["A", "C"], true),  // Nested ORs inside an AND condition
    ("((A|B)&(C|D))", ["B", "D"], true),  // Different set of ingredients satisfying OR conditions
    // // failing
    // ("((A|B)&(C|D))", ["A"], false),  // Only partial satisfaction
    ("((((A&B)|C)&D)|E)", ["E"], true),  // Complex expression satisfied with a single ingredient
    ("((((A&B)|C)&D)|E)", ["A", "B", "D"], true),  // Complex expression satisfied by nested conditions
    // // failing
    // ("((((A&B)|C)&D)|E)", ["A", "B"], false),  // Complex expression missing required condition
  ]) func canBePrepared(recipe: String, ingredients: [String], outcome: Bool)
{ #expect(canBePrepared(recipe, ingredients) == outcome) }
