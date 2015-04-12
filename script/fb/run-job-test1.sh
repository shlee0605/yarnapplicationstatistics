QUEUE=$1

hadoop jar /home/hadoop/yarnapplicationstatistics/jar/WorkGen.jar org.apache.hadoop.examples.WorkGen -Dmapred.job.queue.name=$QUEUE -conf /home/hadoop/yarnapplicationstatistics/conf/workGenKeyValue_conf.xsl -r 1 /home/hadoop/yarnapplicationstatistics/script/fb/inputPath-job-0.txt workGenOutputTest-0 0.00780648 1.0025139
hadoop dfs -rmr workGenOutputTest-0
# inputSize 67108864
