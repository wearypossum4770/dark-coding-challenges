<?php

declare(strict_types=1);

namespace Src\Medium;

class FrequencySort
{
    public function solve(string $s): string
    {
        $n = strlen($s);
        $freq = [];
        for ($i = 0; $i < $n; $i++) {
            $char = (string) $s[$i];
            $freq[$char] = ($freq[$char] ?? 0) + 1;

        }
        arsort($freq);

        $result = [];
        foreach ($freq as $char => $count) {
            $result[] = str_repeat((string) $char, $count);
        }

        return implode('', $result);
    }
}
