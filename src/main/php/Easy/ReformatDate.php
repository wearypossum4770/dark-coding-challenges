<?php

declare(strict_types=1);

namespace Src\Easy;

class ReformatDate
{
    public function solve(string $date): string
    {

        $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        $parts = explode(' ', $date);
        $month = array_search($parts[1], $months) + 1;
        $day = 0;
        foreach (str_split($parts[0]) as $char) {
            if ($char >= '0' && $char <= '9') {
                $day = $day * 10 + ($char - '0');
            }
        }

        return sprintf('%s-%02d-%02d', $parts[2], $month, $day);
    }
}
