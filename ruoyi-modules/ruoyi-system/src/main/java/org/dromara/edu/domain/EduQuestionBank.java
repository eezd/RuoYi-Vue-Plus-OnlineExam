package org.dromara.edu.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 题库对象 edu_question_bank
 *
 * @author eezd
 * @date 2025-09-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("edu_question_bank")
public class EduQuestionBank extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 题库ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 题库名称
     */
    private String bankName;

    /**
     * 题库描述
     */
    private String bankDesc;

    /**
     * 分类ID
     */
    private Long categoryId;

    /**
     * 状态（0正常 1停用）
     */
    private String status;

    /**
     * 备注
     */
    private String remark;


}
