<?php

declare(strict_types=1);

namespace Src\Easy;

class StudentMinimumMovesToSeat
{
    /**
     * @param  int[]  $seats
     * @param  int[]  $students
     */
    public function solve(array $seats, array $students): int
    {
        sort($seats);
        sort($students);
        $moves = 0;
        foreach ($seats as $i => $seat) {
            $moves += abs($seat - $students[$i]);
        }

        return $moves;
    }
}
