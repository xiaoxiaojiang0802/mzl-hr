package com.example.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.example.common.actable.annotation.Column;
import lombok.Data;

/**
 * 用户和岗位关联 sys_user_post
 *
 * @author ruoyi
 */

@Data
@TableName("sys_user_post")
public class SysUserPost {

    /**
     * 用户ID
     */
    @Column(isKey = true)
    private Long userId;

    /**
     * 岗位ID
     */
    @Column(isKey = true)
    private Long postId;

}
