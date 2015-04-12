cp /home/hadoop/conf/capacity-scheduler.conf50.xml /home/hadoop/conf/capacity-scheduler.xml
yarn rmadmin -refreshQueues
bash /home/hadoop/yarnapplicationstatistics/run_metrics.sh

sleep 180


cp /home/hadoop/conf/capacity-scheduler.conf60.xml /home/hadoop/conf/capacity-scheduler.xml
yarn rmadmin -refreshQueues
bash /home/hadoop/yarnapplicationstatistics/run_metrics.sh

sleep 180

cp /home/hadoop/conf/capacity-scheduler.conf70.xml /home/hadoop/conf/capacity-scheduler.xml
yarn rmadmin -refreshQueues
bash /home/hadoop/yarnapplicationstatistics/run_metrics.sh

sleep 180

cp /home/hadoop/conf/capacity-scheduler.conf80.xml /home/hadoop/conf/capacity-scheduler.xml
yarn rmadmin -refreshQueues
bash /home/hadoop/yarnapplicationstatistics/run_metrics.sh

sleep 180

cp /home/hadoop/conf/capacity-scheduler.conf90.xml /home/hadoop/conf/capacity-scheduler.xml
yarn rmadmin -refreshQueues
bash /home/hadoop/yarnapplicationstatistics/run_metrics.sh
