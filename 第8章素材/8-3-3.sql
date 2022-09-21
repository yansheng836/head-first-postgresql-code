CREATE TABLE sales(
	commodity_no	int	primary key,	--货单号
	seller_no		int,				--销售员ID
	sales_date		date,				--销售日期
	sales_count		int					--销售量
);
INSERT into sales VALUES (generate_series(1,10000000), generate_series(1,10000000), now(), generate_series(1,10000000));