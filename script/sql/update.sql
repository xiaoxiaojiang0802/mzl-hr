INSERT INTO `sys_dict_data`
VALUES (33, 1, '请假', '1', 'approve_type', '', '', 'Y', '0', 'admin', now(), '', NULL, ''),
       (34, 2, '绩效', '2', 'approve_type', '', '', 'N', '0', 'admin', now(), '', NULL, ''),
       (35, 3, '加班', '3', 'approve_type', '', '', 'N', '0', 'admin', now(), '', NULL, ''),
       (36, 4, '外出', '4', 'approve_type', '', '', 'Y', '0', 'admin', now(), '', NULL, '');


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='奖惩';
