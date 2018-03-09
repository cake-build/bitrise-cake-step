#!/bin/bash

echo "Installing Cake bootstrapper"
curl -Lsfo build.sh https://cakebuild.net/download/bootstrapper/osx

echo "Checking custom nuget sources"
nuget="/Library/Frameworks/Mono.framework/Versions/Current/bin/nuget"

if [ ! -z "${nuget_source_name}" ] && [ ! -z "${nuget_source_path_or_url}" ] && [ -z "${nuget_source_username}" ] && [ -z "${nuget_source_password}" ] ; then
    echo "${nuget_source_name}"
    "${nuget}" sources add -Name "${nuget_source_name}" -Source "${nuget_source_path_or_url}" -UserName "${nuget_source_username}" -Password "${nuget_source_password}" -Verbosity "detailed"
fi

if [ ! -z "${nuget_source_name}" ] && [ ! -z "${nuget_source_path_or_url}" ] && [ ! -z "${nuget_source_username}" ] && [ ! -z "${nuget_source_password}" ] ; then
    echo "${nuget_source_name}"
    "${nuget}" sources add -Name "${nuget_source_name}" -Source "${nuget_source_path_or_url}" -Verbosity "detailed"
fi

echo "Executing Cake Script"
chmod +x build.sh
./build.sh -s "${script}" --verbosity="${verbosity}" --configuration="${configuration}" --target="${target}"