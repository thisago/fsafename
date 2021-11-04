# Changelog

## Version 0.2.1 (11/04/2021)

- Reduced minimun Nim version to 1.0.0

---

## Version 0.2.0 **BREAKING CHANGE** (11/03/2021)

- Renamed project to `fsafename`
- Renamed some symbols
- Exported `fsafename.InvalidChars`
- CLI
  - Only import needed modules for CLI `when isMainModule`
  - Added a error when no path is provided
- Added todos
