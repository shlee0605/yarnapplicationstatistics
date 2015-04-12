hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-33.txt workGenOutputTest-33 1.5258789E-5 1.0 >> workGenLogs/job-33.txt 2>> workGenLogs/job-33.txt 
hadoop dfs -rmr workGenOutputTest-33
# inputSize 67108864
