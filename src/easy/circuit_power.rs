pub fn circuit_power(voltage: i32, current: i32) -> i32 {
    voltage * current
}
#[cfg(test)]
mod tests {
    use super::circuit_power;
    #[test]
    fn test_circuit_power() {
        assert_eq!(circuit_power(110, 3), 330);
        assert_eq!(circuit_power(230, 10), 2300);
        assert_eq!(circuit_power(480, 20), 9600);
    }
}
