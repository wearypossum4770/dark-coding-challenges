<?php

declare(strict_types=1);

namespace Src\Easy;

class MergeSortedArray
{
    public function transformMergeSortedArrayInPlace(array &$nums1, int &$m, array $nums2, int &$n)
    {
        $k = $m + $n - 1;
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

    public function transformMergeSortedArray(array $nums1, int $m, array $nums2, int $n)
    {
        $i = 0;
        $j = 0;
        $k = 0;
        $result = array_fill(0, $m + $n, 0);
        while ($i < $m && $j < $n) {
            if ($nums1[$i] <= $nums2[$j]) {
                $result[$k] = $nums1[$i];
                $i++;
            } else {
                $result[$k] = $nums2[$j];
                $j++;
            }
            $k++;
        }
        while ($i < $m) {
            $result[$k] = $nums1[$i];
            $i++;
            $k++;
        }
        while ($j < $n) {
            $result[$k] = $nums2[$j];
            $j++;
            $k++;
        }

        return $result;
    }

    public function solve(array $nums1, int $m, array $nums2, int $n): array
    {
        return $this->transformMergeSortedArray($nums1, $m, $nums2, $n);
    }
}
