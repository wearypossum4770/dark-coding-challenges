<?php

declare(strict_types=1);

namespace Src\Medium;

class Bucket
{
    public int $num;
    public int $count = 0;

    /**
     * Class constructor.
     */
    public function __construct(int $num)
    {
        $this->num = $num;
    }
}
class TopFrequentElements
{
    /**
     * @param  int[]  $nums
     * @return int[]
     */
    public function solve(array $nums, int $k): array
    {
        $buckets = [];
        foreach ($nums as $num) {
            if (! isset($buckets[$num])) {
                $buckets[$num] = new Bucket($num);
            }
            $buckets[$num]->count++;
        }
        uasort($buckets, fn ($a, $b) => $b->count - $a->count);

        return array_slice(array_keys($buckets), 0, $k);
    }
}
