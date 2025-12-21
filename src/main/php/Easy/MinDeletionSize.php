<?php

declare(strict_types=1);

namespace Src\Easy;

class MinDeletionSize
{
    /**
     * @param  string[]  $strs
     */
    public function solve(array $strs): int
    {
        $count = 0;
        $rows = count($strs);
        $cols = strlen($strs[0]);
        for ($col = 0; $col < $cols; $col++) {
            $row = 1;
            while ($row < $rows) {
                if ($strs[$row - 1][$col] > $strs[$row][$col]) {
                    $count++;
                    break;
                }
                $row++;
            }
        }

        return $count;
    }
}
