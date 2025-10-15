<?php

declare(strict_types=1);

namespace Src\Easy;

class FindWordsContaining
{
    public function transformFindWordsContaining(array $words, string $x): array
    {
        $result = [];
        for ($i = 0; $i < count($words); $i++) {
            if (str_contains($words[$i], $x)) {
                $result[] = $i;
            }

        }

        return $result;
    }

    public function solve(array $words, string $x): array
    {
        return $this->transformFindWordsContaining($words, $x);
    }
}
