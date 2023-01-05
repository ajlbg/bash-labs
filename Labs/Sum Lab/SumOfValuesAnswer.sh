# ANSWER:

# Shell interprets a number beginning with 0 as an octal number, which only go from 0 to 7. 
# The other numbers are interpreted as base 10, decimal. To make this pass without the error, ensure all numbers read from file are converted to decimal.

declare -i SUM=0

while read X ; do
    SUM+=10#$X

done < ValueOutput.txt

echo "Sum is: $SUM"