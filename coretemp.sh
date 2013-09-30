#!/bin/bash
#Simple script to view the system temperature
echo "Your processor's temperatures are:"
sensors | grep Core
