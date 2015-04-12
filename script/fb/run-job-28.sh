hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-28.txt workGenOutputTest-28 5.568713E-4 0.107623555 >> workGenLogs/job-28.txt 2>> workGenLogs/job-28.txt 
hadoop dfs -rmr workGenOutputTest-28
# inputSize 67108864
