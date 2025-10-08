package org.dromara.edu.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.edu.domain.EduExam;
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
 * 考试信息视图对象 edu_exam
 *
 * @author eezd
 * @date 2025-10-04
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = EduExam.class)
public class EduExamVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 考试ID
     */
    @ExcelProperty(value = "考试ID")
    private Long id;

    /**
     * 考试名称
     */
    @ExcelProperty(value = "考试名称")
    private String examName;

    /**
     * 考试描述
     */
    @ExcelProperty(value = "考试描述")
    private String examDesc;

    /**
     * 考试分类ID
     */
    @ExcelProperty(value = "考试分类ID")
    private Long categoryId;

    /**
     * 考试分类名称
     */
    @ExcelProperty(value = "考试分类名称")
    private String categoryName;

    /**
     * 关联题库ID
     */
    @ExcelProperty(value = "关联题库ID")
    private Long bankId;

    /**
     * 关联题库名称
     */
    @ExcelProperty(value = "关联题库名称")
    private String bankName;

    /**
     * 考试时长（分钟）
     */
    @ExcelProperty(value = "考试时长", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "分=钟")
    private Long examTime;

    /**
     * 考试开始时间
     */
    @ExcelProperty(value = "考试开始时间")
    private Date startTime;

    /**
     * 考试结束时间
     */
    @ExcelProperty(value = "考试结束时间")
    private Date endTime;

    /**
     * 是否随机出题（0否 1是）
     */
    @ExcelProperty(value = "是否随机出题", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "edu_exam_is_random")
    private String isRandom;

    /**
     * 是否允许查看答案（0否 1是）
     */
    @ExcelProperty(value = "是否允许查看答案", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "edu_exam_allow_review")
    private String allowReview;

    /**
     * 状态（0待发布 1发布 2过期）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "edu_exam_status")
    private String status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
