hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-1.txt workGenOutputTest-1 1.7429888E-4 0.26818842 >> ../../logs/fb/job-1.txt 2>> ../../logs/fb/job-1.txt
hadoop dfs -rmr workGenOutputTest-1
# inputSize 67108864
