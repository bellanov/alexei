#!/bin/bash
#
# Format project files using Prettier.
# Usage: ./format.sh

npx prettier tf_deploy_* --ignore-path tf_deploy_*/.terraform/* --write
