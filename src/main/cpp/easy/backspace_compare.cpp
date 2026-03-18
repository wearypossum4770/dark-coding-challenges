#include "backspace_compare.h"

std::string processString(std::string text) {
  std::vector<char> stack;
  for (char c : text) {
   if (c == '#') {
            if (!stack.empty()) {
                stack.pop_back();
            }
        }else {
      stack.push_back(c);
    }
  }
  return std::string(stack.begin(), stack.end());
}
bool backspaceCompare(std::string s, std::string t) {
  return processString(s) == processString(t);
}
