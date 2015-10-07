#!/bin/bash

function modifyArray()
{
	declare -A assoc_array
    # eval string into a new assocociative array
    eval "declare -A assoc_array="${1#*=}

    # Modified array value 
    assoc_array[key2]=newValue

    # This line will show assocociative array definition.
    # In shell function can using like return value
    declare -p assoc_array
}

# Declare an assocociative array
declare -A assoc_array=([key1]=value1 [key2]=value2)
# Show assocociative array definition
declare -p assoc_array

echo "*Call modifyArray"
# Pass assocociative array in string form to function
eval $(modifyArray "$(declare -p assoc_array)")
echo "*End modifyArray"

declare -p assoc_array

