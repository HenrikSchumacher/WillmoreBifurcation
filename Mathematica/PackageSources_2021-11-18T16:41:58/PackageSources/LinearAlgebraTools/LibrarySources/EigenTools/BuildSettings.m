(* ::Package:: *)

(*
See also https://software.intel.com/en-us/articles/intel-mkl-link-line-advisor 
for more details on compiler and linker options.
*)
Switch[$OperatingSystem,
  "MacOSX", (* Compilation settings for OS X *)
  {
	"CompileOptions" -> {" -Wall -DMKL_ILP64 -m64 -Xpreprocessor -fopenmp -march=native"}
	, "LinkerOptions"->{" -lmkl_intel_ilp64 -lmkl_core -lmkl_intel_thread -lpthread -lm -ldl -liomp5"}
    , "IncludeDirectories" -> {$EigenIncludeDirectory, $OpenMPIncludeDirectory}
    , "LibraryDirectories" -> {FileNameJoin[{$InstallationDirectory,"SystemFiles","Libraries",$SystemID}]}
 },

  "Unix", (* Compilation settings for Linux *)
  {
	"CompileOptions" -> {" -Wall -DMKL_ILP64 -m64 -fopenmp -march=native"}
	, "LinkerOptions"->{" -lmkl_intel_ilp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl"}
    , "IncludeDirectories" -> {$EigenIncludeDirectory, $OpenMPIncludeDirectory}
    , "LibraryDirectories" -> {FileNameJoin[{$InstallationDirectory,"SystemFiles","Libraries",$SystemID}]}
  },

  "Windows", (* Compilation settings for Windows *)
  {
    "CompileOptions" -> {"/EHsc", "/wd4244", "/DNOMINMAX", "/DMKL_ILP64","/arch:AVX"}
	, "LinkerOptions"->{" mkl_intel_ilp64_dll.lib mkl_intel_thread_dll.lib mkl_core_dll.lib libiomp5md.lib"}
    , "IncludeDirectories" -> {$EigenIncludeDirectory, $OpenMPIncludeDirectory}
    , "LibraryDirectories" -> {
        "C:\\Program Files (x86)\\Intel\\oneAPI\\mkl\\latest\\lib\\intel64",
        "C:\\Program Files (x86)\\Intel\\oneAPI\\compiler\\latest\\windows\\compiler\\lib\\intel64_win",
        FileNameJoin[{$InstallationDirectory,"SystemFiles","Libraries",$SystemID}]}
  }
]
