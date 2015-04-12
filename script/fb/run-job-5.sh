hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /Users/shlee0605/bigdata/hadoop-2.6.0/etc/hadoop/workGenKeyValue_conf.xsl -r 1 inputPath-job-5.txt workGenOutputTest-5 1.5258789E-5 48.03711 >> workGenLogs/job-5.txt 2>> workGenLogs/job-5.txt 
hadoop dfs -rmr workGenOutputTest-5
# inputSize 67108864
