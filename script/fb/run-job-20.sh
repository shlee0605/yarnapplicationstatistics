hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-20.txt workGenOutputTest-20 0.20449321 3.9509428E-4 >> workGenLogs/job-20.txt 2>> workGenLogs/job-20.txt 
hadoop dfs -rmr workGenOutputTest-20
# inputSize 67108864
