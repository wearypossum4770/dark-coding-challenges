<?php

declare(strict_types=1);

namespace Src\Medium;

function performArithmetic(int $a, int $b, string $operation): int
{
    switch ($operation) {
        case '+':
            return $a + $b;
        case '-':
            return $a - $b;
        case '*':
            return $a * $b;
        default:
            return intdiv($a, $b);
    }
}
class ReversePolishNotation
{
    /**
     * @param  string[]  $tokens
     */
    public function solve(array $tokens): int
    {
        $stack = [];
        foreach ($tokens as $token) {
            if (preg_match('/[0-9]/', $token)) {
                $stack[] = (int) $token;

                continue;
            }
            $rhs = array_pop($stack);
            $lhs = array_pop($stack);
            $stack[] = performArithmetic($lhs, $rhs, $token);
        }

        return array_pop($stack);
    }
}
