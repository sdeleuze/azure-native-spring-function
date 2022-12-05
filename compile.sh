#!/usr/bin/env bash

MAINCLASS=com.example.DemoApplication
VERSION=0.0.1-SNAPSHOT

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

rm -rf target

echo "Building native image $ARTIFACT with Maven"
./mvnw -Pnative native:compile

if [[ -f "target/spring-native-image" ]]
then
  printf "${GREEN}SUCCESS${NC}\n"
  mkdir target/function
  cp -R src/main/function/* target/function
  mv target/spring-native-image target/function/spring-native-image
  exit 0
else
  printf "${RED}FAILURE${NC}: an error occurred when compiling the native-image.\n"
  exit 1
fi


