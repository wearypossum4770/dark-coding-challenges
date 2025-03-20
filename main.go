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
    leaves := []int { 10, 5, 15}
    tree := easy.BuildTreeNode(leaves)

    // Access environment variables
    goFlags := os.Getenv("GOFLAGS")
    log.Println("\nGOFLAGS:", goFlags)
	fmt.Println("\nHello, Go!")
    fmt.Println("\nEasy Challenge", tree)
	fmt.Println("\nEasy Challenge: Is Palindrome 'madam'?", easy.IsPalindrome("madam"))
	fmt.Println("\nthis is a shared file:?", dark_coding_challenges.FilterNonAlphaNumCharacters("\b5Ὂg̀9! ℃ᾭG"))
    dark_coding_challenges.GetVersion()
}


