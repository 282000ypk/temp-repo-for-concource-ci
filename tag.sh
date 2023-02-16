#!/bin/bash

cd repo

declare version=`cat version.txt`
echo $version

# declare version=${version:0:$((${#version}-1))}$((${version:$((${#version}-1))}+1))
declare version=`echo ${version%.*}.$((${version##*.}+1))`

echo $version
echo $version > version.txt

git add .
git commit -m "New release `echo $version` [skip deploy]"
git tag `echo $version` -a -m "New release `echo $version` [skip deploy]"
git push --tag -o ci-skip=true