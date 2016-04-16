-- 选择数据库
use snack;

/*==============================================================*/
/* Procedurce: pr_rpt_etl_log 报表统计日志入库                  */
/*==============================================================*/
drop procedure if exists pr_rpt_etl_log;
delimiter //
create procedure pr_rpt_etl_log(
    in p_cal_time varchar(20),
    in p_sta_time datetime,
    in p_end_time datetime,
    in p_exe_prc varchar(30),
    in p_exe_status char(1),
    in p_exe_msg varchar(500)
)
sql security invoker comment '报表统计日志入库'
prc:
begin
    declare v_db_time datetime default now();
    -- 事务自动提交: 关闭
    set autocommit = 0;

    -- 开始事务
    start transaction;

    -- 删除30天前执行成功的日志记录
    delete from rpt_etl_log where exe_status=1 and db_time <= date_sub(current_date(),interval 30 day);
    insert into rpt_etl_log(
        cal_time,
        sta_time,
        end_time,
        exe_prc,
        exe_status,
        exe_msg,
        db_time
    )values(
        p_cal_time,
        p_sta_time,
        p_end_time,
        p_exe_prc,
        p_exe_status,
        p_exe_msg,
        v_db_time
    );
    
    -- 提交事务
    commit;
    
end
//
delimiter ;

-- ----------------------------
-- Procedure structure for pro_loginVaildate
-- ----------------------------
drop procedure if exists pro_loginVaildate;
delimiter //
create procedure pro_loginVaildate(
    in  i_username varchar(50),
    in  i_password varchar(50),
    out o_result   int,
    out o_userid   int
)
sql security invoker comment '登录验证'
prc:begin
    declare v_cnt    int;
    declare v_pwd    int;
    declare v_islock int;
    declare v_userid int;

    -- 异常处理
    declare exit handler for sqlexception,not found
    begin
        set o_result = -1;
        set o_userid = -1;
    end;

    -- 数据库查询
    select count(1) cnt,
           max(u.userid) userid,
           case when max(u.password)=i_password then 1 else 0 end pwd,
           max(u.islock) islock
    into @v_cnt,@v_userid,@v_pwd,@v_islock
    from t_user u
    where u.username=i_username and u.isactive=1
    limit 0,1
    ;
    if @v_cnt = 0 then
    -- 用户不存在
        set o_result = 1001;
        leave prc;
    end if;

    if @v_pwd = 0 then
    -- 密码错误
        set o_result = 1002;
        leave prc;
    end if;

    if @v_islock = 1 then
    -- 用户处于锁定状态
        set o_result = 1003;
        leave prc;
    end if;

    if @v_pwd = 1 then
    -- 成功
        set o_result = 1000;
        set o_userid = @v_userid;
    end if;
end
//
delimiter ;