#!/bin/bash
ps -e --sort=-%mem --no-headers | head -n 5
