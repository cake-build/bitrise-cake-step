var target = Argument("target", "Default");

Task("Default")
  .Does(() =>
{



  DotNetCoreRestore("./SampleNetStandardLibraryProject/SampleNetStandardLibraryProject.sln", new  new DotNetCoreRestoreSettings() { DisableParallel = true, Verbosity = Diagnostics});
  DotNetCoreBuild("./SampleNetStandardLibraryProject/SampleNetStandardLibraryProject.sln", new DotNetCoreBuildSettings() { Configuration = "Debug" });
});

RunTarget(target);