package org.dromara.edu.domain.vo;

import org.dromara.edu.domain.EduExamClass;
import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 考试班级关联视图对象 edu_exam_class
 *
 * @author eezd
 * @date 2025-10-11
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = EduExamClass.class)
public class EduExamClassVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 考试ID
     */
    @ExcelProperty(value = "考试ID")
    private Long examId;

    /**
     * 考试名称
     */
    @ExcelProperty(value = "考试ID")
    private String examName;

    /** 关联部门列表 */
    private List<DeptInfo> deptList;

    @Data
    public static class DeptInfo implements Serializable {
        /** 部门ID */
        @ExcelProperty(value = "部门ID")
        private Long deptId;

        /** 部门名称 */
        @ExcelProperty(value = "部门名称")
        private String deptName;
    }
}
