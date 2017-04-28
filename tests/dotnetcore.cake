var target = Argument("target", "Default");

Task("Default")
  .Does(() =>
{



  DotNetCoreRestore("./SampleNetStandardLibraryProject/SampleNetStandardLibraryProject.sln");
  DotNetCoreBuild("./SampleNetStandardLibraryProject/SampleNetStandardLibraryProject.sln", new DotNetCoreBuildSettings() { Configuration = "Debug" });
});

RunTarget(target);