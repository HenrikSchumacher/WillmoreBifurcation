(* ::Package:: *)

ctx=NestWhile[StringJoin[RandomChoice[Alphabet[],12],"`"]&,"A`",MemberQ[Contexts[],#]&];
Off[General::shdw];
BeginPackage[ctx];
Uninstall[PM`$PM];
path=DirectoryName[$InputFileName];
Files0=Table[
FileNameJoin[{path,f}],
{f,{"PackageFunction.nb","Object.nb","CPackageFunction.nb","VerbatimRegion.nb","Helpers.nb"}}
];
PM`Private`$Runtime=True;
PM`Private`$Compiletime=True;

Do[
nb=(Get[file]/.{Cell[__,"Output",___]:>Cell[]}) /.{"MakeRegion"-> "Identity"};
Scan[ToExpression,Extract[nb,Position[nb,_BoxData]]],
{file,Files0}];

Files=Complement[
FileNames[FileNameJoin[{path,"*.nb"}]],
Join[Files0,{FileNameJoin[{path,"MakeFile.nb"}],FileNameJoin[{path,"MakePackageManager.nb"}]}]
];

Do[
nb=(Get[file]/.{Cell[__,"Output",___]:>Cell[]}) /.{"MakeRegion"-> "VerbatimRegion"};
Scan[ToExpression,Extract[nb,Position[nb,_BoxData]]],
{file,Files}];
$PM=Init[packagemanager,ParentDirectory[path]];
a=Packages[$PM][["PM"]];
If[FileExistsQ[InstallationPath[a]],DeleteDirectory[InstallationPath[a],DeleteContents->True]];
WritePackage[a];
CreateCallGraph[a,{}];
SelfUpdate[$PM];
EndPackage[];
On[General::shdw];
Unprotect/@Names[ctx<>"*"];
Remove/@{ctx<>"*"};
$ContextPath=Complement[$ContextPath,{ctx,"PM`"}];
Remove[ctx];
Needs["PM`"];
