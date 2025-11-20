<?php

declare(strict_types=1);

namespace Src\Medium;

class ArrayStack
{
    /**
     * @param  int[]  $target
     * @return string[]
     */
    public function solve(array $target, int $n): array
    {
        $result = [];
        $index = 0;
        $counter = 1;
        while ($index < count($target)) {
            $result[] = 'Push';
            if ($target[$index] == $counter) {
                $index++;
            } else {
                $result[] = 'Pop';
            }
            $counter++;
        }

        return $result;
    }
}
