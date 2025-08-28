<?php

declare(strict_types=1);

namespace Src\Easy;

class RemoveArrayDuplicates
{
    public function transformRemoveArrayDuplicates(array &$nums): int
    {
        $count = 0;
        foreach ($nums as $n) {
            if ($nums[$count] != $n) {
                $nums[++$count] = $n;
            }
        }

        return $count + 1;
    }

    public function solve(array &$nums): int
    {
        return $this->transformRemoveArrayDuplicates($nums);
    }
}
