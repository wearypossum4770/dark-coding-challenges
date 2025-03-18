<?php

declare(strict_types=1);

namespace Src\Easy;

class TwoSum
{
    public function transformTwoSum(array $nums, int $target): array
    {
        $seen = [];
        foreach ($nums as $index => $num) {
            $complement = $target - $num;
            if (isset($seen[$complement])) {
                return [$seen[$complement], $index];
            }
            $seen[$num] = $index;
        }

        return [];
    }

    public function solve(array $nums, int $target): array
    {
        return $this->transformTwoSum($nums, $target);
    }
}
