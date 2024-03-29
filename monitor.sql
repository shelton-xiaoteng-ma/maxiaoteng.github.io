-- 通用

select * from information_schema.innodb_trx;

-- 计算库里有多少表
show databases;
SELECT count(*) TABLES, table_schema FROM information_schema.TABLES   
-- where table_schema = 'dianping' 
where table_schema not in ("information_schema", "mysql", "performance_schema")
GROUP BY table_schema; 

SELECT count(*)  FROM information_schema.TABLES
where table_schema not in ("information_schema", "mysql", "performance_schema")
;

-- 返回所有列
SELECT GROUP_CONCAT(COLUMN_NAME SEPARATOR ",") FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'mercari' AND TABLE_NAME = 'app_sku_2019_10_01';

## 台湾贸易数据
-- 找出上个月初步值的数量
select 
-- *
count(*)
-- DISTINCT left(Date_origin, 6)
-- delete
from customs.trade_statistics where 
left(Date_origin, 6)='108年9月' and 
Date_origin like '%初步值%'
;

-- 找出不带初步值的数量比较
select 
count(*)
-- DISTINCT left(Date_origin, 6)
from customs.trade_statistics where 
left(Date_origin, 6)='108年9月' and 
Date_origin not like '%初步值%'
;

select count(*) from customs.trade_statistics where ts_short='2019-10-18';


# raksul
select left(batch_id, 10), count(*) from raksul.raksul_info group by left(batch_id, 10);


# twitch定期统计
select ts_short, count(*) from twitch.game_list group by ts_short;
select ts_short, count(*) from twitch.channel_list group by ts_short;
select ts_short, count(*) from twitch.game_info group by ts_short;
select ts_short, count(*) from twitch.channel_info group by ts_short;
select ts_short, count(*) from twitch.game_activity_info group by ts_short;
select ts_short, count(*) from twitch.channel_activity_info group by ts_short;
select ts_short, count(*) from twitch.channel_stream_info group by ts_short;
select occurrence_date, count(*) from twitch.game_share group by occurrence_date;

# recruit_agent
SELECT ts_short, count(*) from recruit_agent.company group by ts_short;
SELECT ts_short, count(*) from recruit_agent.company_info group by ts_short;
SELECT ts_short, count(*) from recruit_agent.job group by ts_short;


# indeed
# 每次分析
select ts_short,count(*) from Indeed.indeed_searchcount_final group by ts_short;
select ts_short,count(*) from Indeed.indeed_search_count group by ts_short;
select ts_short,count(*) from Indeed.indeed_info group by ts_short;
select * from Indeed.indeed_searchcount_final where ts_short="2019-07-03";


# Hotel
select ts_short, count(*) from Hotels.jinjiang_cities group by ts_short;
select ts_short, count(*) from Hotels.jinjiang_hotels group by ts_short;

select ts_short, count(*) from Hotels.oyo_cities group by ts_short;
select ts_short, count(*) from Hotels.oyo_hotels group by ts_short;
select ts_short, count(*) from Hotels.oyo_hot_cities group by ts_short;

select ts_short, count(*) from Hotels.bth_hotels group by ts_short;
select ts_short, count(*) from Hotels.bth_cities group by ts_short;
select ts_short, count(*) from Hotels.bth_brands group by ts_short;

select ts_short, count(*) from Hotels.viennar_hotels group by ts_short;

select ts_short, count(*) from Hotels.luckin_shops group by ts_short;
select * from Hotels.luckin_shops where shop_no="No.0397";
select * from Hotels.luckin_shops where shop_name="厦门东方财富广场店";
select distinct(left(ts, 13)) from Hotels.luckin_shops where ts_short="2019-11-16";

select * from
(SELECT DISTINCT shop_no, shop_name, city from Hotels.luckin_shops where ts_short>"2019-11") aa
left join 
(SELECT * from Hotels.luckin_shops where ts_short="2019-11-14") bb
on aa.shop_no=bb.shop_no
where bb.shop_no is null;

select ts_short, count(1) from Hotels.bth_remain group by ts_short;
select left(ts,16), count(1) from Hotels.bth_remain group by left(ts,16);

# 机票项目
select ts_short, count(*) from flight_ticket.tickets group by ts_short;
select ts_short, count(*) from flight_ticket.ctrip_tickets group by ts_short;

select ts_short, from_net, count(*) from flight_ticket.tickets group by ts_short, from_net;
select ts_short,from_net, count(*) from flight_ticket.ctrip_tickets group by ts_short, from_net;
select ts_short, count(*) from flight_ticket.umetrip_info group by ts_short;

delete from flight_ticket.tickets where from_net="china_air" and ts_short="2019-11-08" group by arr_port, dep_port;

-- 日本机票
select ts_short, count(*) from jp_flight_ticket.jal where from_net="jal_domestic" group by ts_short;
select ts_short, count(*) from jp_flight_ticket.jal where from_net="jal_internal" group by ts_short;
select ts_short, count(*) from jp_flight_ticket.ana group by ts_short;
select ts_short, count(*) from jp_flight_ticket.ctrip_tickets group by ts_short;
select dep_port, arr_port, count(*) from flight_ticket.tickets where from_net="china_air" and ts_short="2019-11-01" group by dep_port, arr_port;


select dep_city, arr_city, count(*) from jp_flight_ticket.jal where from_net="jal_domestic" and ts_short="2019-10-18" group by dep_city, arr_city;
select dep_city, arr_city, count(*) from jp_flight_ticket.jal where from_net="jal_internal" and ts_short="2019-11-08" group by dep_city, arr_city;

select dep_city_name, arr_city_name, count(*) from jp_flight_ticket.ctrip_tickets where ts_short="2019-10-18" group by dep_city_name, arr_city_name;
select dep_city, arr_city, count(*) from jp_flight_ticket.ana where ts_short="2019-10-18" group by dep_city, arr_city;


# 智联
select ts_short, count(*) from Jobs.zhilian_job group by ts_short;
select ts_short, count(*) from Jobs.zhilian_company group by ts_short;

# 58同城
-- 690 45 475 15919
select count(*) from Jobs.`58_cities`;
select count(*) from Jobs.`58_industries`;
select count(*) from Jobs.`58_job_type`;
select count(*) from Jobs.`58_sub_local`;
select ts_short, count(*) from Jobs.`58_job` group by ts_short;
select batch_id, count(*) from Jobs.`58_job_info` group by batch_id;
select batch_id, count(*) from Jobs.`58_job_from_company` group by batch_id;
select batch_id, count(*) from Jobs.`58_company` group by batch_id;
select batch_id, count(*) from Jobs.`58_company_tag` group by batch_id;
select batch_id, count(*) from Jobs.`58_company_info` group by batch_id;


select left(ts, 13), count(*) from Jobs.`58_job` where batch_id="2019-10-01" group by left(ts, 13) ;
select left(ts, 13), count(*) from Jobs.`58_job_from_company` where batch_id="2019-10-01" group by left(ts, 13) ;

select left(ts, 13), count(*) from Jobs.`58_job` where batch_id="2019-09-01" group by left(ts, 13) ;
select left(ts, 13), count(*) from Jobs.`58_job_from_company` where batch_id="2019-10-01" group by left(ts, 13) ;
select left(ts, 13), count(*) from Jobs.`58_job_info` where batch_id="2019-10-01" group by left(ts, 13) ;
select left(ts, 13), count(*) from Jobs.`58_company_tag` where batch_id="2019-10-01" group by left(ts, 13) ;
select ts_short, count(*) from Jobs.`58_job_info` where batch_id="2019-09-01" group by ts_short ;


# 小红书
-- 周更
select ts_short, count(*) from xiaohongshu.brands group by ts_short;
select ts_short, count(*) from xiaohongshu.brand_info group by ts_short;
select ts_short, count(*) from xiaohongshu.notes_by_brand group by ts_short;
select ts_short, count(*) from xiaohongshu.note_info group by ts_short;
select pub_date, count(*) from xiaohongshu.note_info group by pub_date order by pub_date DESC;

select count(*) from
(select note_id from xiaohongshu.notes_by_brand where ts_short="2019-11-07") aa
left join 
(select note_id from xiaohongshu.notes_by_brand where ts_short<"2019-11-07") bb
on aa.note_id=bb.note_id
where bb.note_id is null;

select ts_short, count(*) from xiaohongshu.user_info group by ts_short;

-- 月更
select ts_short, count(*) from xiaohongshu.goods_by_brand group by ts_short;
select ts_short, count(*) from xiaohongshu.notes_by_good group by ts_short;
select ts_short, count(*) from xiaohongshu.app_classification group by ts_short;
select ts_short, count(*) from xiaohongshu.app_brand_category group by ts_short;
-- 更新小红书
select * from xiaohongshu.brand_info where brand_name="三只松鼠";

-- 周一更新
select ts_short, count(*) from xiaohongshu.z_notes_by_keyword group by ts_short;
select keyword, sort, count(*) from xiaohongshu.z_notes_by_keyword where ts_short="2019-11-25" group by keyword, sort;
select ts_short, count(*) from xiaohongshu.z_note_info group by ts_short;
select * from xiaohongshu.z_note_info where ts_short="2019-11-18" order by ts desc limit 500, 10;


# 珀莱雅
-- 月更
select ts_short, count(*) from proya.cities group by ts_short;
select ts_short, count(*) from proya.stores group by ts_short;


# 大众点评
select count(*) from dianping.shops_m;
select left(ts,13), count(*) from dianping.shops group by left(ts,13);
select left(ts, 16), count(*) from dianping.shops_wx where ts_short="2019-10-30" group by left(ts, 16);
select count(*) from dianping.shops_m;
select count(*) from dianping.shops_2_2019_07;

-- 生成表2 shops_2_2019_07
create table dianping.shops like dianping.shops_2019_09;
create table dianping.shops_2_2019_09 like dianping.shops_2_2019_08;

insert ignore into dianping.shops_2_2019_09
select e.province_short, e.cate_2_name, sum(count_num) as count_num
from
	(
		select d.cate_2_name, c.*
		from
			(
				select cate_2_id, cate_2_name from dianping.categories) d
				left join 
				(
				    select a.province_short, b.city_id, b.cate_id, b.count_num
					from
						(select province_short, city_id from dianping.city_list_province )as a
						left join
						(
							select city_id,cate_id, count(*) as count_num from dianping.shops_2019_09 group by city_id, cate_id
						) as b
						on a.city_id=b.city_id
			) c
			on d.cate_2_id=c.cate_id
	) as e
group by e.province_short, e.cate_2_name;


-- 公有云

select ts_short, cloud, count(*) from cloud.Uniform group by ts_short, cloud;
select ts_short, cloud, count(*) from cloud.Uniform_bk group by ts_short, cloud;

-- ali
select ts_short, count(*) from cloud.aliyun_instance group by ts_short;
select ts_short, count(*) from cloud.aliyun_instance_zone group by ts_short;
select regionId, count(*) from cloud.aliyun_instance_zone where ts_short='2019-08-07' group by regionId;
select ts_short, count(*) from cloud.aliyun_prices group by ts_short;
select ts_short, count(*) from cloud.aliyun_regions group by ts_short;
-- tencent
select ts_short, count(*) from cloud.tencent_regions group by ts_short;
select ts_short, count(*) from cloud.tencent_instances group by ts_short;

select ts_short, count(*) from cloud.tencent_basic_instances group by ts_short;

-- aws
select ts_short, count(*) from cloud.aws_regions group by ts_short;
select ts_short, count(*) from cloud.aws_instances group by ts_short;

select distinct location from cloud.aws_instances where ts_short="2019-09-05";
select distinct Region from cloud.Uniform where ts_short="2019-09-05" and Cloud="AWS";


-- azure
select ts_short, count(*) from cloud.azure_os group by ts_short;
select ts_short, count(*) from cloud.azure_regions group by ts_short;
select ts_short, count(*) from cloud.azure_prices group by ts_short;


-- gcp
select ts_short, count(*) from cloud.gcp_instances group by ts_short;
select ts_short, count(*) from cloud.gcp_cpu_group group by ts_short;
select ts_short, count(*) from cloud.gcp_regions group by ts_short;

-- 最终统计
select Cloud, count(*) from cloud.Uniform where ts_short='2019-09-05' group by Cloud;
select ts_short, Cloud, count(*) from cloud.Uniform group by ts_short, Cloud;

select count(*)
from cloud.Uniform
where ts_short="2019-09-05" and Cloud="Azure" and (CPUseries is NULL or GPUseries is NULL or Region is NULL or InstanceType is NULL );

-- Mercari

-- 分析当前批次新增用户
select ts_short, count(1) from mercari.brands group by ts_short;
select ts_short, count(1) from mercari.categories group by ts_short;
select ts_short, count(1) from mercari.app_sku_2019_10_02 group by ts_short;
select count(1) from mercari.app_sku;
select batch_id, count(1) from mercari.app_user group by batch_id;
select ts_short, count(1) from mercari.all_user group by ts_short;
select ts_short, count(1) from mercari.us_all_user group by ts_short;
select * from mercari.app_sku_2019_10_02 where batch_id="2019-10-01";

-- 计算表的验证
select yearmonth, count(*) from mercari.final_buyer_txn group by yearmonth; 
select update_date, count(*) from mercari.final_buyer_txn group by update_date; 

select yearmonth, count(*) from mercari.final_seller_txn group by yearmonth; 
select yearmonth, count(*) from mercari.final_seller_listing group by yearmonth; 


select sum(value) from mercari.us_final_buyer_txn where yearmonth="2019-09"; 
select sum(value) from mercari.us_final_seller_txn where yearmonth="2019-09"; 
select count(*) from mercari.us_final_buyer_txn where yearmonth="2019-09"; 
select count(*) from mercari.us_final_seller_txn where yearmonth="2019-09"; 

-- mercari us
select ts_short, count(1) from mercari.us_categories group by ts_short;
select ts_short, count(1) from mercari.us_brands group by ts_short;
select ts_short, count(1) from mercari.us_brands_by_category group by ts_short;
select ts_short, count(1) from mercari.us_sku group by ts_short;
select left(ts,13), count(1) from mercari.us_sku group by left(ts,13);
select batch_id, count(1) from mercari.us_sku group by batch_id;
select count(1) from mercari.us_sku_from_seller where batch_id="2019-11-02";
select left(ts,13), count(1) from mercari.us_brands_by_category group by left(ts,13);
select left(ts,13), count(1) from mercari.us_sku where batch_id="2019-11-02" group by left(ts,13);
select left(ts,13), count(1) from mercari.us_sku_info where batch_id="2019-11-02" group by left(ts,13);
select left(ts,13), count(1) from mercari.us_sku_from_seller where batch_id="2019-11-02" group by left(ts,13);
select left(ts,13), count(1) from mercari.us_sku_info_for_all where batch_id="2019-10-02" group by left(ts,13);
select  left(ts,13), count(1) from mercari.us_sku_from_seller where batch_id="2019-10-02" group by  left(ts,13);


-- wow
select ts_short, count(*) from wow.topics group by ts_short;
select `language`, region, ts_short, count(*) from wow.topics group by `language`, region, ts_short;

-- paypay
select ts_short, count(*) from paypay.categories group by ts_short;
select ts_short, count(*) from paypay.brands group by ts_short;
select ts_short, count(*) from paypay.search_count group by ts_short;
select DISTINCT category_id_1 from paypay.category_new;
select * from paypay.search_count WHERE total_count=149999;
select * from paypay.search_count WHERE ts<"2019-11-18 14" and ts_short="2019-11-18" and brand_id!="134320" order by total_count desc;
select left(ts, 16), count(*) from paypay.sku_by_seller where ts_short="2019-11-07" group by left(ts, 16);
select ts_short, sum(total_count) from paypay.search_count group by ts_short;

select aa.*, bb.total_count as bb_total_count, aa.total_count-bb.total_count as m FROM
(select brand_id, category_id, item_status, total_count from paypay.search_count where ts_short="2019-11-25") aa
left join 
(select  brand_id, category_id, item_status, total_count  from paypay.search_count where ts_short="2019-11-18") bb
on aa.brand_id=bb.brand_id and aa.category_id=bb.category_id and aa.item_status=bb.item_status and aa.total_count>bb.total_count
order by m DESC;

select * FROM
(select * from paypay.search_count where ts_short="2019-11-04") aa
left join 
(select * from paypay.search_count where ts_short="2019-11-04") bb

-- 台湾上市公司
select ts_short, count(*) from twse.company_income group by ts_short;
select data_date, count(*) from twse.company_income group by data_date;
select ts_short, count(*) from twse.tsmc_speech group by ts_short;