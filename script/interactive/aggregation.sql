set mapred.job.queue.name=realtime;

select goods_id, sum(goods_number) from items group by goods_id;
