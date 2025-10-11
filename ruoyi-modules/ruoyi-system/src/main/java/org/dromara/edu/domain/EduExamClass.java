package org.dromara.edu.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 考试班级关联对象 edu_exam_class
 *
 * @author eezd
 * @date 2025-10-11
 */
@Data
@TableName("edu_exam_class")
public class EduExamClass {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 考试ID
     */
    private Long examId;

    /**
     * 部门ID
     */
    private Long deptId;


}
