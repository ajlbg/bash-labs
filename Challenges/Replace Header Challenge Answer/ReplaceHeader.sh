# A company has noticed some old data files that do not follow their current branding.
# Each data file should contain the brand name, HQ, and founding date as a header, followed by the content of the file

# Write a script to insert the content of Header.txt on top of Data.txt to update it with the correct branding. 

# Extension: Update your script so it can add the header data to all files in a directory.

cat Header.txt Data.txt > Data.NEW
mv -f Data.new Data.txt