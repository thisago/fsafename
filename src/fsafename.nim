when isMainModule:
  from pkg/util/forFs import escapeFs
  from std/os import walkDir, pcDir, moveFile, pcFile, moveDir,
                    moveFile, splitFile, `/`
  from std/terminal import styledWriteLine, styledEcho, fgGreen,
                          fgDefault, styleDim, resetStyle

  proc main(dirs: seq[string]) =
    ## Automatically sanitize the files and directories names
    for dir in dirs:
      for pc in dir.walkDir:
        let
          splitted = splitFile pc.path
          name = splitted.name
          validName = escapeFs name
        if name != validName:
          styledEcho fgGreen, "Renaming '",
            fgDefault, styleDim, name,
            resetStyle, fgGreen, "' to '",
            fgDefault, validName,
            fgGreen, "'"
        case pc.kind:
        of pcFile:
          if name != validName:
            moveFile(splitted.dir / name, splitted.dir / validName)
        of pcDir:
          main(@[pc.path])
          if name != validName:
            moveDir(splitted.dir / name, splitted.dir / validName)
        else: discard
  import cligen
  dispatch main
