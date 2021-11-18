(* ::Package:: *)

Switch[$OperatingSystem,
  "MacOSX", (* Compilation settings for OS X *)
  {
	"CompileOptions" -> {" -DMKL_ILP64 -m64"}
	, "LinkerOptions"->{}
    , "IncludeDirectories" -> {}
    , "LibraryDirectories" -> {}
 },

  "Unix", (* Compilation settings for Linux *)
  {
	"CompileOptions" -> {" -DMKL_ILP64 -m64"}
	, "LinkerOptions"->{}
    , "IncludeDirectories" -> {}
    , "LibraryDirectories" -> {}
  },

  "Windows", (* Compilation settings for Windows *)
  {
    "CompileOptions" -> {"/EHsc", "/wd4244", "/DNOMINMAX", " /DMKL_ILP64"}
	, "LinkerOptions"->{}
    , "IncludeDirectories" -> {}
    , "LibraryDirectories" -> {}
  }
]
