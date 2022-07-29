# Package

version       = "0.3.0"
author        = "Thiago Navarro"
description   = "Renames to a valid name files and folders"
license       = "MIT"
srcDir        = "src"
bin = @["fsafename"]
binDir = "build"
installExt = @["nim"]


# Dependencies

requires "nim >= 1.0.0"
requires "cligen"
requires "util"

task build_release, "Builds the release version":
  exec "nimble -d:release build"
task build_danger, "Builds the danger version":
  exec "nimble -d:danger build"
