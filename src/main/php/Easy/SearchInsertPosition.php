<?php

declare(strict_types=1);

namespace Src\Easy;

class SearchInsertPosition
{
    public function transformSearchInsertPosition(array $nums, int $target): int {
			$left= 0;
			$right =  count($nums);
			while($left <= $right) {
				$mid = intdiv($left + ($right - $left), 2);
				if($nums[$mid] == $target) return $mid;
				if($nums[$mid] < $target) {
					$left = $mid + 1;
				}else {
					$right = $mid - 1;
				}
			}

			return $left;
		}

    public function solve(array $nums, int $target): int
    {
        return $this->transformSearchInsertPosition($n);
    }
}
