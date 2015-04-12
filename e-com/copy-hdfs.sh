hdfs dfs -mkdir /e-commerce
hdfs dfs -mkdir /e-commerce/order
hdfs dfs -mkdir /e-commerce/item
hdfs dfs -copyFromLocal output/OS_ORDER.txt /e-commerce/order/order.txt
hdfs dfs -copyFromLocal output/OS_ORDER_ITEM.txt /e-commerce/item/item.txt
