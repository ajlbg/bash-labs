# The company has an old script that would generate an output value to ValueOutput.txt every time it was run.
# They now need the sum of the values in ValueOutput.txt. 

# The following script is meant to add up every value in ValueOutput.txt but currently outputs the wrong value.
# The current output is 1861 when it should be 3472. 
# Change the following code without touching ValueOutput.txt to produce the correct total.


#Run the following command: ./SumOfValues.sh ValueOutput.txt


declare -i SUM=0

while read X ; do
    SUM+=$X

done < ValueOutput.txt

echo "Sum is: $SUM"