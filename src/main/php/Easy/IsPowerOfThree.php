<?php declare(strict_types=1);

namespace Src\Easy;
class IsPowerOfThree {
public function transformIsPowerOfThree(int $n): bool {
  return $n > 0 && 1162261467 % $n === 0;
}
public function solve(int $n): bool
{
return $this->transformIsPowerOfThree($n);
}

}