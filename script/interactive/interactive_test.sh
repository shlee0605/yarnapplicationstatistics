#!/bin/bash

dmem=$1
emem=$2
QUEUE=$3

$SPARK_HOME/bin/spark-submit --class edu.duke.yarn.Scan \
    --master yarn-cluster \
    --driver-memory $dmem \
    --executor-memory $emem  \
    --executor-cores 16 \
    --queue $QUEUE \
    /home/hadoop/project1/jar/interactive_emr.jar $HOST 
