const std = @import("std");
const platform = @import("builtin").target.os.tag;

const _target = std.zig.CrossTarget{
    .abi = if (platform == .linux) .musl else null,
    .cpu_model = .native,
    .os_tag = platform,
    .cpu_arch = null,
};

pub fn build(b: *std.Build) anyerror!void {
    const target = b.standardTargetOptions(.{ .default_target = _target });
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .root_source_file = .{ .cwd_relative = "source/main.zig" },
        .optimize = optimize,
        .target = target,
        .name = "hyper",
    });

    b.installArtifact(exe);
}
