hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-32.txt workGenOutputTest-32 0.23994339 8.2155823E-4 >> workGenLogs/job-32.txt 2>> workGenLogs/job-32.txt 
hadoop dfs -rmr workGenOutputTest-32
# inputSize 67108864
