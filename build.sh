#!/bin/bash

./make_config.sh

docker build -t imain/kankyo:v1 .

