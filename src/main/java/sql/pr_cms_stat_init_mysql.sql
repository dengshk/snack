-- 选择数据库
use snack;

-- t_right
DELETE FROM `t_right`;
INSERT INTO `snack`.`t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES ('1', '首页', '/home/homePage', '0', '0', '1', NULL, '1', 'fa-home', NULL, NULL);
INSERT INTO `snack`.`t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES ('2', '记一笔', '/record', '0', '0', '2', NULL, '0', 'fa-sitemap', NULL, NULL);
INSERT INTO `snack`.`t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES ('3', '卖货记录', '/record/outProduct', '2', '0', '1', NULL, '0', 'fa-video-camera', NULL, NULL);
INSERT INTO `snack`.`t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES ('4', '进货存档', '/record/inProduct', '2', '0', '2', NULL, '0', 'fa-tablet', NULL, NULL);
INSERT INTO `snack`.`t_right` (`rightid`, `rightname`, `url`, `parentid`, `type`, `orderby`, `memo`, `showtype`, `skins`, `modules`, `operate`) VALUES ('5', '产品管理', '/record/newProduct', '2', '0', '3', NULL, '0', 'fa-tablet', NULL, NULL);
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

-- t_user
DELETE FROM `t_user`;
INSERT INTO `t_user` (`userid`, `username`, `name`, `password`, `email`, `phone`, `islock`, `create_date`, `modify_date`, `operator`, `province`, `district`, `county`, `isActive`, `tele_auth`) VALUES ('1', 'admin', '系统用户', 'E10ADC3949BA59ABBE56E057F20F883E', '123123@qq.com', '131231313', '0', '2015-07-28 14:31:27', '2015-04-02 15:43:50', '1', '500000', '-1', '-1', '1', '111');

-- t_user_role
DELETE FROM `t_user_role`;
INSERT INTO `t_user_role` (`userid`, `roleid`) VALUES (1, 1);

-- 提交
commit;