#!/bin/bash

./make_config.sh

sudo docker build -t kankyo:v2 .

