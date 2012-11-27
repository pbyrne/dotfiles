# List each file in the repository with its churn score. Pass in the number of days to check for.
# Ex:
#     $ churn 30
#     bar.txt, 1
#     foo.txt, 3
churn() {
  age=$1
  for file in $(git ls-files); do
    echo $file,$(git log --oneline --after=$age.days.ago -- $file | wc -l)
  done
}


