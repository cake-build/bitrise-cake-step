#!/bin/bash

if [ ${dotnetcore} == "yes" ]
then
  echo "Installing .net core"
  #brew update
  #brew install openssl
  #mkdir -p /usr/local/lib
  #ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
  #ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/
  #wget https://raw.githubusercontent.com/dotnet/cli/rel/1.0.1/scripts/obtain/dotnet-install.sh
  #chmod +x dotnet-install.sh
  #./dotnet-install.sh 
  
  brew tap caskroom/cask
  brew cask install dotnet

  find /usr -name "dotnet"

  /usr/local/share/dotnet/dotnet --version
  export PATH=/usr/local/share/dotnet:$PATH

  ln -s /usr/local/share/dotnet/dotnet /usr/local/bin/
  dotnet --version

  

fi

echo "Installing Cake bootstrapper"
curl -Lsfo build.sh http://cakebuild.net/download/bootstrapper/osx

echo "Executing Cake"
chmod +x build.sh
./build.sh -s ${script} -t ${target} -c ${configuration} -v ${verbosity}