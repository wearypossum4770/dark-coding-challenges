<?php

declare(strict_types=1);

namespace Src\Easy;

class ToGoatLatin
{
    public function transformToGoatLatin(string $sentence): string
    {
        $words = explode(' ', $sentence);
        $result = [];
        $vowels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
        foreach ($words as $i => $word) {
            $suffix = str_repeat('a', $i + 1);
            if (in_array($word[0], $vowels)) {
                $result[] = $word . "ma{$suffix}";
            } else {
                $result[] = substr($word, 1) . $word[0] . "ma{$suffix}";
            }
        }

        return implode(' ', $result);
    }

    public function solve(string $sentence): string
    {
        return $this->transformToGoatLatin($sentence);
    }
}
