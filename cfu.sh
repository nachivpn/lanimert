##!/bin/bash

file1="index.html"
link_file1="link"
link_file2="old_link"

#clear screen
clear
#downloading index.html
if [ ! -f "$file1" ]
then
	echo "index file does not already exist"
	echo "attempting to download index file..."
	wget -q -t inf "http://www.nitc.ac.in/academics/Results_May_2014/"
fi

#extracting required link
echo "extracting link.."
cat index.html | grep cse/S8 > $link_file2

#duplicate link file
cp $link_file2 $link_file1

#check for updates
for x in `seq 1 50`
do
	echo "Comparison number: "$x
	if cmp -s "$link_file1" "$link_file2"
	then
    		echo "No update. sigh."
		echo "Trying again..."
		rm -f index.html
   		wget -q -t inf "http://www.nitc.ac.in/academics/Results_May_2014/"
		mv $link_file1 $link_file2
		cat index.html | grep cse/S8 > $link_file1
	else
    		echo "Some update!"
		echo "Displaying cse/S8 link:" 
    		cat $link_file1 
		break
	fi
done
