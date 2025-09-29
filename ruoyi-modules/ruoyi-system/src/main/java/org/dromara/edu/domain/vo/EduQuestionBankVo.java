package org.dromara.edu.domain.vo;

import org.dromara.edu.domain.EduQuestionBank;
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
 * 题库视图对象 edu_question_bank
 *
 * @author eezd
 * @date 2025-09-28
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = EduQuestionBank.class)
public class EduQuestionBankVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 题库ID
     */
    @ExcelProperty(value = "题库ID")
    private Long id;

    /**
     * 题库名称
     */
    @ExcelProperty(value = "题库名称")
    private String bankName;

    /**
     * 题库描述
     */
    @ExcelProperty(value = "题库描述")
    private String bankDesc;

    /**
     * 分类ID
     */
    @ExcelProperty(value = "分类ID")
    private Long categoryId;

    /**
     * 状态（0正常 1停用）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "edu_question_bank_status")
    private String status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
