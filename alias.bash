#!/bin/bash
# source this file
for i in ansible ansible-playbook
do
  alias $i="docker compose run --rm $i"
done
