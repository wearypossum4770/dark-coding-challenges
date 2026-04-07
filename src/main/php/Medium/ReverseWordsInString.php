<?php

declare(strict_types=1);

namespace Src\Medium;

class ReverseWordsInString
{
    public function solve(string $s): string
    {
        return implode(' ', array_reverse(array_filter(explode(' ', trim($s)), 'strlen')));
    }
}
