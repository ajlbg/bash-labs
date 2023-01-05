# A civil engineering company needs to work out the type of triangle based upon 3 numerical values. Create a script that takes 3 numerical inputs and determines if the triangle is scalene, equilateral, or isosceles

read x
read y
read z

if ((($x == $y) && ($y == $z)))
    then
    echo "EQUILATERAL"
elif ((($x == $y) || ($x == $z) || ($y == $z)))
    then
    echo "ISOSCLES"
else
    echo "SCALENE"
fi