<?php

declare(strict_types=1);

namespace Src\Medium;

class SortArray
{
    public function solve(array $nums): array
    {
        if (empty($nums)) {
            return [];
        }
        $freq = array_count_values($nums);
        $result = array_fill(0, count($nums), 0);
        $max = max($nums);
        $min = min($nums);
        $index = 0;
        for ($i = $min; $i <= $max; $i++) {
            $count = $freq[$i] ?? 0;
            while ($count-- > 0) {
                $result[$index++] = $i;
            }
        }

        return $result;
    }
}
