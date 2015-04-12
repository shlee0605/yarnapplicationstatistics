hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-18.txt workGenOutputTest-18 0.97043633 0.27645478 >> workGenLogs/job-18.txt 2>> workGenLogs/job-18.txt 
hadoop dfs -rmr workGenOutputTest-18
# inputSize 67108864
