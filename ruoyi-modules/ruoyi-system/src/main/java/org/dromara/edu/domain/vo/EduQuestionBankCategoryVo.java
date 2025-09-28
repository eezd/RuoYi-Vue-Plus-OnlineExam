package org.dromara.edu.domain.vo;

import org.dromara.edu.domain.EduQuestionBankCategory;
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
 * 题库分类视图对象 edu_question_bank_category
 *
 * @author eezd
 * @date 2025-09-28
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = EduQuestionBankCategory.class)
public class EduQuestionBankCategoryVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 分类ID
     */
    @ExcelProperty(value = "分类ID")
    private Long id;

    /**
     * 父级分类ID，根节点为0
     */
    @ExcelProperty(value = "父级分类ID，根节点为0")
    private Long parentId;

    /**
     * 分类名称
     */
    @ExcelProperty(value = "分类名称")
    private String categoryName;

    /**
     * 排序
     */
    @ExcelProperty(value = "排序")
    private Long sortOrder;

    /**
     * 状态（0正常 1停用）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "edu_question_bank_category_status")
    private String status;


}
