OLD_IFS=$IFS
IFS=$'\n'
CHANGED_DIRS=$(git diff --name-only $TRAVIS_COMMIT_RANGE | cut -d"/" -f1 | uniq)
IFS=$OLD_IFS
for element in $CHANGED_DIRS; do
  if [ -d "$element" ]; then
    cd $element; ./build.sh
  fi
done
