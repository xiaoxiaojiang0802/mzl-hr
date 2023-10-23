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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='奖惩';
