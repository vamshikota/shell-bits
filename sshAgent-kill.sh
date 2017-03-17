#!/bin/bash
for i in $(ps auxf | grep ssh-agent | grep -v grep |awk '{print $2}'); do kill $i; done;

