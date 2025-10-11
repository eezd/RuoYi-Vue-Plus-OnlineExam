package org.dromara.edu.service;

import org.dromara.edu.domain.EduExamClass;
import org.dromara.edu.domain.vo.EduExamClassVo;

/**
 * 考试班级关联Service接口
 *
 * @author eezd
 * @date 2025-10-11
 */
public interface IEduExamClassService {

    /**
     * 查询考试班级关联
     *
     * @param examId 主键
     * @return 考试班级关联
     */
    EduExamClassVo queryById(Long examId);


    /**
     * 新增考试班级关联
     *
     * @param examClass 考试班级关联
     * @return 是否新增成功
     */
    Boolean insertByBo(EduExamClass examClass);

    /**
     * 校验并批量删除考试班级关联信息
     *
     * @param examClass
     * @param isValid   是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(EduExamClass examClass, Boolean isValid);
}
