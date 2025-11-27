<?php

declare(strict_types=1);

namespace Src\Easy;

class FinalPricesWithDiscount
{
    /**
     * @param  int[]  $prices
     * @return int[]
     */
    public function solve(array $prices): array
    {
        $result = [...$prices];
        for ($i = 0; $i < count($prices); $i++) {
            for ($j = $i + 1; $j < count($prices); $j++) {
                if ($prices[$j] <= $prices[$i]) {
                    $result[$i] = $prices[$i] - $prices[$j];
                    break;
                }
            }
        }

        return $result;
    }
}
