def mask_phone(phone: str) -> str:
    count, chars, buffer = 0, 0, []
    for char in phone[::-1]:
        if char.isnumeric():
            if count == 4 or count == 8 or count == 12:
                buffer.append("-")
                count += 1
            if count < 4:
                buffer.append(char)
            else:
                buffer.append("*")
            chars += 1
            count += 1
    if chars > 10:
        buffer.append("+")
    return "".join(buffer)[::-1]


def mask_email(email: str) -> str:
    domain = email.index("@")
    return f"{email[0]}*****{email[domain - 1]}{email[domain::]}".lower()


def masking_personally_identifiable_information(s: str) -> str:
    if s.__contains__("@"):
        return mask_email(s)

    return mask_phone(s)
