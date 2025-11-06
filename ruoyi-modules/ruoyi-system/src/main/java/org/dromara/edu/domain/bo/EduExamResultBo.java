package org.dromara.edu.domain.bo;

import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.edu.domain.EduExamResult;

import java.util.Date;

/**
 * 考试结果业务对象 edu_exam_result
 *
 * @author eezd
 * @date 2025-10-19
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = EduExamResult.class, reverseConvertGenerate = false)
public class EduExamResultBo extends BaseEntity {

    /**
     * 结果ID
     */
    @NotNull(message = "结果ID不能为空", groups = {EditGroup.class})
    private Long id;

    /**
     * 考试ID
     */
    @NotNull(message = "考试ID不能为空", groups = {AddGroup.class, EditGroup.class})
    private Long examId;

    /**
     * 学生ID
     */
    @NotNull(message = "学生ID不能为空", groups = {AddGroup.class, EditGroup.class})
    private Long studentId;

    /**
     * 开始考试时间
     */
    @NotNull(message = "开始考试时间不能为空", groups = {AddGroup.class, EditGroup.class})
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
