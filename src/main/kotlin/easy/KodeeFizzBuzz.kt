package easy

fun integerToFizzBuzz(candidate: Int): String {
    if (helpers.divisibleByFifteen(candidate)) return "FizzBuzz"
    if (helpers.divisibleByThree(candidate)) return "Fizz"
    if (helpers.divisibleByFive(candidate)) return "Buzz"
    return candidate.toString()
}

fun kodeeFizzBuzz(candidate: Int): List<String> = (1..candidate).map { num -> integerToFizzBuzz(num) }
