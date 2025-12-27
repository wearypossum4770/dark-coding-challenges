<?php

declare(strict_types=1);

namespace Src\Easy;

class LicenseKeyFormatting
{
    public function solve(string $s, int $k): string
    {
        $word = strtoupper(str_replace('-', '', $s));
        $position = 0;
        $len = strlen($word);
        $stop = intdiv($len, $k);
        $result = array_fill(0, $len + $stop, '');
        $left = count($result) - 1;

        for ($i = $len - 1; $i >= 0; $i--) {
            if ($position === $k) {
                $position = 0;
                $result[$left--] = '-';
            }
            $result[$left--] = $word[$i];
            $position++;
        }

        return implode('', $result);
    }
}
