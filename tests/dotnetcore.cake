var target = Argument("target", "Default");

Task("Default")
  .Does(() =>
{



  DotNetCoreRestore("./SampleNetStandardLibraryProject/SampleNetStandardLibraryProject.sln", new DotNetCoreRestoreSettings() { DisableParallel = true, Verbosity = Error});
  DotNetCoreBuild("./SampleNetStandardLibraryProject/SampleNetStandardLibraryProject.sln", new DotNetCoreBuildSettings() { Configuration = "Debug" });
});

RunTarget(target);