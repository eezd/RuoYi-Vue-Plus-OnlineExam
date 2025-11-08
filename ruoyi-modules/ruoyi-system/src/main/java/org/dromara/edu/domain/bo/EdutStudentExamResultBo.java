package org.dromara.edu.domain.bo;

import lombok.Data;
import org.dromara.common.mybatis.core.domain.BaseEntity;

/**
 * 考试结果业务对象 edu_exam_result
 *
 * @author eezd
 * @date 2025-10-19
 */
@Data
public class EdutStudentExamResultBo extends BaseEntity {

    /**
     * 班别名称
     */
    private String examName;

    /**
     * 班别名称
     */
    private String deptName;

    /**
     * 学生名称
     */
    private String studentName;
}
