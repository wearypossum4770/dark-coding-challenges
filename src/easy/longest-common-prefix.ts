import { longestArrayString } from '~/index'
/**
 * 
 * @copyright https://leetcode.com/problems/longest-common-prefix/submissions/1175494858/
 * Leet Code
 * Problem: #14
 * Name: Longest Common Prefix
 * @param strs list of strings.
 * @returns 
 */
export const longestCommonPrefix = (strs: string[]): string => {
    const prefix = Array(longestArrayString(strs)).fill('');
    if (strs.length === 0) return '';
    for (let outer = 0; outer < strs[0].length; outer++) {
      let char = strs[0][outer];
      for (let inner = 0; inner < strs.length; inner++) {
        if (strs[inner][outer] !== char) return prefix.join('');
      }
      prefix[outer] = char;
    }
    return prefix.join("");

}
