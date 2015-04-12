hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-0.txt workGenOutputTest-0 0.00780648 1.0025139 >> ../../logs/fb/job-0.txt 2>> ../../logs/fb/job-0.txt
hadoop dfs -rmr workGenOutputTest-0
# inputSize 67108864
