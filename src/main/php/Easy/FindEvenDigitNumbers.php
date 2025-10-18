<?php

declare(strict_types=1);

namespace Src\Easy;

class FindEvenDigitNumbers
{
    public function transformFindEvenDigitNumbers(array $nums): int
    {
        $result = 0;
        foreach ($nums as $value) {
            if (strlen(strval($value)) % 2 === 0) {
                $result++;
            }
        }

        return $result;
    }

    public function solve(array $nums): int
    {
        return $this->transformFindEvenDigitNumbers($nums);
    }
}
