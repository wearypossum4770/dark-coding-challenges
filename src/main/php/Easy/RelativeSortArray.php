<?php

declare(strict_types=1);

namespace Src\Easy;

class RelativeSortArray
{
    public function transformRelativeSortArray() {}

    public function solve(array $arr1, array $arr2): array
    {
        $freq = array_count_values($arr1);
        $result = array_fill(0, count($arr1), 0);
        $index = 0;
        foreach ($arr2 as $value) {
            $count = $freq[$value] ?? 0;
            while ($count > 0) {
                $count--;
                $result[$index++] = $value;
            }
            unset($freq[$value]);
        }
        ksort($freq);
        foreach ($freq as $key => $value) {
            while ($value > 0) {
                $result[$index++] = $key;
                $value--;
            }
        }

        return $result;
    }
}
