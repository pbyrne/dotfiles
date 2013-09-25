# calculate the average of the numbers passed in, assumes one number per line
#
# usage: pbpaste | mean
# usage: mean < file.txt
function mean() {
 awk '{ total += $1; count++ } END { print total/count }'
}
