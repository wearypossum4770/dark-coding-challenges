<?php

declare(strict_types=1);

namespace Src\Easy;

class RemoveDuplicateZeros
{
    public function transformRemoveDuplicateZeros(array &$arr): void
    {
        $left = 0;
        $right = count($arr) - 1;
        while ($left <= $right) {
            if ($arr[$left] === 0) {
                $r = $right;
                while ($r > $left) {
                    $arr[$r] = $arr[$r - 1];
                    $r--;
                }
                $left++;
            }
            $left++;
        }
    }

    public function solve(array &$arr): void
    {
        $this->transformRemoveDuplicateZeros($arr);
    }
}
