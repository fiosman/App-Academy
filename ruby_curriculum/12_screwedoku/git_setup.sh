for remote in `git branch -r | egrep -v master`; do git branch --track $remote; done

git fetch --all
BRANCHES=`git branch | egrep -v master | cut -f 2 -d "/"`

for branch in $BRANCHES; do
  git checkout $branch;
done

for branch in $BRANCHES; do
  git branch -D "origin/$branch"
done

git checkout master;
