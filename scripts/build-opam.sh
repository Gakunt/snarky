#!/bin/bash

set -eo

# Generate opam.test from the current opam switch
opam switch export opam.test
# Check if the switch is up-to-date
if diff opam.test opam.export; then
    exit 0
fi

opam init
opam update
opam switch create 4.11.2 || true
opam switch 4.11.2
opam switch import opam.export
