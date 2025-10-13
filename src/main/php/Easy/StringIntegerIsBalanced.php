<?php

declare(strict_types=1);

namespace Src\Easy;

class StringIntegerIsBalanced
{
    public function transformStringIntegerIsBalanced(string $num): bool
    {
        $even = 0;
        $odd = 0;
        for ($i = 0; $i < strlen($num); $i++) {
            if ($i % 2 === 0) {
                $even += intval($num[$i]);
            } else {
                $odd += intval($num[$i]);
            }
        }

        return $even === $odd;
    }

    public function solve(string $num): bool
    {
        return $this->transformStringIntegerIsBalanced($num);
    }
}
