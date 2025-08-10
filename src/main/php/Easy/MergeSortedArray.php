<?php

declare(strict_types=1);

namespace Src\Easy;

class MergeSortedArray
{
    public function transformMergeSortedArrayInPlace(array &$nums1, int &$m, array $nums2, int &$n)
    {
        $k = $m + $n -1;
				$m--;
				$n--;
        while ($m >= 0 && $n >= 0) {
            if ($nums1[$m] >= $nums2[$n]) {
                $nums1[$k] = $nums1[$m];
                $m--;
            } else {
                $nums1[$k] = $nums2[$n];
                $n--;
            }
            $k--;
        }
        while ($n >= 0) {
            $nums1[$k] = $nums2[$n];
            $n--;
            $k--;
        }

    }

}
