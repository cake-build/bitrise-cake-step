#!/bin/bash

echo "Installing Cake bootstrapper"
curl -Lsfo build.sh https://cakebuild.net/download/bootstrapper/osx

echo "Checking custom NuGet sources"
nuget="/Library/Frameworks/Mono.framework/Versions/Current/bin/nuget"

if [ ! -z "${nuget_source_name}" ] && [ ! -z "${nuget_source_path_or_url}" ] && [ -z "${nuget_source_username}" ] && [ -z "${nuget_source_password}" ] ; then
    echo "${nuget_source_name}"
    "${nuget}" sources add -Name "${nuget_source_name}" -Source "${nuget_source_path_or_url}" -UserName "${nuget_source_username}" -Password "${nuget_source_password}" -Verbosity "detailed"
fi

if [ ! -z "${nuget_source_name}" ] && [ ! -z "${nuget_source_path_or_url}" ] && [ ! -z "${nuget_source_username}" ] && [ ! -z "${nuget_source_password}" ] ; then
    echo "${nuget_source_name}"
    "${nuget}" sources add -Name "${nuget_source_name}" -Source "${nuget_source_path_or_url}" -Verbosity "detailed"
fi

script_args=""

if [ ! -z $script ] ; then
    echo "Adding script parameter"
    script_args="${script_args} -s \"${script}\""
fi

if [ ! -z $verbosity ] ; then
    echo "Adding verbosity parameter"
    script_args="${script_args} --verbosity=${verbosity}"
fi

if [ ! -z $configuration ] ; then
    echo "Adding configuration parameter"
    script_args="${script_args} --configuration=${configuration}"
fi

if [ ! -z $target ] ; then
    echo "Adding target parameter"
    script_args="${script_args} --target=${target}"
fi

if [ ! -z $custom_args ] ; then
    echo "Adding target parameter"
    script_args="${script_args} ${custom_args}"
fi

echo "Executing Cake Script with arguments ${script_args}"
chmod +x build.sh
./build.sh $script_args
