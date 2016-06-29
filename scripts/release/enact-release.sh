#!/usr/bin/env bash

# `npm whoami` errors and dies if you're not logged in,
# so we redirect the stderr output to /dev/null since we don't care.
NPM_USER=$(npm whoami 2> /dev/null)

if [ "${NPM_USER}" != "mleader1" ]; then
  echo "You must be logged in as 'mleader1' to publish. Use 'npm login'."
  exit
fi

set -ex

for package in ./deploy/*
do
  npm publish --access public ${package}
done

# Always log out of npm when publish is complete.
npm logout
