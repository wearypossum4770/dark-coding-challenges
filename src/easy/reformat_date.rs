pub fn reformat_date(date: String) -> String {
    let parts: Vec<&str> = date.split(" ").collect();
    let month = vec![
        "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
    ]
    .iter()
    .position(|&x| x == parts[1])
    .unwrap_or(0)
        + 1;
    let mut day: u32 = 0;
    for i in parts[0].chars() {
        if i.is_numeric() {
            day = day * 10 + i.to_digit(10).unwrap_or(0);
        }
    }
    format!("{}-{:0>2}-{:0>2}", parts[2], month, day)
}
