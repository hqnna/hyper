const std = @import("std");

pub fn main() std.fs.File.WriteError!void {
    try std.io.getStdOut().writeAll("hello world\n");
}
