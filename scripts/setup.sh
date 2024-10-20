#!/bin/sh

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/..

git submodule update --init
cmake -B $parent_path/build $parent_path
