#!/bin/bash

function showArray()
{
	declare -A assoc_array_in_showArray
    # eval string into a new assocociative array
    eval "declare -A assoc_array_in_showArray="${1#*=}

    # Proof that array was successfully created
    declare -p assoc_array_in_showArray

    # Modifiy array value 
    assoc_array_in_showArray[key2]=newValue

    declare -p assoc_array_in_showArray
}

# Declare an assocociative array
declare -A assoc_array=([key1]=value1 [key2]=value2)

# Show assocociative array definition
declare -p assoc_array

# Pass assocociative array in string form to function
echo "*Call showArray"
showArray "$(declare -p assoc_array)"
echo "*Done showArray"

# The array value not been modified
declare -p assoc_array

#The array assoc_array_in_showArray is local, only used in funciton showArray.
if [[ ${#assoc_array_in_showArray[@]} == 0 ]]; then
    echo "assoc_array_in_showArray is empty."
else
    declare -p assoc_array_in_showArray
fi
