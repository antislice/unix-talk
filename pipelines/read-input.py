#!/usr/bin/env python
import sys

print "This file will prompt you for a number 1000 times."
print "The numbers will be 0 to 999 in order."
print "You should probably find a way to read input from a file."
print "--------------"

for i in range(1000):
  user_input = raw_input("Please enter " + str(i) + ": ")
  if user_input != str(i):
    print "Fail!  We asked you for " + str(i) + " and you gave us " + user_input
    sys.exit(-1)

print "--------------"
print "TRIUMPH!"
