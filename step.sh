#!/bin/bash

if [ ${dotnetcore} == "yes" ]
then
  echo "Installing .net core"
  brew update
  brew install openssl
  mkdir -p /usr/local/lib
  ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
  ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/
  wget https://raw.githubusercontent.com/dotnet/cli/master/scripts/obtain/dotnet-install.sh
  chmod +x dotnet-install.sh
  ./dotnet-install.sh --verbose
  ln -s /usr/local/share/dotnet/bin/dotnet /usr/local/bin/
  ln -s /usr/local/share/dotnet/bin/csc /usr/local/bin/
  /usr/local/bin/dotnet --version
  /usr/local/share/dotnet/bin/dotnet --version
  dotnet --version

  find $HOME/.dotnet -name "dotnet"

fi

echo "Installing Cake bootstrapper"
curl -Lsfo build.sh http://cakebuild.net/download/bootstrapper/osx

echo "Executing Cake"
chmod +x build.sh
./build.sh -s ${script} -t ${target} -c ${configuration} -v ${verbosity}