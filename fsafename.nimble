# Package

version       = "0.2.0"
author        = "Thiago Ferreira"
description   = "Renames to a valid name files and folders"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.5.1"
requires "cligen"

bin = @["fsafename"]
binDir = "build"
installExt = @["nim"]

task build_release, "Builds the release version":
  exec "nimble -d:release build"
task build_danger, "Builds the danger version":
  exec "nimble -d:danger build"
task gen_docs, "Generates the documentation":
  exec "nim doc --project --out:docs src/secureNamedFs.nim"
