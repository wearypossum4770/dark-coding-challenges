package main

import (
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
	easy "github.com/wearypossum4770/dark-coding-challenges/easy" // Import easy package
	veryeasy "github.com/wearypossum4770/dark-coding-challenges/very_easy"
)

func main() {

	// Load .env file
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
	leaves := []int{10, 5, 15}
	tree := easy.BuildTreeNode(leaves)

	// Access environment variables
	goFlags := os.Getenv("GOFLAGS")
	log.Println("\nGOFLAGS:", goFlags)
	fmt.Println("\nHello, Go!")
	println("\nThis is a reversed sentence", veryeasy.ReverseSentence("The sky is blue"))
	fmt.Println("\nThis is a reduced array", core.ArrayReduce(leaves))
	fmt.Println("\nEasy Challenge", tree)
	fmt.Println("\nEasy Challenge: Is Palindrome 'madam'?", easy.IsPalindrome("madam"))
	fmt.Println("\nthis is a shared file:?", core.FilterToAlphaNumericLowercase("\b5Ὂg̀9! ℃ᾭG"))
	core.GetVersion()
}
