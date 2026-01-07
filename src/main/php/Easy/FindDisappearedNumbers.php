<?php

declare(strict_types=1);

namespace Src\Easy;

class FindDisappearedNumbers
{
    public function transformFindDisappearedNumbers(array $nums): array
    {
        $n = count($nums);
        if ($n === 0) {
            return [];
        }
        foreach ($nums as $value) {
            $index = abs($value) - 1;
            if ($nums[$index] > 0) {
                $nums[$index] = -$nums[$index];
            }
        }
        $missing = [];
        for ($i = 0; $i < $n; $i++) {
            if ($nums[$i] > 0) {
                $missing[] = $i + 1;
            }
        }

        return $missing;
    }

    public function solve(array $nums): array
    {
        return $this->transformFindDisappearedNumbers($nums);
    }
}
