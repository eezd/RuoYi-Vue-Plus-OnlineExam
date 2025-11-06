package org.dromara.edu.domain.vo;

import cn.idev.excel.annotation.ExcelProperty;
import lombok.Data;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;

import java.io.Serial;
import java.io.Serializable;

/**
 * 考试试题
 */
@Data
public class EduExamQuestionVo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 试题ID
     */
    @ExcelProperty(value = "试题ID")
    private String id;

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
     * 所选答案
     */
    @ExcelProperty(value = "所选答案")
    private String chooseAnswer;


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
}
