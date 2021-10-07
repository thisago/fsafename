import std/unittest
import ./secureNamedFs

suite "secureNamedFs":
  test "Can say":
    const msg = "Hello from secureNamedFs test"
    check msg == say msg
