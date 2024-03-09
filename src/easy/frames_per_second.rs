pub fn frames_per_second(minutes: i32, fps: i32) -> i32 {
    fps * (minutes * 60)
}
#[cfg(test)]
mod tests {
    use super::frames_per_second;
    #[test]
    fn test_frames_per_second() {
        assert_eq!(frames_per_second(1, 1), 60);
        assert_eq!(frames_per_second(10, 1), 600);
        assert_eq!(frames_per_second(10, 25), 15_000);
        assert_eq!(frames_per_second(500, 60), 1_800_000);
        assert_eq!(frames_per_second(0, 60), 0);
        assert_eq!(frames_per_second(99, 1), 5_940);
        assert_eq!(frames_per_second(419, 70), 1_759_800);
        assert_eq!(frames_per_second(52, 33), 102_960);
    }
}
