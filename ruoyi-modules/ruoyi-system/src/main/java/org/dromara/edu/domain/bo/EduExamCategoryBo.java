package org.dromara.edu.domain.bo;

import org.dromara.edu.domain.EduExamCategory;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 考试分类业务对象 edu_exam_category
 *
 * @author eezd
 * @date 2025-10-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = EduExamCategory.class, reverseConvertGenerate = false)
public class EduExamCategoryBo extends BaseEntity {

    /**
     * 考试分类ID
     */
    @NotNull(message = "考试分类ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 父级分类ID,根节点为0
     */
    private Long parentId;

    /**
     * 分类名称
     */
    @NotBlank(message = "分类名称不能为空", groups = { AddGroup.class, EditGroup.class })
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
