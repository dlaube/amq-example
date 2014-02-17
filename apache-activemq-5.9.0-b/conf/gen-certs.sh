#!/bin/bash

#BEGIN of ActiveMQ docs copy and paste for Broker-b -- according to http://activemq.apache.org/how-do-i-use-ssl.html

#Using keytool, create a certificate for the broker:
keytool -genkey -alias broker -keyalg RSA -keystore broker.ks

#Export the broker's certificate so it can be shared with clients:
keytool -export -alias broker -keystore broker.ks -file broker_cert

#Create a certificate/keystore for the client:
keytool -genkey -alias client -keyalg RSA -keystore client.ks

#Create a truststore for the client, and import the broker's certificate. This establishes that the client "trusts" the broker:
keytool -import -alias broker -keystore client.ts -file broker_cert

# END OF ActiveMQ docs copy and paste


#Copy the client trustStore to the Broker-a config directory
cp client.ts ../../apache-activemq-5.9.0/conf

#Copy the broker trustStore to the Broker-a config directory
cp broker.ks ../../apache-activemq-5.9.0/conf
