#!/bin/bash

shopt -s globstar

for file in ./**/*.sol
do
  myth -x "$file" >> results.out
done

