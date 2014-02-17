#Running this script creates 10 random commit messages by appending random 
#messages into tmp.txt 
verbs=("adding" "removing" "fixing" "refactoring" "changing" "reverting")
verbsLen=${#verbs[@]}

nouns=("stylesheets" "javascripts" "main.rb" "modifications")
nounsLen=${#nouns[@]}

modifiers=("again" "(bugfix)" "(fixed)" "fearlessly" "again" "(change_request)" "(style)")
modifiersLen=${#modifiers[@]}

touch tmp.txt
git add tmp.txt
git checkout -b temp
for var in {1..10}; do
  verbNum=$((RANDOM % $verbsLen))
  nounNum=$((RANDOM % $nounsLen))
  modifierNum=$((RANDOM % $modifiersLen))
  commitMsg=(${verbs[$verbNum]}" "${nouns[$nounNum]}" "${modifiers[$modifierNum]})
  echo $commitMsg >> tmp.txt
  git commit -am "commit $var: $commitMsg";   
done;