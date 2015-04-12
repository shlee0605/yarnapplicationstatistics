hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-6.txt workGenOutputTest-6 2.4199486E-5 0.63054186 >> workGenLogs/job-6.txt 2>> workGenLogs/job-6.txt 
hadoop dfs -rmr workGenOutputTest-6
# inputSize 67108864
