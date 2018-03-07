#!/bin/bash

echo "Installing Cake bootstrapper"
curl -Lsfo build.sh https://cakebuild.net/download/bootstrapper/osx

echo "Executing Cake Script"
chmod +x build.sh
./build.sh -s "${script}" --verbosity="${verbosity}" --configuration="${configuration}" --target="${target}"