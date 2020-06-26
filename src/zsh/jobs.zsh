# https://stackoverflow.com/questions/1537956/bash-limit-the-number-of-concurrent-jobs
#
# while true;
# do
#   do_thing &
#   job_limit 5; # or job_limit $(nproc)
# done
job_limit() {
  # Test for single positive integer input
  if (( $# == 1 )) && [[ $1 =~ ^[1-9][0-9]*$ ]]
  then
    # Check number of running jobs
    joblist=($(jobs -rp))
    while (( ${#joblist[*]} >= $1 ))
    do
      # Wait for any job to finish
      command='wait '${joblist[0]}
      for job in ${joblist[@]:1}
      do
        command+=' || wait '$job
      done
      eval $command
      joblist=($(jobs -rp))
    done
  fi
}
