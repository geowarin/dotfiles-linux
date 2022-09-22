#! /usr/bin/env bash

if [ -d "$1" ]; then
    catfish --path "$1"
else
    catfish --path "$(dirname "$1")"
fi