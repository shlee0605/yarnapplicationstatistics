QUEUE=$1

hadoop jar /home/hadoop/yarnapplicationstatistics/jar/WorkGen.jar org.apache.hadoop.examples.WorkGen -Dmapred.job.queue.name=$QUEUE -conf /home/hadoop/yarnapplicationstatistics/conf/workGenKeyValue_conf.xsl -r 1 /home/hadoop/yarnapplicationstatistics/script/fb/inputPath-job-3.txt workGenOutputTest-3 4.427135E-5 0.39279705
hadoop dfs -rmr workGenOutputTest-3
# inputSize 67108864
