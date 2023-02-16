#!/bin/bash


declare text=`cat testFile.txt`
echo $text

declare text=${text:0:$((${#text}-1))}$((${text:$((${#text}-1))}+1))

echo $text
echo $text > testFile.txt


git add .
git commit -m "Trigger $text"
git push