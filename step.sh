#!/bin/bash

if [ ${dotnetcore} == "yes" ]
then
  echo "Installing .net core"
  wget https://raw.githubusercontent.com/dotnet/cli/master/scripts/obtain/dotnet-install.sh
  chmod +x dotnet-install.sh
  ./dotnet-install.sh
fi

echo "Installing Cake bootstrapper"
curl -Lsfo build.sh http://cakebuild.net/download/bootstrapper/osx

echo "Executing Cake"
chmod +x build.sh
./build.sh -s ${script} -t ${target} -c ${configuration} -v ${verbosity}