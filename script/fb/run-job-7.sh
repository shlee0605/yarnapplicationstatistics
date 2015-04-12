hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-7.txt workGenOutputTest-7 1.5258789E-5 2.6914062 >> workGenLogs/job-7.txt 2>> workGenLogs/job-7.txt 
hadoop dfs -rmr workGenOutputTest-7
# inputSize 67108864
