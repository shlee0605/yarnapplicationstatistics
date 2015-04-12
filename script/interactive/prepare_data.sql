create external table orders (
order_id int,
buyer_id int,
reate_dt date
) row format delimited fields terminated by '|' location 'hdfs://ip-10-18-159-73.us-west-2.compute.internal:9000/e-commerce/order'

create external table items (
item_id int,
order_id bigint,
goods_id int,
goods_number int,
goods_price float,
goods_amount float
)row format delimited fields terminated by '|' location 'hdfs://ip-10-18-159-73.us-west-2.compute.internal:9000/e-commerce/item'
