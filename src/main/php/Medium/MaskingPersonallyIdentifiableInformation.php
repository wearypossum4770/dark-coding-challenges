<?php

declare(strict_types=1);

namespace Src\Medium;

class MaskingPersonallyIdentifiableInformation
{
    public function maskEmail(string $email): string
    {
        $domain = strpos($email, '@');
        $result = $email[0] . '*****' . $email[$domain - 1] . substr($email, $domain);

        return strtolower($result);
    }

    public function maskPhone(string $phone): string
    {
        $result = [];
        $count = 0;
        $chars = 0;
        for ($i = strlen($phone) - 1; $i >= 0; $i--) {
            if (! ctype_digit($phone[$i])) {
                continue;
            }
            if ($count === 4 || $count === 8 || $count === 12) {
                $result[] = '-';
                $count++;
            }
            if ($count <= 4) {
                $result[] = $phone[$i];
            } else {
                $result[] = '*';
            }
            $count++;
            $chars++;
        }
        if ($chars > 10) {
            $result[] = '+';
        }

        return implode('', array_reverse($result));
    }

    public function solve(string $s): string
    {
        if (str_contains($s, '@')) {
            return $this->maskEmail($s);
        }

        return $this->maskPhone($s);
    }
}
