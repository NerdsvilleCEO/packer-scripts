set -x
BUILD_ALL_REGEX="BUILD ALL"
if [[ $TRAVIS_COMMIT_MESSAGE =~ $BUILD_ALL_REGEX ]]; then
  DIRS=$(find . -maxdepth 1 -type d -not -name ".git" -not -name ".")
else
  OLD_IFS=$IFS
  IFS=$'\n'
  DIRS=$(git diff --name-only "$TRAVIS_COMMIT_RANGE" | cut -d"/" -f1 | uniq)
  IFS=$OLD_IFS
fi

for element in $DIRS; do
  if [[ -d "$element" && -f "$element/build.sh" ]]; then
    cd $element; ./build.sh
  fi
done
