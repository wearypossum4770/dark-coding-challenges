<?php

declare(strict_types=1);

namespace Src\Easy;

class ArrayContainsDuplicate
{
    public function transformArrayContainsDuplicate(array $nums): bool
    {
        $seen = [];
        for ($i = 0; $i < count($nums); $i++) {
            if (isset($seen[$nums[$i]])) {
                return true;
            }
            $seen[$nums[$i]] = true;
        }

        return false;
    }

    public function solve(array $nums): bool
    {
        return $this->transformArrayContainsDuplicate($nums);
    }
}
