#! /bin/bash
PATH=/bin:/usr/bin:

NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'

clear

spin() {
sleep 7 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done

}

printf "        ${GREEN}\$ ${RED} myth -x ${YELLOW} contract.sol contract2.sol contract3.sol ${NONE} \n\n"

echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:1 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:1:2 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:1:3 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:1:4 \r'
sleep 0.1$RANDOM
echo -ne '| (1/3) contract1.sol:1:5 \r'
sleep 0.1$RANDOM
echo -ne '/ (1/3) contract1.sol:2:6 \r'
sleep 0.1$RANDOM
echo -ne '- (1/3) contract1.sol:2:8 \r'
sleep 0.1$RANDOM
echo -ne '\\ (1/3) contract1.sol:2:10 \r'
sleep 0.1$RANDOM
\n

echo -ne 'Analysis Complete \n'

