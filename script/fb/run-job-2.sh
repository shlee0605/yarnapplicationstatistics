hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-2.txt workGenOutputTest-2 1.2668967E-4 0.25417548 >> ../../logs/fb/job-2.txt 2>> ../../logs/fb/job-2.txt
hadoop dfs -rmr workGenOutputTest-2
# inputSize 67108864
