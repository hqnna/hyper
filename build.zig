const std = @import("std");

pub fn build(b: *std.Build) anyerror!void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .root_source_file = .{ .cwd_relative = "source/main.zig" },
        .optimize = optimize,
        .target = target,
        .name = "hyper",
    });

    b.installArtifact(exe);
}