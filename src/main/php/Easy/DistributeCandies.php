<?php

declare(strict_types=1);

namespace Src\Easy;

class DistributeCandies
{
    public function transformDistributeCandies(array $candyType): int
    {
        return min(count($candyType) / 2, count(array_unique($candyType)));
    }

    public function solve(array $candyType): int
    {
        return $this->transformDistributeCandies($candyType);
    }
}
