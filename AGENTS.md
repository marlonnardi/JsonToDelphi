# JsonToDelphi project notes

Also consider the global notes in `C:\Desenvolvimento\AGENTS.md`.

## Delphi build environment

- Default Delphi build: Delphi 12 Athens / BDS 23.0 / CompilerVersion 36 / VER360.
- Use Delphi 13 Florence / BDS 37.0 / CompilerVersion 37 / VER370 only for Android builds or when explicitly requested.
- This uniGUI web project is hosted/published as an ISAPI DLL on IIS. For publication builds, keep `UNIGUI_DLL` enabled in `unigui\JsonToDelphi.dpr` and compile the DLL output.
- Preserve `.dproj` changes when they occur; review them normally with the rest of the modified Delphi files.
- Keep created or modified Delphi files (`.pas`, `.dfm`, `.dpr`, `.dproj`, `.inc`) encoded as UTF-8 with BOM and CRLF line endings.
