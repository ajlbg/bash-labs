# A company needs a script that will keep track of users with access to a variety of resources.
# Write a script tracker, with error handling, that will

# 1.  Adds an entry to ResourceAccessTracker.txt:
    # ./ManageResourceAccess.sh new <name> <resource number> 
# 2. Lists every entry in the tracker
    # ./ManageResourceAccess.sh list 
# 3. Delete all resource access associated with a name
    # ./ManageResourceAccess.sh delete <name> 
# 4. Delete the entire tracker
    # ./ManageResourceAccess.sh wipe
# 5. Display all resources associated with a name
    # ./ManageResourceAccess.sh lookup <name>

# For all cases where a number is expected, only a numerical value should be accepted.
# For all cases where a name is expected, only a name should be accepted. Not numbers.

# Below is an example answer: 
# 

acceptedStrings='^[A-z]+$'

function checkIsString(){
    if ! [[ $1 =~ $acceptedStrings ]] ; then
        echo "Error: Not a valid name" >&2; exit 1
    fi
}

# 1. Currently, if you enter a single letter and any line contains that letter, will delete line. name doesn't have to match exactly
new(){
    checkIsString "$1"

    acceptedNumbers='^[0-9]+$'
    if ! [[ $2 =~ $acceptedNumbers ]] ; then
        echo "Error: Not a valid resource number" >&2; exit 1
    fi

    echo "Successfully added $1 to the ResourceAccessTracker." && echo "$1 : $2" >> ResourceAccessTracker.txt

}

# 2. 
function list(){
    grep '^' ResourceAccessTracker.txt || echo "The tracker is empty"
}

# 3. 
function delete(){
    checkIsString "$1"

    file=$(<ResourceAccessTracker.txt)

    if grep $1 ResourceAccessTracker.txt; then
        echo "Deleting all occurrences of: $1"
         sed -i '' "/$1/d" ResourceAccessTracker.txt
    fi
}

# 4.
function wipe(){
    >ResourceAccessTracker.txt
    echo "The tracker has been wiped successfully"
}

# 5.
function lookup(){
    if !(grep $1 ResourceAccessTracker.txt) ; then
        echo "$1 doesn't exist in the tracker"
    fi
}

case $1 in
new)
    new "$2" "$3"
    ;;
list)
    list
    ;;
delete)
    delete "$2"
    ;;
wipe)
    wipe "$2"
    ;;
lookup)
    lookup "$2"
    ;;
    *)
    echo "Sorry, that isn't a valid command. The following is a list of valid commands:
    1. Create a new entry: 
            ./ManageResourceAccess.sh new <name> <resource number> 
    2. List all entries in the ResourceAccessTracker: 
            ./ManageResourceAccess.sh list 
    3. List all entries associated with a name: 
            ./ManageResourceAccess.sh delete <name> 
    4. Delete entire ResourceAccessTracker: 
            ./ManageResourceAccess.sh wipe
    5. Lookup all resource numbers associated with name: 
            ./ManageResourceAccess.sh lookup <name>
    "
esac