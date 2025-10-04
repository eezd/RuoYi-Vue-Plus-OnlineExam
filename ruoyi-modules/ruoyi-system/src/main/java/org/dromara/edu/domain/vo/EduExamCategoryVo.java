package org.dromara.edu.domain.vo;

import org.dromara.edu.domain.EduExamCategory;
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
 * 考试分类视图对象 edu_exam_category
 *
 * @author eezd
 * @date 2025-10-04
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = EduExamCategory.class)
public class EduExamCategoryVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 考试分类ID
     */
    @ExcelProperty(value = "考试分类ID")
    private Long id;

    /**
     * 父级分类ID,根节点为0
     */
    @ExcelProperty(value = "父级分类ID,根节点为0")
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
    @ExcelDictFormat(dictType = "edu_exam_category_status")
    private String status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
