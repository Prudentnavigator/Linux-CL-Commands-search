#!/bin/bash


# commandsearch.sh--searches the short description of the man-pages and cl-commands on your
#		     system that contain the search-word from the user input. 
#		     Display's matching commands with the short description from the man-page.


# Check if the command whatis is installed.
if ! [ -x "$(command -v whatis)" ]; then
       echo "
       	*** ERROR: the command 'whatis' is not installed! *** 
								"
       exit 1
fi       

# Generally cl-commands are installed in the /bin and /sbin directories.
dpath=/bin
dpath1=/sbin

# Prompt the user to input a search-word (i.e crypt, network, firewall,...).
echo "	
		*******************************
		     command_search.py"
echo "
		*******************************
"
echo -n "  		Search: "	
read search
echo "
		*******************************
"

# Display the commands that are matching the search-word.
x=$( ls $dpath $dpath1 )
y=$( whatis $x 2>/dev/null )
echo "$y" | nl | grep -i "$search" --color

echo "
		*******************************
"

