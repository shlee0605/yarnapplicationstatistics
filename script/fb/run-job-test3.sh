QUEUE=$1

hadoop jar /home/hadoop/yarnapplicationstatistics/jar/WorkGen.jar org.apache.hadoop.examples.WorkGen -Dmapred.job.queue.name=$QUEUE -conf /home/hadoop/yarnapplicationstatistics/conf/workGenKeyValue_conf.xsl -r 1 /home/hadoop/yarnapplicationstatistics/script/fb/inputPath-job-2.txt workGenOutputTest-2 1.2668967E-4 0.25417548
hadoop dfs -rmr workGenOutputTest-2
# inputSize 67108864
