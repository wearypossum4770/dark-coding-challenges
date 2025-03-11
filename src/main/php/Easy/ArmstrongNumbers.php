<?php

declare(strict_types=1);

namespace Src\Easy;

class ArmstrongNumbers
{
    public function transformArmstrongNumbers(int $n): int
    {
        if ($n < 0) {
            return 0;
        }
        $total = 0;
        $num = array_map('intval', str_split(strval($n)));
        for ($i = 0; $i < count($num); $i++) {
            $total += pow($num[$i], count($num));
        }

        return $total == $n ? 1 : 0;
    }

    public function solve(int $n): int
    {
        return $this->transformArmstrongNumbers($n);
    }
}
