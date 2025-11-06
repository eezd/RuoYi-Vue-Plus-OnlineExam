package org.dromara.edu.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.dromara.common.tenant.core.TenantEntity;

import java.io.Serial;
import java.util.Date;

/**
 * 考试结果对象 edu_exam_result
 *
 * @author eezd
 * @date 2025-10-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("edu_exam_result")
public class EduExamResult extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 结果ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 考试ID
     */
    private Long examId;

    /**
     * 学生ID
     */
    private Long studentId;

    /**
     * 开始考试时间
     */
    private Date startTime;

    /**
     * 交卷时间
     */
    private Date submitTime;

    /**
     * 考试时长（分钟）
     */
    private Long examTime;

    /**
     * 总分
     */
    private Long totalScore;

    /**
     * 得分
     */
    private Long userScore;

    /**
     * 题目总数
     */
    private Long questionCount;

    /**
     * 正确题目数
     */
    private Long correctCount;

    /**
     * 错误题目数
     */
    private Long wrongCount;

    /**
     * 答题快照（JSON格式记录所有答题情况）
     */
    private String answerSnapshot;

    /**
     * 是否已交卷（0否 1是）
     */
    private String isSubmit;

    /**
     * 客户端IP
     */
    private String clientIp;

    /**
     * 浏览器信息
     */
    private String userAgent;

    /**
     * 备注
     */
    private String remark;


}
