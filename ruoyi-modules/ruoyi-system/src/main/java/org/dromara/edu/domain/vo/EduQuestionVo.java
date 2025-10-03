package org.dromara.edu.domain.vo;

import org.dromara.edu.domain.EduQuestion;
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
 * 试题视图对象 edu_question
 *
 * @author eezd
 * @date 2025-10-03
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = EduQuestion.class)
public class EduQuestionVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 试题ID
     */
    @ExcelProperty(value = "试题ID")
    private Long id;

    /**
     * 题库ID
     */
    @ExcelProperty(value = "题库ID")
    private Long bankId;

    /**
     * 题目类型（1-单选 2-多选 3-判断）
     */
    @ExcelProperty(value = "题目类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "edu_question_type")
    private String questionType;

    /**
     * 题目
     */
    @ExcelProperty(value = "题目")
    private String questionTitle;

    /**
     * 选项内容（JSON格式，判断题可为空）
     */
    @ExcelProperty(value = "选项内容", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "J=SON格式，判断题可为空")
    private String options;

    /**
     * 正确答案
     */
    @ExcelProperty(value = "正确答案")
    private String correctAnswer;

    /**
     * 答案解析
     */
    @ExcelProperty(value = "答案解析")
    private String answerAnalysis;

    /**
     * 难度等级（1-简单 2-中等 3-困难）
     */
    @ExcelProperty(value = "难度等级", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-简单,2=-中等,3=-困难")
    private String difficulty;

    /**
     * 题目分值
     */
    @ExcelProperty(value = "题目分值")
    private Long score;

    /**
     * 状态（0正常 1停用）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "edu_question_status")
    private String status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
