var target = Argument("target", "Default");

Task("Default")
  .Does(() =>
{
  DotNetBuild("./SampleLibraryProject/SampleLibraryProject.sln");
});

Task("Test")
  .Does(() =>
{
  Information("Hello World!");
});


RunTarget(target);