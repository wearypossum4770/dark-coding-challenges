offset = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
day_names = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
]


def day_of_the_week(day: int, month: int, year: int) -> str:

    modifier = offset[month - 1]
    if month < 3:
        year -= 1
    index = year + year // 4 - year // 100 + year // 400 + modifier + day
    return day_names[index % 7]
