package org.dromara.edu.domain;

import org.dromara.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 试题对象 edu_question
 *
 * @author eezd
 * @date 2025-10-03
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("edu_question")
public class EduQuestion extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 试题ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 题库ID
     */
    private Long bankId;

    /**
     * 题目类型（1-单选 2-多选 3-判断）
     */
    private String questionType;

    /**
     * 题目
     */
    private String questionTitle;

    /**
     * 选项内容（JSON格式，判断题可为空）
     */
    private String options;

    /**
     * 正确答案
     */
    private String correctAnswer;

    /**
     * 答案解析
     */
    private String answerAnalysis;

    /**
     * 难度等级（1-简单 2-中等 3-困难）
     */
    private String difficulty;

    /**
     * 题目分值
     */
    private Long score;

    /**
     * 状态（0正常 1停用）
     */
    private String status;

    /**
     * 备注
     */
    private String remark;


}
