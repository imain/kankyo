#!/bin/bash

./make_config.sh

sudo docker build -t imain/kankyo:v2 .

