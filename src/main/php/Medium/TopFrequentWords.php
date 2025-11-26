<?php

declare(strict_types=1);

namespace Src\Medium;

class TopFrequentWords
{
    /**
     * @param  string[]  $words
     * @return string[]
     */
    public function solve(array $words, int $k): array
    {
        $result = [];
        foreach ($words as $word) {
            $result[$word] = ($result[$word] ?? 0) + 1;
        }
        uksort($result, 'strcmp');
        uasort($result, fn ($a, $b) => $b - $a);

        return array_slice(array_keys($result), 0, $k);
    }
}
