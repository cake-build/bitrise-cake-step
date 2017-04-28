var target = Argument("target", "Default");

Task("Default")
  .Does(() =>
{
  DotNetBuild("./SampleLibraryProject/SampleLibraryProject.sln");
});

RunTarget(target);