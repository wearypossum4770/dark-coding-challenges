<?php

declare(strict_types=1);

namespace Src\Easy;

class PlusOne
{
    public function transformPlusOne(array $digits): array
    {
        $result = $digits;
        $remainder = 1;
        for ($index = count($digits) - 1; $index >= 0; $index--) {
            $num = $result[$index] + $remainder;
            if ($num <= 9) {
                $result[$index] = $num;

                return $result;
            }
            $result[$index] = 0;
            $remainder = 1;
        }
        if ($remainder > 0) {
            array_unshift($result, 1);
        }

        return $result;
    }

    public function solve(array $nums): array
    {
        return $this->transformPlusOne($nums);
    }
}
