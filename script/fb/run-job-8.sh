hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-8.txt workGenOutputTest-8 1.9103289E-5 0.79875195 >> workGenLogs/job-8.txt 2>> workGenLogs/job-8.txt 
hadoop dfs -rmr workGenOutputTest-8
# inputSize 67108864
