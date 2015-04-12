hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-9.txt workGenOutputTest-9 1.9820035E-4 0.21058567 >> workGenLogs/job-9.txt 2>> workGenLogs/job-9.txt 
hadoop dfs -rmr workGenOutputTest-9
# inputSize 67108864
