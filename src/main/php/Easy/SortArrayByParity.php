<?php

declare(strict_types=1);

namespace Src\Easy;

class SortArrayByParity
{
    /**
     * @param  int[]  $nums
     * @return int[]
     */
    public function transformSortArrayByParity(array &$nums): array
    {
        $result = array_fill(0, count($nums), 0);
        $even = 0;
        $odd = count($nums) - 1;
        foreach ($nums as $key => $value) {
            if ($value % 2 === 0) {
                $result[$even++] = $value;
            } else {
                $result[$odd--] = $value;
            }
        }

        return $result;
    }

    public function solve(array &$nums): array
    {
        return $this->transformSortArrayByParity($nums);
    }
}
