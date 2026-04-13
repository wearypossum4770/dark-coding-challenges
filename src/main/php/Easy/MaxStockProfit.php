<?php declare(strict_types=1);

namespace Src\Easy;
class MaxStockProfit {
    /**
     * @param Integer[] $prices
     * @return Integer
     */

public function solve(array $prices): int
{
	$min =  $prices[0];
	$max = $min - $min;
	foreach($prices as $price) {
		$min = min($min, $price);
		$max = max($max, $price - $min);
	}
return $max;
}

}