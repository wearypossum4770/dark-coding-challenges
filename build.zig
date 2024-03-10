const std = @import("std");
const builtin = @import("builtin");
const tests = @import("test/tests.zig");

const Build = std.Build;
const CompileStep = Build.CompileStep;
const Step = Build.Step;
const Child = std.process.Child;

const assert = std.debug.assert;
const join = std.fs.path.join;
const print = std.debug.print;
const Kind = enum {
    /// Run the artifact as a normal executable.
    exe,
    /// Run the artifact as a test.
    @"test",
};
pub const Exercise = struct {
    hint: ?[]const u8 = null,
    /// This exercise kind.
    kind: Kind = .exe,

    /// This exercise is not supported by the current Zig compiler.
    skip: bool = false,

    pub fn name(self: Exercise) []const u8 {
        return std.fs.path.stem(self.main_file);
    }
};
/// Build mode.
const Mode = enum {
    /// Normal build mode: `zig build`
    normal,
    /// Named build mode: `zig build -Dn=n`
    named,
};
pub const logo =
    \\  '########:::::'###::::'########::'##:::'##:::::'######:::'#######::'########::'####:'##::: ##::'######:::::::'######::'##::::'##::::'###::::'##:::::::'##:::::::'########:'##::: ##::'######:::'########::'######::
    \\   ##.... ##:::'## ##::: ##.... ##: ##::'##:::::'##... ##:'##.... ##: ##.... ##:. ##:: ###:: ##:'##... ##:::::'##... ##: ##:::: ##:::'## ##::: ##::::::: ##::::::: ##.....:: ###:: ##:'##... ##:: ##.....::'##... ##:
    \\   ##:::: ##::'##:. ##:: ##:::: ##: ##:'##:::::: ##:::..:: ##:::: ##: ##:::: ##:: ##:: ####: ##: ##:::..:::::: ##:::..:: ##:::: ##::'##:. ##:: ##::::::: ##::::::: ##::::::: ####: ##: ##:::..::: ##::::::: ##:::..::
    \\   ##:::: ##:'##:::. ##: ########:: #####::::::: ##::::::: ##:::: ##: ##:::: ##:: ##:: ## ## ##: ##::'####:::: ##::::::: #########:'##:::. ##: ##::::::: ##::::::: ######::: ## ## ##: ##::'####: ######:::. ######::
    \\   ##:::: ##: #########: ##.. ##::: ##. ##:::::: ##::::::: ##:::: ##: ##:::: ##:: ##:: ##. ####: ##::: ##::::: ##::::::: ##.... ##: #########: ##::::::: ##::::::: ##...:::: ##. ####: ##::: ##:: ##...:::::..... ##:
    \\   ##:::: ##: ##.... ##: ##::. ##:: ##:. ##::::: ##::: ##: ##:::: ##: ##:::: ##:: ##:: ##:. ###: ##::: ##::::: ##::: ##: ##:::: ##: ##.... ##: ##::::::: ##::::::: ##::::::: ##:. ###: ##::: ##:: ##:::::::'##::: ##:
    \\   ########:: ##:::: ##: ##:::. ##: ##::. ##::::. ######::. #######:: ########::'####: ##::. ##:. ######::::::. ######:: ##:::: ##: ##:::: ##: ########: ########: ########: ##::. ##:. ######::: ########:. ######::
    \\   ........:::..:::::..::..:::::..::..::::..::::::......::::.......:::........:::....::..::::..:::......::::::::......:::..:::::..::..:::::..::........::........::........::..::::..:::......::::........:::......:::
    \\
    \\   Dark Coding Challenges
    \\
;
pub fn build(b: *std.build.Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("dark-coding-challenges", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const exe_tests = b.addTest("src/main.zig");
    exe_tests.setTarget(target);
    exe_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&exe_tests.step);
}
