<?php

declare(strict_types=1);

namespace Src\Easy;

class DayOfTheWeek
{
    public function solve(int $day, int $month, int $year): string
    {
        $days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        $t = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
        $y = $month < 3 ? $year - 1 : $year;

        $index = ($y + (int) ($y / 4) - (int) ($y / 100) + (int) ($y / 400) + $t[$month - 1] + $day) % 7;

        return $days[$index];
    }
}
