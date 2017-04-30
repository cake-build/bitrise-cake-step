var target = Argument("target", "Default");

Task("Default")
  .Does(() =>
{



  DotNetCoreRestore("./SampleNetStandardLibraryProject/SampleNetStandardLibraryProject.sln", new DotNetCoreRestoreSettings() { DisableParallel = true, NoCache = true });
  DotNetCoreBuild("./SampleNetStandardLibraryProject/SampleNetStandardLibraryProject.sln", new DotNetCoreBuildSettings() { Configuration = "Debug" });
});

RunTarget(target);