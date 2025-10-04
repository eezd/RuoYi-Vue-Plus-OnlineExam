package org.dromara.edu.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 考试分类对象 edu_exam_category
 *
 * @author eezd
 * @date 2025-10-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("edu_exam_category")
public class EduExamCategory extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 考试分类ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 父级分类ID,根节点为0
     */
    private Long parentId;

    /**
     * 分类名称
     */
    private String categoryName;

    /**
     * 排序
     */
    private Long sortOrder;

    /**
     * 状态（0正常 1停用）
     */
    private String status;

    /**
     * 备注
     */
    private String remark;


}
