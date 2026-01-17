<?php

declare(strict_types=1);

namespace Src\Medium;

class SmallestTrimmedNumbers
{
    /**
     * @param  string[]  $nums
     * @param  int[][]  $queries
     * @return int[]
     */
    public function solve(array $nums, array $queries): array
    {
        $result = [];
        foreach ($queries as $query) {
            $rank = $query[0];
            $digit = $query[1];
            $trimmed = array_map(function ($value, $index) use ($digit) {
                $start = max(strlen($value) - $digit, 0);

                return ['index' => $index, 'value' => substr($value, $start)];
            }, $nums, array_keys($nums));
            usort($trimmed, function ($lhs, $rhs) {
                $cmp = strcmp($lhs['value'], $rhs['value']);
                if ($cmp !== 0) {
                    return $cmp;
                }

                return $lhs['index'] <=> $rhs['index'];
            });
            $result[] = $trimmed[$rank - 1]['index'];
        }

        return $result;
    }
}
