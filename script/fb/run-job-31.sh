hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-31.txt workGenOutputTest-31 2.3111701E-5 0.6602192 >> workGenLogs/job-31.txt 2>> workGenLogs/job-31.txt 
hadoop dfs -rmr workGenOutputTest-31
# inputSize 67108864
