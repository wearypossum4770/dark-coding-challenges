<?php

declare(strict_types=1);

namespace Src\Easy;

class IsAnagram
{
    public function transformIsAnagram(string $s, string $t): bool
    {
        if (strlen($s) != strlen($t)) {
            return false;
        }
        $charsDict = [];
        foreach (str_split($s) as $char) {
            $charsDict[$char] = ($charsDict[$char] ?? 0) + 1;
        }
        for ($i = 0; $i < strlen($t); $i++) {
            $char = $t[$i];
            if (! isset($charsDict[$char]) || $charsDict[$char] === 0) {
                return false;
            }
            $charsDict[$char]--;
        }

        return true;
    }

    public function solve(string $s, string $t): bool
    {
        return $this->transformIsAnagram($s, $t);
    }

    public function detectAnagram(string $word, array $candidates): array
    {
        $lowerWord = strtolower($word);
        $valid = [];
        foreach ($candidates as $candidate) {
            $lowerCandidate = strtolower($candidate);
            if ($lowerCandidate !== $lowerWord && $this->transformIsAnagram($lowerWord, $lowerCandidate)) {
                array_push($valid, $candidate);
            }
        }

        return $valid;
    }
}
