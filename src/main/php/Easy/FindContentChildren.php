<?php

declare(strict_types=1);

namespace Src\Easy;

class FindContentChildren
{
    public function transformFindContentChildren(array $children, array $cookies): int
    {
        sort($children);
        sort($cookies);
        $i = 0;
        $j = 0;
        while ($i < count($children) && $j < count($cookies)) {
            if ($cookies[$j] >= $children[$i]) {
                $i += 1;
            }
            $j += 1;
        }

        return $i;
    }

    public function solve(array $children, array $cookies): int
    {
        return $this->transformFindContentChildren($children, $cookies);
    }
}
