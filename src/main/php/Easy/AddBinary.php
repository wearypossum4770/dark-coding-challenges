<?php declare(strict_types=1);

namespace Src\Easy;
class AddBinary {
public function transformAddBinary(string $a, string $b): string {
    $lenA = strlen($a);
    $lenB = strlen($b);
    $maxLen = max($lenA, $lenB);
    $res = array_fill(0, $maxLen + 1, '0'); // preallocate array
    $i = $lenA - 1;
    $j = $lenB - 1;
    $k = $maxLen;
    $carry = 0;

    while ($i >= 0 || $j >= 0 || $carry > 0) {
        $sum = $carry;
        if ($i >= 0) $sum += ord($a[$i--]) - ord('0');
        if ($j >= 0) $sum += ord($b[$j--]) - ord('0');

        $res[$k--] = chr(($sum % 2) + ord('0'));
        $carry = intdiv($sum, 2);
    }

    // Skip leading zeros
    $start = $k + 1;
    return implode('', array_slice($res, $start));

}
public function solve(string $a, string $b): string
{
return $this->transformAddBinary($n);
}

}