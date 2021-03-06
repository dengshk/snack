-- ----------------------------
-- Database snack
-- ----------------------------
drop database if exists snack;
create database snack character set 'utf8' collate 'utf8_general_ci';

use snack;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_right
-- ----------------------------
DROP TABLE IF EXISTS `t_right`;
CREATE TABLE `t_right` (
  `rightid` int(11) NOT NULL,
  `rightname` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `orderby` int(11) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `showtype` int(11) DEFAULT NULL,
  `skins` varchar(500) DEFAULT NULL,
  `modules` varchar(500) DEFAULT NULL,
  `operate` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(30) DEFAULT NULL,
  `mark` varchar(500) DEFAULT NULL,
  `isActive` int(1) NOT NULL DEFAULT 1,
  `modify_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_role_right
-- ----------------------------
DROP TABLE IF EXISTS `t_role_right`;
CREATE TABLE `t_role_right` (
  `funid` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` varchar(32) NOT NULL,
  `rightid` varchar(500) NOT NULL,
  PRIMARY KEY (`funid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `islock` int(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `operator` varchar(11) DEFAULT NULL,
  `province` varchar(11) DEFAULT NULL,
  `district` varchar(11) DEFAULT NULL,
  `county` varchar(11) DEFAULT NULL,
  `isActive` int(1) NOT NULL DEFAULT 1,
  `tele_auth` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: rpt_etl_log 报表统计日志信息                          */
/*==============================================================*/
DROP TABLE IF EXISTS `rpt_etl_log`;
CREATE TABLE `rpt_etl_log` (
  `cal_time` varchar(20) DEFAULT NULL COMMENT '统计时间',
  `sta_time` datetime DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '执行结束时间',
  `exe_prc` varchar(30) DEFAULT NULL COMMENT '执行存储过程名称',
  `exe_status` char(1) DEFAULT NULL COMMENT '执行状态(0:失败,1:成功)',
  `exe_msg` varchar(500) DEFAULT NULL COMMENT '执行信息',
  `db_time` datetime DEFAULT NULL COMMENT '入库时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表统计日志信息';


-- ----------------------------
-- Table structure for rpt_homepage_kpi
-- ----------------------------
DROP TABLE IF EXISTS `rpt_homepage_kpi`;
CREATE TABLE `rpt_homepage_kpi` (
  `cal_time` char(10) NOT NULL,
  `telecoms` int(2) DEFAULT NULL,
  `road_cover_rate` double(5,2) DEFAULT NULL,
  `bw_link` double(11,2) DEFAULT NULL,
  `point_signal` int(8) DEFAULT NULL,
  `point_business` int(8) DEFAULT NULL,
  `test_mileage` double(10,2) DEFAULT NULL,
  `test_coverage` double(5,2) DEFAULT NULL,
  `test_coverage_main` double(5,2) DEFAULT NULL,
  `lte_rsrp` double(6,2) DEFAULT NULL,
  `lte_snr` double(6,2) DEFAULT NULL,
  `network_rate` double(5,2) DEFAULT NULL,
  `ping_rate` double(5,2) DEFAULT NULL,
  `rsrp_ratio1` double(5,2) DEFAULT NULL,
  `rsrp_range1` double(10,2) DEFAULT NULL,
  `rsrp_ratio2` double(5,2) DEFAULT NULL,
  `rsrp_range2` double(10,2) DEFAULT NULL,
  `rsrp_ratio3` double(5,2) DEFAULT NULL,
  `rsrp_range3` double(10,2) DEFAULT NULL,
  `rsrp_ratio4` double(5,2) DEFAULT NULL,
  `rsrp_range4` double(10,2) DEFAULT NULL,
  `rsrp_ratio5` double(5,2) DEFAULT NULL,
  `rsrp_range5` double(10,2) DEFAULT NULL,
  `rsrp_ratio6` double(5,2) DEFAULT NULL,
  `rsrp_range6` double(10,2) DEFAULT NULL,
  `snr_ratio1` double(5,2) DEFAULT NULL,
  `snr_range1` double(10,2) DEFAULT NULL,
  `snr_ratio2` double(5,2) DEFAULT NULL,
  `snr_range2` double(10,2) DEFAULT NULL,
  `snr_ratio3` double(5,2) DEFAULT NULL,
  `snr_range3` double(10,2) DEFAULT NULL,
  `snr_ratio4` double(5,2) DEFAULT NULL,
  `snr_range4` double(10,2) DEFAULT NULL,
  `snr_ratio5` double(5,2) DEFAULT NULL,
  `snr_range5` double(10,2) DEFAULT NULL,
  `snr_ratio6` double(5,2) DEFAULT NULL,
  `snr_range6` double(10,2) DEFAULT NULL,
  `region_code_level1` varchar(6) DEFAULT NULL,
  `region_auth` varchar(6) DEFAULT NULL,
  `cnt_road_point` int(6) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  KEY `idx_cal_time` (`cal_time`),
  KEY `idx_telecoms` (`telecoms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表,主页指标统计';

-- ----------------------------
-- Table structure for rpt_homepage_coverage
-- ----------------------------
DROP TABLE IF EXISTS `rpt_homepage_coverage`;
CREATE TABLE `rpt_homepage_coverage` (
  `cal_time` char(10) NOT NULL,
  `telecoms` int(2) DEFAULT NULL,
  `rank_poor` int(2) DEFAULT NULL,
  `parent_region` varchar(50) DEFAULT NULL,
  `location_name` varchar(50) DEFAULT NULL,
  `region_code` varchar(6) DEFAULT NULL,
  `road_id` varchar(32) DEFAULT NULL,
  `road_name` varchar(100) DEFAULT NULL,
  `road_cover_rate` double(5,2) DEFAULT NULL,
  `lte_rsrp` double(6,2) DEFAULT NULL,
  `lte_snr` double(6,2) DEFAULT NULL,
  `region_code_level1` varchar(6) DEFAULT NULL,
  `region_auth` varchar(6) DEFAULT NULL,
  `cnt_road_point` int(6) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  KEY `idx_cal_time` (`cal_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表,主页道路覆盖';

-- ----------------------------
-- Table structure for t_snack_product
-- ----------------------------
DROP TABLE IF EXISTS `t_snack_product`;
CREATE TABLE `t_snack_product` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `describe` varchar(600) DEFAULT NULL,
  `type_id` int(2) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `agent1_price` decimal(6,2) DEFAULT NULL,
  `agent2_price` decimal(6,2) DEFAULT NULL,
  `agent3_price` decimal(6,2) DEFAULT NULL,
  `agent4_price` decimal(6,2) DEFAULT NULL,
  `agent1_num` int(5) DEFAULT NULL,
  `agent2_num` int(5) DEFAULT NULL,
  `agent3_num` int(5) DEFAULT NULL,
  `agent4_num` int(5) DEFAULT NULL,
  `sale_price` decimal(6,2) DEFAULT NULL,
  `grammage` int(6) DEFAULT NULL,
  `expiration` int(5) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `taste` varchar(50) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_snack_product_classify
-- ----------------------------
DROP TABLE IF EXISTS `t_snack_product_classify`;
CREATE TABLE `t_snack_product_classify` (
  `type_id` int(2) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) DEFAULT NULL,
  `type_info` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for  t_snack_sale_info
-- ----------------------------
DROP TABLE IF EXISTS `t_snack_sale_info`;
CREATE TABLE `t_snack_sale_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` varchar(50) NOT NULL,
  `state` int(2) DEFAULT NULL,
  `pay` int(1) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_tel` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `express` varchar(50) DEFAULT NULL,
  `express_no` varchar(50) DEFAULT NULL,
  `express_price` decimal(6,2) DEFAULT NULL,
  `tatal_cost` decimal(8,2) DEFAULT NULL,
  `origin_pay` decimal(8,2) DEFAULT NULL,
  `really_pay` decimal(8,2) DEFAULT NULL,
  `profit` decimal(8,2) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_id` (`flow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for  t_snack_order_log
-- ----------------------------
DROP TABLE IF EXISTS `t_snack_order_log`;
CREATE TABLE `t_snack_order_log` (
  `flow_id` varchar(50) NOT NULL,
  `type_id` int(2) DEFAULT NULL,
  `product_id` int(5) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `cost_price` decimal(6,2) DEFAULT NULL,
  `sale_price` decimal(6,2) DEFAULT NULL,
  `order_num` int(5) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for  t_snack_customer_info
-- ----------------------------
DROP TABLE IF EXISTS `t_snack_customer_info`;
CREATE TABLE `t_snack_customer_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_tel` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for  t_snack_inventory_info
-- ----------------------------
DROP TABLE IF EXISTS `t_snack_inventory_info`;
CREATE TABLE `t_snack_inventory_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(5) DEFAULT NULL,
  `nums` int(5) DEFAULT NULL,
  `acc_nums` int(11) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for  t_snack_import_log
-- ----------------------------
DROP TABLE IF EXISTS `t_snack_import_log`;
CREATE TABLE `t_snack_import_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(200) DEFAULT NULL,
  `line_num` varchar(200) DEFAULT NULL,
  `flow_id` varchar(200) DEFAULT NULL,
  `order_date` varchar(200) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `order_num` varchar(200) DEFAULT NULL,
  `cost_price` varchar(200) DEFAULT NULL,
  `sale_price` varchar(200) DEFAULT NULL,
  `is_valid` int(1) DEFAULT NULL,
  `error_msg` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 触发器:插入
drop trigger if exists trg_t_snack_order_log_insert;
create trigger trg_t_snack_order_log_insert before insert on `t_snack_order_log` for each row
begin
    update t_snack_product a
    set a.nums=case when new.type=1 then ifnull(a.nums,0)+ifnull(new.order_num,0)
                    when new.type=2 then ifnull(a.nums,0)-ifnull(new.order_num,0) end,
        a.acc_nums=case when new.type=1 then ifnull(a.acc_nums,0)+ifnull(new.order_num,0) end
    where a.id=new.product_id
    ;
end;
-- 触发器:删除
drop trigger if exists trg_t_snack_order_log_delete;
create trigger trg_t_snack_order_log_delete before delete on `t_snack_order_log` for each row
begin
    update t_snack_product a
    set a.nums=case when old.type=1 then ifnull(a.nums,0)-ifnull(old.order_num,0)
                    when old.type=2 then ifnull(a.nums,0)+ifnull(old.order_num,0) end,
        a.acc_nums=case when old.type=1 then ifnull(a.acc_nums,0)-ifnull(old.order_num,0)
                        when old.type=2 then ifnull(a.acc_nums,0)+ifnull(old.order_num,0) end
    where a.id=old.product_id
    ;
end;
-- 触发器:更新
drop trigger if exists trg_t_snack_order_log_update;
create trigger trg_t_snack_order_log_update before update on `t_snack_order_log` for each row
begin
    update t_snack_product a
    set a.nums=case when old.type=1 then ifnull(a.nums,0)+ifnull(new.order_num,0)-ifnull(old.order_num,0)
                    when old.type=2 then ifnull(a.nums,0)-ifnull(new.order_num,0)+ifnull(old.order_num,0) end,
        a.acc_nums=case when old.type=1 then ifnull(a.acc_nums,0)+ifnull(new.order_num,0)-ifnull(old.order_num,0)
                        when old.type=2 then ifnull(a.acc_nums,0)-ifnull(new.order_num,0)+ifnull(old.order_num,0) end
    where a.id=new.product_id
    ;
end;




/*==============================================================*/
/* Procedure: pr_qry_snack_analysis 盈利情况分析                */
/*==============================================================*/
drop procedure if exists pr_qry_snack_analysis;
delimiter //
create procedure pr_qry_snack_analysis(
    in p_qry_uid varchar(32),         -- 查询UUID
    out rs int(1)                     -- 返回信息: -1 异常, 0 失败, 1 成功
)
sql security invoker comment '盈利情况分析'
prc:
begin
    declare v_exe_sta_time datetime default now(); -- 统计执行时间: 默认为当前系统时间
    
    -- 默认值
    set rs=0;
    
    -- 插入
    delete from qry_snack_analysis where create_time<=date_sub(now(),interval 15 minute);
    delete from qry_snack_analysis where qry_uuid=p_qry_uid;
    insert into qry_snack_analysis(
        qry_uuid,
        cal_time,
        day_express,
        day_income,
        day_expend,
        day_profit,
        total_express,
        total_income,
        total_expend,
        total_profit,
        create_time
    )
    select
        p_qry_uid,
        cal_time,
        day_express,
        day_income,
        day_expend,
        day_profit,
        @express:=@express+day_express total_express,
        @income:=@income+day_income total_income,
        @expend:=@expend+day_expend total_expend,
        @profit:=@profit+day_profit total_profit,
        now()
    from(
        select
            max(order_date) cal_time,
            ifnull(sum(express_price),0) day_express,
            ifnull(sum(case when type=2 then really_pay end),0) day_income,
            ifnull(sum(case when type=1 then really_pay end),0) day_expend,
            ifnull(sum(case when type=1 then -really_pay when type=2 then really_pay end)-ifnull(sum(express_price),0),0) day_profit
        from(
            select
                2 type,
                max(order_date) order_date,
                sum(express_price) express_price,
                sum(really_pay) really_pay
            from t_snack_sale_info
            group by order_date
        union all
            select
                1 type,
                max(stock_date),
                sum(express_price),
                sum(really_pay)
            from t_snack_stock_info
            group by stock_date
        )a
        group by order_date
        order by cal_time asc
    )a,(
        select @express:=0,@income:=0,@expend:=0,@profit:=0
    )b
    ;
    -- 提交
    commit;
    
    -- 成功
    set rs=1;
end
//
delimiter ;

call pr_qry_snack_analysis('dsk');
select * from qry_snack_analysis;