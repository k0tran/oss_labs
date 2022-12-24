#!/bin/bash

N=$(echo -ne "$USER$HOME" | wc -c)
echo "$USER $HOME $N"
