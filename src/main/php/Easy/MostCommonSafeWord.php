<?php

declare(strict_types=1);

namespace Src\Easy;

class MostCommonSafeWord
{
    /**
     * @param  string[]  $banned
     */
    public function solve(string $paragraph, array $banned): string
    {
        $result = [];
        $words = preg_split('/[^a-zA-Z]+/', strtolower($paragraph), -1, PREG_SPLIT_NO_EMPTY);

        foreach ($words as $word) {
            if (! in_array($word, $banned, true)) {
                $result[$word] = ($result[$word] ?? 0) + 1;
            }
        }
        arsort($result);

        return key($result) ?: '';
    }
}
