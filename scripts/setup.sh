#!/bin/sh

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

git submodule update --init
mkdir build 2>/dev/null
cmake -B build $parent_path/../