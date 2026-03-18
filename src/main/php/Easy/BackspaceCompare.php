<?php

declare(strict_types=1);

namespace Src\Easy;

class BackspaceCompare
{
    public function process(string $text): string
    {
        $result = [];
        for ($i = 0; $i < strlen($text); $i++) {
            if ($text[$i] === '#') {
                if (! empty($result)) {
                    array_pop($result);
                }

            } else {
                $result[] = $text[$i];
            }
        }

        return implode('', $result);
    }

    public function solve(string $s, string $t): bool
    {
        return $this->process($s) === $this->process($t);
    }
}
