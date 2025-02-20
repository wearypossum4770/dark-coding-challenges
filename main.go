package main

import (
    "log"
    "github.com/joho/godotenv"
    "os"
	"fmt"
	"github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
	"github.com/wearypossum4770/dark-coding-challenges/easy" // Import easy package
)

func main() {

    // Load .env file
    err := godotenv.Load()
    if err != nil {
        log.Fatal("Error loading .env file")
    }

    // Access environment variables
    goFlags := os.Getenv("GOFLAGS")
    log.Println("GOFLAGS:", goFlags)
	fmt.Println("Hello, Go!")
	fmt.Println("Easy Challenge: Is Palindrome 'madam'?", easy.IsPalindrome("madam"))
	fmt.Println("this is a shared file:?", dark_coding_challenges.FilterNonAlphaNumCharacters("\b5Ὂg̀9! ℃ᾭG"))

}
