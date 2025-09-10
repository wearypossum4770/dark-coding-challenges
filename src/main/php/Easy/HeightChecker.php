<?php

declare(strict_types=1);

namespace Src\Easy;

class HeightChecker
{
    public function transformHeightChecker(array $heights): int
    {
        $count = 0;
        $arr = [...$heights];
        sort($arr);
        foreach ($heights as $i => $value) {
            if ($arr[$i] !== $heights[$i]) {
                $count++;
            }
        }

        return $count;
    }

    public function solve(array $heights): int
    {
        return $this->transformHeightChecker($heights);
    }
}
