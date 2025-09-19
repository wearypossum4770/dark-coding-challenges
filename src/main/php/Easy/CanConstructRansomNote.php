<?php

declare(strict_types=1);

namespace Src\Easy;

class CanConstructRansomNote
{
    public function transformCanConstructRansomNote(string $ransomNote, string $magazine): bool
    {
        $freq = [];
        for ($i = 0; $i < strlen($magazine); $i++) {
            $char = strtolower($magazine[$i]);
            $freq[$char] = ($freq[$char] ?? 0) + 1;
        }
        for ($i = 0; $i < strlen($ransomNote); $i++) {
            $char = strtolower($ransomNote[$i]);
            if (! isset($freq[$char]) || $freq[$char] === 0) {
                return false;
            }
            $freq[$char]--;
        }

        return true;
    }

    public function solve(string $ransomNote, string $magazine): bool
    {
        return $this->transformCanConstructRansomNote($ransomNote, $magazine);
    }
}
