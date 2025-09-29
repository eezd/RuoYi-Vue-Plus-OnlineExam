package org.dromara.edu.domain.bo;

import org.dromara.edu.domain.EduQuestionBank;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 题库业务对象 edu_question_bank
 *
 * @author eezd
 * @date 2025-09-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = EduQuestionBank.class, reverseConvertGenerate = false)
public class EduQuestionBankBo extends BaseEntity {

    /**
     * 题库ID
     */
    @NotNull(message = "题库ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 题库名称
     */
    @NotBlank(message = "题库名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String bankName;

    /**
     * 题库描述
     */
    private String bankDesc;

    /**
     * 分类ID
     */
    @NotNull(message = "分类ID不能为空", groups = { AddGroup.class, EditGroup.class })
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
