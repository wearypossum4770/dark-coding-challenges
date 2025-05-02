<?php

declare(strict_types=1);

namespace Src\Easy;

class ValidParentheses
{
    public function transformValidParentheses(string $s): bool
    {
        $stack = [];
        $brackets = ['(' => ')',  '{' => '}',  '[' => ']'];
        for ($i = 0; $i < strlen($s); $i++) {
            if (array_key_exists($s[$i], $brackets)) {
                $stack[] = $s[$i];
            } else {
                if (empty($stack) || $brackets[end($stack)] != $s[$i]) {
                    return false;
                }
                array_pop($stack);
            }
        }

        return empty($stack);
    }

    public function solve(string $s): bool
    {
        return $this->transformValidParentheses($s);
    }
}
