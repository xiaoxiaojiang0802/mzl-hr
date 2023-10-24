INSERT INTO `sys_dict_data`
VALUES (33, 1, '事假', '1', 'leave_type', '', '', 'Y', '0', 'admin', now(), '', NULL, ''),
       (34, 2, '病假', '2', 'leave_type', '', '', 'N', '0', 'admin', now(), '', NULL, ''),
       (35, 3, '调休', '3', 'leave_type', '', '', 'N', '0', 'admin', now(), '', NULL, ''),
       (36, 4, '年假', '4', 'leave_type', '', '', 'Y', '0', 'admin', now(), '', NULL, '');


CREATE TABLE reward_punishment_record
(
    id            INT          NOT NULL AUTO_INCREMENT,
    employee_name VARCHAR(255) NOT NULL COMMENT '员工姓名',
    department    VARCHAR(255) NOT NULL COMMENT '所属部门',
    date          DATE         NOT NULL COMMENT '奖惩日期',
    type          VARCHAR(255) NOT NULL COMMENT '奖惩类型',
    reason        VARCHAR(255) COMMENT '奖惩原因',
    amount        DECIMAL(10, 2) COMMENT '奖惩金额',
    status        VARCHAR(255) NOT NULL COMMENT '奖惩状态',
    remark        VARCHAR(255),
    PRIMARY KEY (id),
    INDEX (employee_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4  COLLATE=utf8mb4_general_ci COMMENT='奖惩';

-- 菜单 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784265322942464,'请假记录', '3', '1', 'leave', 'hr/leave/index', 1, 0, 'C', '0', '0', 'hr:leave:list', '#', 'admin', sysdate(), '', null, '请假记录菜单');

-- 按钮父菜单ID
SELECT @parentId := 1716784265322942464;

-- 按钮 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784265322942465,'请假记录查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'hr:leave:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784265322942466,'请假记录新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'hr:leave:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784265322942467,'请假记录修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'hr:leave:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784265322942468,'请假记录删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'hr:leave:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784265322942469,'请假记录导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'hr:leave:export',       '#', 'admin', sysdate(), '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784420222783488,'打卡记录', '3', '1', 'attendance', 'hr/attendance/index', 1, 0, 'C', '0', '0', 'hr:attendance:list', '#', 'admin', sysdate(), '', null, '打卡记录菜单');

-- 按钮父菜单ID
SELECT @parentId := 1716784420222783488;

-- 按钮 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784420222783489,'打卡记录查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'hr:attendance:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784420222783490,'打卡记录新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'hr:attendance:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784420222783491,'打卡记录修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'hr:attendance:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784420222783492,'打卡记录删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'hr:attendance:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716784420222783493,'打卡记录导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'hr:attendance:export',       '#', 'admin', sysdate(), '', null, '');


-- 菜单 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716795590388338688,'奖惩', '3', '1', 'reward', 'example/reward/index', 1, 0, 'C', '0', '0', 'example:reward:list', '#', 'admin', sysdate(), '', null, '奖惩菜单');

-- 按钮父菜单ID
SELECT @parentId := 1716795590388338688;

-- 按钮 SQL
insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716795590388338689,'奖惩查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'example:reward:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716795590388338690,'奖惩新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'example:reward:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716795590388338691,'奖惩修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'example:reward:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716795590388338692,'奖惩删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'example:reward:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_id,menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values(1716795590388338693,'奖惩导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'example:reward:export',       '#', 'admin', sysdate(), '', null, '');
