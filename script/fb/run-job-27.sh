hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-27.txt workGenOutputTest-27 3.5472214E-4 0.1689561 >> workGenLogs/job-27.txt 2>> workGenLogs/job-27.txt 
hadoop dfs -rmr workGenOutputTest-27
# inputSize 67108864
