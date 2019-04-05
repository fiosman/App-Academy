# USAGE: update [file1] [file2] [etc...]
#
# Examples: update README.md
#           update git_setup.sh
#           update .gitignore git_setup.sh
# Will update that file on all branches
#

BRANCHES=`git branch | egrep -v master`

for branch in $BRANCHES; do
  git checkout $branch;
  git checkout master $@;
  git add -A;
  git commit -m "Update $@";
  git push;
done

git checkout master;
