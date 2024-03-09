const expectEqual = @import("std").testing.expectEqual;

pub fn framesPerSecond(minutes: i32, fps: i32) i32 {
    return minutes * 60 * fps;
}
test "Frames in a given time frame" {
    try expectEqual(framesPerSecond(1, 1), 60);
    try expectEqual(framesPerSecond(10, 1), 600);
    try expectEqual(framesPerSecond(10, 25), 15_000);
    try expectEqual(framesPerSecond(500, 60), 1_800_000);
    try expectEqual(framesPerSecond(0, 60), 0);
    try expectEqual(framesPerSecond(99, 1), 5_940);
    try expectEqual(framesPerSecond(419, 70), 1_759_800);
    try expectEqual(framesPerSecond(52, 33), 102_960);
}
