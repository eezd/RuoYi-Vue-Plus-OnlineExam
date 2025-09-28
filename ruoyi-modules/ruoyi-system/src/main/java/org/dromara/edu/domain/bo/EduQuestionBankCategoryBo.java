package org.dromara.edu.domain.bo;

import org.dromara.edu.domain.EduQuestionBankCategory;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 题库分类业务对象 edu_question_bank_category
 *
 * @author eezd
 * @date 2025-09-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = EduQuestionBankCategory.class, reverseConvertGenerate = false)
public class EduQuestionBankCategoryBo extends BaseEntity {

    /**
     * 分类ID
     */
    private Long id;

    /**
     * 父级分类ID，根节点为0
     */
    private Long parentId;

    /**
     * 分类名称
     */
    @NotBlank(message = "分类名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String categoryName;

    /**
     * 分类描述
     */
    private String categoryDesc;

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
