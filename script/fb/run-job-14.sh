hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-14.txt workGenOutputTest-14 1.5258789E-5 1.0 >> workGenLogs/job-14.txt 2>> workGenLogs/job-14.txt 
hadoop dfs -rmr workGenOutputTest-14
# inputSize 67108864
