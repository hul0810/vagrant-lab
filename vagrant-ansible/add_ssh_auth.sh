#!/usr/bin/env bash

# ssh key 생성
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@ansible-node01
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@ansible-node02
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@ansible-node03