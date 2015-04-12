set mapred.job.queue.name=realtime;

select orders.buyer_id, sum(items.goods_amount) as total from items join orders on items.order_id = orders.order_id group by orders.buyer_id limit 10
