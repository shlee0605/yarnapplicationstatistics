QUEUE=$1

hadoop jar /home/hadoop/yarnapplicationstatistics/jar/WorkGen.jar org.apache.hadoop.examples.WorkGen -Dmapred.job.queue.name=$QUEUE -conf /home/hadoop/yarnapplicationstatistics/project1/conf/workGenKeyValue_conf.xsl -r 1 /home/hadoop/yarnapplicationstatistics/script/fb/inputPath-job-1.txt workGenOutputTest-1 1.7429888E-4 0.26818842
hadoop dfs -rmr workGenOutputTest-1
# inputSize 67108864
