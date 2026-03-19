#include "find_first_palindrome.h"

bool checkPalindrome(std::string word) {
  int left = 0, right = word.size() - 1;
  while (left < right) {
    if (word[left] != word[right]) return false;
    left++;
    right--;
  }
  return true;
}
std::string firstPalindrome(std::vector<std::string>& words) {
  for (std::string word : words) {
    if (checkPalindrome(word)) return word;
  }
  return "";
}
