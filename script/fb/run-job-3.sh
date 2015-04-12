hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-3.txt workGenOutputTest-3 4.427135E-5 0.39279705 >> workGenLogs/job-3.txt 2>> workGenLogs/job-3.txt 
hadoop dfs -rmr workGenOutputTest-3
# inputSize 67108864
