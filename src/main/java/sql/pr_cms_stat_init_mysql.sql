-- 选择数据库
use snack;

-- t_right
DELETE FROM `t_right`;
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (1, '首页', '/home/homePage', 0, 0, 1, NULL, 1, 'fa-home', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (2, '指标综合分析', '/compreQuota/compreQuota', 0, 0, 2, NULL, 0, 'fa-sitemap', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (3, 'GIS地图', '/GIS', 0, 0, 3, NULL, 0, 'fa-globe', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (4, '采样点GIS展现', '/map/map', 3, 0, 1, '', 0, 'fa-globe', '', '');
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (5, '道路指标GIS展现', '/roadMap/roadMap', 3, 0, 2, NULL, 0, 'fa-map-marker', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (6, '终端管理', '/epinfo', 0, 0, 4, NULL, 0, 'fa-mobile', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (7, '终端GIS回放', '/playBack/map', 6, 0, 1, NULL, 0, 'fa-video-camera', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (8, '终端GIS展现', '/epinfoMap/map', 6, 0, 2, NULL, 0, 'fa-tablet', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (9, '终端指标分析', '/epinfoAnalysis/epinfo', 6, 0, 3, NULL, 0, 'fa-tablet', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (10, '区域指标排名', '/areaKpiTop/areaKpiTop', 0, 0, 5, NULL, 0, 'fa-bar-chart-o', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (11, '道路覆盖质量对比分析', '/roadQuality/roadQuality', 0, 0, 6, NULL, 0, 'fa-sort-amount-desc', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (12, '指标区间设置', '/kpiSet/kpiSet', 0, 0, 7, NULL, 0, 'fa-cog', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (13, '系统管理', '/operator', 0, 0, 8, '', 0, 'fa-gears', '', '');
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (14, '用户管理', '/operator/opManager', 13, 0, 1, '', 0, '', '', '');
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (15, '用户组管理', '/group/groupManager', 13, 0, 2, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (16, '终端信息', '/epinfo/epinfo', 13, 0, 3, NULL, 0, 'fa-mobile', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (17, '采集方案', '/collection/collection', 13, 0, 4, NULL, 0, 'fa-files-o', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (18, '版本管理', '/version/version', 13, 0, 5, NULL, 0, 'fa-stack-overflow', NULL, NULL);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (19,'GIS道路补全','/replenishrps/replenishrps',3,0,3,null,0,null,null,null);
INSERT INTO `t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES (20,'指标综合任务查询','/taskReport/taskReport',0,0,9,null,0,'fa-sitemap',null,null);
-- t_role
DELETE FROM `t_role`;
INSERT INTO `t_role` (`roleid`, `rolename`, `mark`) VALUES (1, '系统管理员', NULL);

-- t_role_right
DELETE FROM `t_role_right`;
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (1, '1', '1');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (2, '1', '2');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (3, '1', '3');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (4, '1', '4');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (5, '1', '5');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (6, '1', '6');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (7, '1', '7');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (8, '1', '8');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (9, '1', '9');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (10, '1', '10');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (11, '1', '11');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (12, '1', '12');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (13, '1', '13');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (14, '1', '14');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (15, '1', '15');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (16, '1', '16');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (17, '1', '17');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (18, '1', '18');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (19, '1', '19');
INSERT INTO `t_role_right` (`funid`, `roleid`, `rightid`) VALUES (20, '1', '20');

-- t_user
DELETE FROM `t_user`;
INSERT INTO `t_user` (`userid`, `username`, `name`, `password`, `email`, `phone`, `islock`, `create_date`, `modify_date`, `operator`, `province`, `district`, `county`, `isActive`, `tele_auth`) VALUES ('1', 'admin', '系统用户', 'E10ADC3949BA59ABBE56E057F20F883E', '123123@qq.com', '131231313', '0', '2015-07-28 14:31:27', '2015-04-02 15:43:50', '1', '500000', '-1', '-1', '1', '111');

-- t_user_role
DELETE FROM `t_user_role`;
INSERT INTO `t_user_role` (`userid`, `roleid`) VALUES (1, 1);

-- 提交
commit;