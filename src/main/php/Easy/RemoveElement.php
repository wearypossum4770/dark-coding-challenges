<?php

declare(strict_types=1);

namespace Src\Easy;

class RemoveElement
{
    public function transformRemoveElement(array &$nums, int $tar): int
    {
        $i = 0;
        foreach ($nums as $num) {
            if ($num != $tar) {
                $nums[$i++] = $num;
            }
        }

        return $i;
    }

    public function solve(array &$nums, int $tar): int
    {
        return $this->transformRemoveElement($nums, $tar);
    }
}
