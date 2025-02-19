<?php

declare(strict_types=1);

namespace Src\Easy;

class RomanToInt
{
    public static $roman_zero = ['N', 'nil'];

    public function romanToInt(string $roman): int
    {
        $romanNumerals = [
            'I' => 1,
            'V' => 5,
            'X' => 10,
            'L' => 50,
            'C' => 100,
            'D' => 500,
            'M' => 1000,
        ];

        $result = 0;
        $prevValue = 0;
        if (strlen($roman) < 1) {
            return 0;
        }
        for ($i = strlen($roman) - 1; $i >= 0; $i--) {
            $currentValue = array_key_exists($roman[$i], $romanNumerals)
                ? $romanNumerals[$roman[$i]]
                : 0;
            if ($currentValue < $prevValue) {
                $result -= $currentValue;
            } else {
                $result += $currentValue;
            }

            $prevValue = $currentValue;
        }

        return $result;
    }
}
