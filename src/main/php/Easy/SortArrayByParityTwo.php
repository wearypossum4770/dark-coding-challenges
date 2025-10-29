<?php

declare(strict_types=1);

namespace Src\Easy;

class SortArrayByParityTwo
{
    /**
     * @param  int[]  $nums
     * @return int[]
     */
    public function transformSortArrayByParityTwo(array $nums): array
    {
        $result = array_fill(0, count($nums), 0);
        $even = 0;
        $odd = 1;
        foreach ($nums as $value) {
            if ($value % 2 === 0) {
                $result[$even] = $value;
                $even += 2;
            } else {
                $result[$odd] = $value;
                $odd += 2;
            }

        }

        return $result;
    }

    public function solve(array $nums): array
    {
        return $this->transformSortArrayByParityTwo($nums);
    }
}
