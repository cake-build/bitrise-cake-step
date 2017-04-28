var target = Argument("target", "Default");

Task("Default")
  .Does(() =>
{
  NuGetRestore("./SamplePortableAndNetStandardLibraryProject/SamplePortableAndNetStandardLibraryProject.sln");
  DotNetBuild("./SamplePortableAndNetStandardLibraryProject/SamplePortableAndNetStandardLibraryProject.sln");
});

RunTarget(target);