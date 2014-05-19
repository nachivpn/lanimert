##!/bin/bash

file1="index.html"
file2="old_index.html"
link_file1="link"
link_file2="old_link"

clear

#downloading index.html
if [ ! -f "$file1" ]
then
	echo "attempting to download index file..."
	wget -t inf "http://www.nitc.ac.in/academics/Results_May_2014/"
else
	echo "index file found"
fi

#extracting required link
echo "extracting link.."
cat "$file1" | grep "cse/S8" > "$link_file2"

#duplicate link file
cp "$link_file2" "$link_file1"

#check for updates
for x in `seq 1 1000` 
do
	echo "Comparison number: ""$x"
	if cmp -s "$link_file1" "$link_file2"
	then
  	echo "No update. sigh."
		echo "Trying again..."
		rm -f "$file2"
		mv "$file1" "$file2"
		rm -f "$file1"
  	wget -q -t inf "http://www.nitc.ac.in/academics/Results_May_2014/"
		rm -f "$link_file2"
		mv "$link_file1" "$link_file2"
		cat index.html | grep "cse/S8" > "$link_file1"
	else
  	echo "--------------------------Some update!---------------------------"
		echo "Displaying cse/S8 link:" 
  	cat "$link_file1" 
		break
	fi
done
