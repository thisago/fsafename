## Main module of secureNamedFs

from std/os import walkDir, pcDir, moveFile, pcFile, moveDir,
                   moveFile, splitFile, `/`
from std/terminal import styledWriteLine, styledEcho, fgGreen,
                         fgDefault, styleDim, resetStyle

const InvalidFilename = {'/','\\',':','*','?','"','<','>'}
proc secureName*(str: string): string =
  for ch in str:
    if ch notin InvalidFilename:
      result.add ch

proc main(dirs: seq[string]) =
  for dir in dirs:
    for pc in dir.walkDir:
      let
        splitted = splitFile pc.path
        name = splitted.name
        validName = secureName name
      if name == validName:
        continue
      styledEcho fgGreen, "Renaming '",
        fgDefault, styleDim, name,
        resetStyle, fgGreen, "' to '",
        fgDefault, validName,
        fgGreen, "'"
      case pc.kind:
      of pcFile:
        moveFile(splitted.dir / name, splitted.dir / validName)
      of pcDir:
        moveDir(splitted.dir / name, splitted.dir / validName)
        main(@[splitted.dir / validName])
      else: discard

when isMainModule:
  import cligen
  dispatch main
