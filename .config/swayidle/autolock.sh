#!/bin/bash

swayidle -w \
  timeout 300 'gtklock' \
  before-sleep 'gtklock'
