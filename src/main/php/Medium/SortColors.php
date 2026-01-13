<?php

declare(strict_types=1);

namespace Src\Medium;

class SortColors
{
    public function solve(array &$nums)
    {
        $freq = array_count_values($nums);
        $index = 0;
        for ($i = 0; $i < 3; $i++) {
            $count = $freq[$i];
            while ($count-- > 0) {
                $nums[$index++] = $i;
            }
        }
    }
}
