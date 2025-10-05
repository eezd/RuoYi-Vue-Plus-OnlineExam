package org.dromara.edu.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 考试信息对象 edu_exam
 *
 * @author eezd
 * @date 2025-10-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("edu_exam")
public class EduExam extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 考试ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 考试名称
     */
    private String examName;

    /**
     * 考试描述
     */
    private String examDesc;

    /**
     * 考试分类ID
     */
    private Long categoryId;

    /**
     * 关联题库ID
     */
    private Long bankId;

    /**
     * 考试时长（分钟）
     */
    private Long examTime;

    /**
     * 考试开始时间
     */
    private Date startTime;

    /**
     * 考试结束时间
     */
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
