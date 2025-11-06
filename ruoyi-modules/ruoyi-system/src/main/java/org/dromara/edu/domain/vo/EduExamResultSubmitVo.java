package org.dromara.edu.domain.vo;

import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;


/**
 * 考试交卷试图
 *
 * @author eezd
 * @date 2025-11-06
 */
@Data
@ExcelIgnoreUnannotated
public class EduExamResultSubmitVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 考试ID
     */
    @ExcelProperty(value = "考试ID")
    private Long id;

    /**
     * 答题快照（JSON格式记录所有答题情况）
     */
    private String answerSnapshot;
}
