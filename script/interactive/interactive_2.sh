spark-submit --class edu.duke.yarn.Join \
    --master yarn-cluster \
    --num-executors 1 \
    --driver-memory 1g \
    --executor-memory 1g \
    --executor-cores 1 \
    --queue b \
    jar/interactive.jar > logs/interactive/interactive-2.txt 2>&1
