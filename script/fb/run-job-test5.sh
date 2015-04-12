QUEUE=$1

hadoop jar /home/hadoop/yarnapplicationstatistics/jar/WorkGen.jar org.apache.hadoop.examples.WorkGen -Dmapred.job.queue.name=$QUEUE -conf /home/hadoop/yarnapplicationstatistics/conf/workGenKeyValue_conf.xsl -r 1 /home/hadoop/yarnapplicationstatistics/script/fb/inputPath-job-4.txt workGenOutputTest-4 1.5258789E-5 1.0
hadoop dfs -rmr workGenOutputTest-4
# inputSize 67108864
