# Engineers want to get the round-trip time (RTT) of a server. The script should output the RTT
# of the server and the date only if the ping is successful. Currently, when the ping is successful,
# only the date is output to the log file. 

# Change the following code to that both the RTT and date are output to the log file only upon a successful ping.



probe() (
  ping -qnc2 kernel.org | \
    grep round-trip & \
    date +"OK %D %T"
)

rm -f log
probe >> log
probe >> log
cat log
