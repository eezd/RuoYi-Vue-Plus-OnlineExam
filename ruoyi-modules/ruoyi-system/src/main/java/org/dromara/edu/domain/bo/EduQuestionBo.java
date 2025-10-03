package org.dromara.edu.domain.bo;

import org.dromara.edu.domain.EduQuestion;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 试题业务对象 edu_question
 *
 * @author eezd
 * @date 2025-10-03
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = EduQuestion.class, reverseConvertGenerate = false)
public class EduQuestionBo extends BaseEntity {

    /**
     * 试题ID
     */
    @NotNull(message = "试题ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 题库ID
     */
    @NotNull(message = "题库ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long bankId;

    /**
     * 题目类型（1-单选 2-多选 3-判断）
     */
    @NotBlank(message = "题目类型（1-单选 2-多选 3-判断）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String questionType;

    /**
     * 题目
     */
    @NotBlank(message = "题目不能为空", groups = { AddGroup.class, EditGroup.class })
    private String questionTitle;

    /**
     * 选项内容（JSON格式，判断题可为空）
     */
    @NotBlank(message = "选项内容（JSON格式，判断题可为空）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String options;

    /**
     * 正确答案
     */
    @NotBlank(message = "正确答案不能为空", groups = { AddGroup.class, EditGroup.class })
    private String correctAnswer;

    /**
     * 答案解析
     */
    private String answerAnalysis;

    /**
     * 难度等级（1-简单 2-中等 3-困难）
     */
    @NotBlank(message = "难度等级（1-简单 2-中等 3-困难）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String difficulty;

    /**
     * 题目分值
     */
    @NotNull(message = "题目分值不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long score;

    /**
     * 状态（0正常 1停用）
     */
    @NotBlank(message = "状态（0正常 1停用）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String status;

    /**
     * 备注
     */
    private String remark;


}
