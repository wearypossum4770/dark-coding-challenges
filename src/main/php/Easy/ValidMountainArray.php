<?php

declare(strict_types=1);

namespace Src\Easy;

class ValidMountainArray
{
  
    /**
     * @param Integer[] $arr
     * @return Boolean
     */
    public function transformValidMountainArray(array $arr): bool
    {
        $n = count($arr);
        if ($n < 3) {
            return false;
        }

        $i = 0;

        // Walk up
        while ($i + 1 < $n && $arr[$i] < $arr[$i + 1]) {
            $i++;
        }

        // Peak can't be first or last
        if ($i === 0 || $i === $n - 1) {
            return false;
        }

        // Walk down
        while ($i + 1 < $n && $arr[$i] > $arr[$i + 1]) {
            $i++;
        }

        return $i === $n - 1;
    }

    public function solve(array $arr): bool
    {
        return $this->transformValidMountainArray($arr);
    }
}
