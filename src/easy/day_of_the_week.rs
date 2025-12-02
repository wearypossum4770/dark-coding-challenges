pub fn day_of_the_week(day: i32, month: i32, year: i32) -> String {
    let offset = vec![0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
    let day_names = vec![
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
    ];
    let mut y = year;
    if month < 3 {
        y -= 1;
    }
    let modifier = offset[month as usize - 1];
    let index = y + y / 4 - y / 100 + y / 400 + modifier + day;
    day_names.get(index as usize % 7).unwrap().to_string()
}
