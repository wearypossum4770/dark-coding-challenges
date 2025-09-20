<?php

declare(strict_types=1);

namespace Src\Easy;

class StringIsSubsequence
{
	   /**
     * @param String $s
     * @param String $t
     * @return Boolean
     */
    public function transformStringIsSubsequence(string $s, string $t): bool
    {
        $left = 0;
        $right = 0;
        while ($left < strlen($s) && $right < strlen($t)) {
            if ($s[$left] === $t[$right]) {
                $left++;
            }
            $right++;
        }

        return $left === strlen($s);
    }

    public function solve(string $s, string $t): bool
    {
        return $this->transformStringIsSubsequence($s, $t);
    }
}
