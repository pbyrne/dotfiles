# calculate the average of the numbers passed in, assumes
# one number per line
#
# usage: pbpaste | average
# usage: average < file.txt
function mean() {
 awk '{ total += $1; count++ } END { print total/count }'
}
