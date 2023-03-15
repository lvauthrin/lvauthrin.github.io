#!/usr/bin/env bash

createJson() {
  name=$1
  difficulty=$2
  tags=$3
  notes=$4

  if [ -z "${name}" ]; then echo "Name must be specified" 1>&2; exit 1; fi
  if [ -z ${difficulty} ]; then echo "Difficulty must be specified" 1>&2; exit 1; fi
  if [ -z "${tags}" ]; then echo "At least one tag must be specified" 1>&2; exit 1; fi
  if [ -z "${notes}" ]; then echo "Notes must be specified" 1>&2; exit 1; fi

  name_url=$(echo $name | tr '[:upper:]' '[:lower:]' | tr ' ' '-');
  name_file=$(echo $name | tr -d ' ');

  # Check if file exists

  read -r -d '' json <<- EOF
    {
      "name": "$name",
      "url": "https://leetcode.com/problems/$name_url",
      "Solved": "Yes",
      "code": "https://github.com/lvauthrin/leetcode/blob/main/java/src/main/java/$name_file.java",
      "Tags": "$tags",
      "Difficulty": "$difficulty",
      "Notes": "$notes"
    }
EOF

  tmpfile=$(mktemp /tmp/problems.json.XXXXXX)
  cp _data/problems.json $tmpfile
  cat $tmpfile | jq ". + [$json]"  > _data/problems.json
  rm $tmpfile
}

echo -n "Problem name: ";
read name;

echo -n "Difficulty [Easy/Medium/Hard]: ";
read difficulty;

echo -n "Tags: ";
read tags;

echo -n "Notes: ";
read notes;

createJson "$name" "$difficulty" "$tags" "$notes"

# NOTE: This is kept in as a quick test
#createJson "Two Sum"  "Easy"  "Array"  "Some notes";

