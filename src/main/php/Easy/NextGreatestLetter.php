<?php

declare(strict_types=1);

namespace Src\Easy;

class NextGreatestLetter
{
    /**
     * @param  string[]  $letters
     */
    public function solve(array $letters, string $target): string
    {
        foreach ($letters as $char) {
            if ($target < $char) {
                return $char;
            }
        }

        return $letters[0];
    }
}
