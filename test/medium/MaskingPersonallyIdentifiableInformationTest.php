<?php

declare(strict_types=1);

use Src\Medium\MaskingPersonallyIdentifiableInformation;

dataset('maskingPersonallyIdentifiableInformationData', [
    ['LeetCode@LeetCode.com', 'l*****e@leetcode.com'],
    ['ABracadabraB@qq.com', 'a*****b@qq.com'],
    ['applesnap@b.com', 'a*****p@b.com'],
    ['John.Doe@Example.COM', 'j*****e@example.com'],
    ['XanaxAlprazolam@Y.Z', 'x*****m@y.z'],
    ['1234567890', '***-***-7890'],
    ['1(234)567-890', '***-***-7890'],
    ['86-(10)12345678', '+**-***-***-5678'],
    ['+86(88)1513-7-74', '+*-***-***-3774'],
    ['(123) 456 7890', '***-***-7890'],
    ['123-45-67890', '***-***-7890'],
    ['0000000000', '***-***-0000'],
    ['+000000000000', '+**-***-***-0000'],
    ['Zatarans@Z.Z', 'z*****s@z.z'],
]);
it('solve', function (string $s, string $expected) {
    $instance = new MaskingPersonallyIdentifiableInformation;

    $result = $instance->solve($s);

    expect($result)->toBe($expected);

})->with('maskingPersonallyIdentifiableInformationData');
