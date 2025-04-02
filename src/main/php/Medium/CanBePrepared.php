<?php

declare(strict_types=1);

namespace Src\Medium;

class CanBePrepared
{
    public function transformCanBePrepared(string $recipe, array $ingredients): bool
    {
        if (empty($recipe) || empty($ingredients)) {
            return false;
        }
        $outer = [];
        $inner = [];
        $ingredientSet = array_flip($ingredients);
        foreach (str_split($recipe) as $piece) {
            if (ctype_alpha($piece)) {
                $inner[] = $piece;
            } elseif ($piece === '|' || $piece === '(') {
                if (! empty($inner)) {
                    $outer[] = array_reduce($inner, function ($carry, $ingredient) use ($ingredientSet) {
                        return $carry && isset($ingredientSet[$ingredient]);
                    }, true);
                    $inner = [];
                }
            }
        }
        if (! empty($inner)) {
            $outer[] = array_reduce($inner, function ($carry, $ingredient) use ($ingredientSet) {
                return $carry && isset($ingredientSet[$ingredient]);
            }, true);
        }

        return in_array(true, $outer);
    }

    public function solve(string $recipe, array $ingredients): bool
    {

        return $this->transformCanBePrepared($recipe, $ingredients);
    }
}
