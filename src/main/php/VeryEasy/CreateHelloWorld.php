<?php

declare(strict_types=1);

namespace Src\VeryEasy;

class CreateHelloWorld
{
    public function createHelloWorld()
    {
        return function (...$args) {
            return 'Hello World';
        };
    }
}
