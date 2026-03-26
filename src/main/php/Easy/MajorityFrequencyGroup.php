<?php

declare(strict_types=1);

namespace Src\Easy;

class MajorityFrequencyGroup
{
    public function solve(string $s): string
    {
        $freq = [];
        $entries = [];
        foreach (str_split($s) as $char) {
            $freq[$char] = ($freq[$char] ?? 0) + 1;
        }
        foreach ($freq as $key => $value) {
            $entries[$value] = ($entries[$value] ?? '') . $key;
        }
        uksort($entries, function ($a, $b) use ($entries) {
            $c = strlen($entries[$a]);
            $d = strlen($entries[$b]);

            return ($c != $d) ? $d - $c : $b - $a;
        });

        return reset($entries);
    }
}
