#!/bin/sh

# Suspending time
xset dpms 1800 2200 2600

# numlock
numlockx on

# invoke global X session script
. /etc/X11/Xsession
