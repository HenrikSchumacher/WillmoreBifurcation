(* ::Package:: *)

(*
See also https://software.intel.com/en-us/articles/intel-mkl-link-line-advisor 
for more details on compiler and linker options.
*)
Switch[$OperatingSystem,
  "MacOSX", (* Compilation settings for OS X *)
  {
	"CompileOptions" -> {
	(*" -Wall"*)
	"-mmacosx-version-min=10.15"
	,"-std=c++17"
	," -O3"
	,"-DMKL_ILP64 -m64 -Xpreprocessor -fopenmp -fopenmp-simd -march=native"
	}
	,"LinkerOptions"->{" -lmkl_intel_ilp64 -lmkl_core -lmkl_intel_thread -lpthread -lm -ldl -liomp5"}
	(*,"LinkerOptions"->{"-lpardiso600-MACOS-X86-64","-lm","-ldl"}*)
    ,"IncludeDirectories" -> {}
    (*,"LibraryDirectories" -> {"/Users/Henrik/OwnCloud/Mathematica/PackageSources/PMTools/lib"}*)
    ,"LibraryDirectories" -> {FileNameJoin[{$InstallationDirectory,"SystemFiles","Libraries",$SystemID}]}
    ,"ShellOutputFunction" -> Print
 }
 ,"Unix", (* Compilation settings for Linux *)
  {
	"CompileOptions" -> {" -DMKL_ILP64"}
	, "LinkerOptions"->{" -lmkl_intel_ilp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl"}
    , "IncludeDirectories" -> {}
    , "LibraryDirectories" -> {FileNameJoin[{$InstallationDirectory,"SystemFiles","Libraries",$SystemID}]}
    ,"ShellOutputFunction" -> Print
  }
  ,"Windows", (* Compilation settings for Windows *)
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
