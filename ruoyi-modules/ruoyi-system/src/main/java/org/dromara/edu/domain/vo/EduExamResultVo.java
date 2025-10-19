package org.dromara.edu.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.edu.domain.EduExamResult;
import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * 考试结果视图对象 edu_exam_result
 *
 * @author eezd
 * @date 2025-10-19
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = EduExamResult.class)
public class EduExamResultVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 结果ID
     */
    @ExcelProperty(value = "结果ID")
    private Long id;

    /**
     * 考试ID
     */
    @ExcelProperty(value = "考试ID")
    private Long examId;

    /**
     * 学生ID
     */
    @ExcelProperty(value = "学生ID")
    private Long studentId;

    /**
     * 开始考试时间
     */
    @ExcelProperty(value = "开始考试时间")
    private Date startTime;

    /**
     * 交卷时间
     */
    @ExcelProperty(value = "交卷时间")
    private Date submitTime;

    /**
     * 实际考试时长（分钟）
     */
    @ExcelProperty(value = "实际考试时长", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "分=钟")
    private Long examTime;

    /**
     * 总分
     */
    @ExcelProperty(value = "总分")
    private Long totalScore;

    /**
     * 得分
     */
    @ExcelProperty(value = "得分")
    private Long userScore;

    /**
     * 题目总数
     */
    @ExcelProperty(value = "题目总数")
    private Long questionCount;

    /**
     * 正确题目数
     */
    @ExcelProperty(value = "正确题目数")
    private Long correctCount;

    /**
     * 错误题目数
     */
    @ExcelProperty(value = "错误题目数")
    private Long wrongCount;

    /**
     * 答题快照（JSON格式记录所有答题情况）
     */
    @ExcelProperty(value = "答题快照", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "J=SON格式记录所有答题情况")
    private String answerSnapshot;

    /**
     * 是否已交卷（0否 1是）
     */
    @ExcelProperty(value = "是否已交卷", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "edu_exam_result_submit")
    private String isSubmit;

    /**
     * 客户端IP
     */
    @ExcelProperty(value = "客户端IP")
    private String clientIp;

    /**
     * 浏览器信息
     */
    @ExcelProperty(value = "浏览器信息")
    private String userAgent;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
