set mapred.job.queue.name=realtime;

select goods_price,goods_amount from items where goods_amount > 224000;
