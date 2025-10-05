package org.dromara.edu.domain.bo;

import org.dromara.edu.domain.EduExam;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 考试信息业务对象 edu_exam
 *
 * @author eezd
 * @date 2025-10-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = EduExam.class, reverseConvertGenerate = false)
public class EduExamBo extends BaseEntity {

    /**
     * 考试ID
     */
    @NotNull(message = "考试ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 考试名称
     */
    @NotBlank(message = "考试名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String examName;

    /**
     * 考试描述
     */
    private String examDesc;

    /**
     * 考试分类ID
     */
    @NotNull(message = "考试分类ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long categoryId;

    /**
     * 关联题库ID
     */
    @NotNull(message = "关联题库ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long bankId;

    /**
     * 考试时长（分钟）
     */
    @NotNull(message = "考试时长（分钟）不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long examTime;

    /**
     * 考试开始时间
     */
    @NotNull(message = "考试开始时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date startTime;

    /**
     * 考试结束时间
     */
    @NotNull(message = "考试结束时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date endTime;

    /**
     * 是否随机出题（0否 1是）
     */
    private String isRandom;

    /**
     * 是否允许查看答案（0否 1是）
     */
    private String allowReview;

    /**
     * 状态（0待发布 1发布 2过期）
     */
    private String status;

    /**
     * 备注
     */
    private String remark;


}
