hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-10.txt workGenOutputTest-10 1.7650425E-4 0.40869564 >> workGenLogs/job-10.txt 2>> workGenLogs/job-10.txt 
hadoop dfs -rmr workGenOutputTest-10
# inputSize 67108864
