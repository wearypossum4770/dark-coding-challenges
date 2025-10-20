<?php

declare(strict_types=1);

namespace Src\Easy;

class FindLucky
{
    /**
     * @param  int[]  $arr
     */
 
    public function transformFindLucky(array $arr): int
    {

        $nums = array_fill(0, max($arr) + 1, 0);
        foreach ($arr as $value) {
            $nums[$value]++;
        }
        for ($i = count($nums) - 1; $i > 0; $i--) {
            if ($i === $nums[$i]) {
                return $i;
            }
        }

        return -1;
    }

    public function solve(array $nums): int
    {
        return $this->transformFindLucky($nums);
    }
}
