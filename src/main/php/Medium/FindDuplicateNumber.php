<?php

declare(strict_types=1);

namespace Src\Medium;

class FindDuplicateNumber
{
    public function solve(array $nums): int
    {
        $result = array_fill(0, count($nums), 0);
        for ($i = 0; $i < count($nums); $i++) {
            if ($result[$nums[$i] - 1] > 0) {
                return $nums[$i];
            }
            $result[$nums[$i] - 1]++;
        }

        return 0;
    }
}
