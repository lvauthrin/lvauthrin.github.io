#!/usr/bin/env bash

dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#shift

cd "$dir/../site";
echo "$PWD"
bundle "$@"
