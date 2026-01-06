months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
]


def reformat_date(date: str) -> str:
    d, m, year = date.split(" ")
    month = months.index(m) + 1
    day = 0
    for i in d:
        if i.isnumeric():
            day = day * 10 + int(i)
    return f"{year}-{month:02d}-{day:02d}"
