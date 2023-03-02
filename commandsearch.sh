#!/bin/bash


# commandsearch.sh--searches the short discription of man-pages and cl-commands on your
#		     system which contain the search-word from the user input. 
#		     Display's those commands with the short discription from the man-page.


# Check if the command whatis is installed.
if ! [ -x "$(command -v whatis)" ]; then
       echo "
       	*** ERROR: the command 'whatis' is not installed! *** 
								"
       exit 1
fi       

# Generaly cl-commands are in the /bin and /bin directories.
dpath=/bin
dpath1=/sbin

# Prompt the user to input a search-word (i.e crypt, network, firewall,...) in
#	order to display commands that are related to the desired topic.
echo "		*******************************
		     command_search.py"
echo "
		*******************************
"
echo -n "  		Search: "	
read search
echo "
		*******************************
"

# Display the commands that are related to the search topic with the short
#	discription from the man-pages.
x=$( ls $dpath $dpath1 )
y=$( whatis $x 2>/dev/null )
echo "$y" | nl | grep -i "$search" --color

echo "
		*******************************
"

