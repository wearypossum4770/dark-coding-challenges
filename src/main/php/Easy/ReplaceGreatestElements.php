<?php

declare(strict_types=1);

namespace Src\Easy;

class ReplaceGreatestElements
{
    public function transformReplaceGreatestElements(array $arr): array
    {
        $max = -1;
        for ($i = count($arr) - 1; $i >= 0; $i--) {
            $temp = $arr[$i];
            $arr[$i] = $max;
            if ($temp > $max) {
                $max = $temp;
            }
        }

        return $arr;
    }

    public function solve(array $arr): array
    {
        return $this->transformReplaceGreatestElements($arr);
    }
}
