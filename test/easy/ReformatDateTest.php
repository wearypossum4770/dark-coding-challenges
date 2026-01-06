<?php

declare(strict_types=1);

use Src\Easy\ReformatDate;

dataset('reformatDateData', [
    ['20th Oct 2052', '2052-10-20'],
    ['6th Jun 1933', '1933-06-06'],
    ['26th May 1960', '1960-05-26'],
    ['1st Jan 1900', '1900-01-01'],
    ['31st Dec 2100', '2100-12-31'],
    ['2nd Feb 2000', '2000-02-02'],
    ['3rd Mar 1999', '1999-03-03'],
    ['4th Apr 2010', '2010-04-04'],
    ['9th Sep 2021', '2021-09-09'],
    ['10th Oct 2020', '2020-10-10'],
    ['11th Nov 2011', '2011-11-11'],
    ['12th Dec 2012', '2012-12-12'],
    ['21st Aug 1987', '1987-08-21'],
    ['22nd Jul 1975', '1975-07-22'],
    ['23rd Mar 1965', '1965-03-23'],
    ['30th Apr 1990', '1990-04-30'],
    ['28th Feb 2001', '2001-02-28'],
    ['29th Feb 2000', '2000-02-29'],
    ['7th Jul 2007', '2007-07-07'],
    ['8th Aug 1988', '1988-08-08'],
]);
it('solve', function (string $date, string $expected) {
    $instance = new ReformatDate;

    $result = $instance->solve($date);

    expect($result)->toBe($expected);

})->with('reformatDateData');
