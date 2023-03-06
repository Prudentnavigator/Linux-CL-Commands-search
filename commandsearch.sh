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

# Generally CL-Commands are installed in the /bin and /sbin directories.
dpath=/bin
dpath1=/sbin

echo "	
        	*******************************
        	       command_search.py"
        
echo " 		*******************************
        	"

while true; do
    	
    # Prompt the user to input a search-word (i.e crypt, network, firewall,...),
    #	view the manual of a command or exit the script.
    echo -n "			Please enter

    		      a search-word or 
    		
		m - view the manual of a command  
		q - to quit the program.
    		
    		Search-word: "	
    read search 
    echo "
    		*******************************
    "
    # Exit the program
    if [[ "$search" = "q" ]]; then
	sleep 1
	echo "
			---Goodbye!---"
	echo "
		*******************************"

	break
    fi

    # Search the commands and short man-page descriptions and display 
    #	matching results of the search-word.
    if [[ "$search" != "m" ]]; then
    	x=$( ls $dpath $dpath1 )
    	y=$( whatis $x 2>/dev/null )
    	echo "$y" | nl | grep -i "$search" --color

    	echo "
		******************************* "
    fi

    # Look up the commands manual if the user has chosen to.
    if [[ $search = "m" ]]; then
        read -p "		
    		Enter the name of a command to 
		read it's manual:  "

        echo "
		******************************* "

	man "$REPLY" 
    fi
    
    echo "
    		*******************************
    		"
done
