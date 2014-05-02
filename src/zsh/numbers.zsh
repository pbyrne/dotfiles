# calculate the average of the numbers passed in, assumes one number per line
#
# usage: pbpaste | mean
# usage: mean < file.txt
function mean() {
 awk '{ total += $1; count++ } END { print total/count }'
}

# calculate the sum of the numbers passed in, assumes one number per line
#
# usage: pbpaste | total
# usage: total < file.txt
function total() {
  awk '{ total += $1 } END { print total }'
}
