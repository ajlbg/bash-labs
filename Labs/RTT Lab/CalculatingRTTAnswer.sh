# ANSWER:
# cmd1 | cm2 - runs commands in parallel, using output of cmd1 as input for cmd2
# The output of the ping should be passed into grep, so this is correct

# cm1 && cmd2 - runs cmd2 only if cm1 is successful, this is correct

# cmd1 & cmd2 - runs cm1 as a background process, and in parallel, runs cmd2 in the foreground
# This lead to a race condition to write on stdout. As expected, the date always beats the ping command
# meaning that the date was always logged but not the rtt. 



probe() (
  ping -qnc2 kernel.org | \
    grep round-trip && \
    date +"OK %D %T"
)

rm -f log
probe >> log
probe >> log
cat log