package org.dromara.edu.service;

import org.dromara.edu.domain.vo.EduExamCategoryVo;
import org.dromara.edu.domain.bo.EduExamCategoryBo;

import java.util.Collection;
import java.util.List;

/**
 * 考试分类Service接口
 *
 * @author eezd
 * @date 2025-10-04
 */
public interface IEduExamCategoryService {

    /**
     * 查询考试分类
     *
     * @param id 主键
     * @return 考试分类
     */
    EduExamCategoryVo queryById(Long id);


    /**
     * 查询符合条件的考试分类列表
     *
     * @param bo 查询条件
     * @return 考试分类列表
     */
    List<EduExamCategoryVo> queryList(EduExamCategoryBo bo);

    /**
     * 新增考试分类
     *
     * @param bo 考试分类
     * @return 是否新增成功
     */
    Boolean insertByBo(EduExamCategoryBo bo);

    /**
     * 修改考试分类
     *
     * @param bo 考试分类
     * @return 是否修改成功
     */
    Boolean updateByBo(EduExamCategoryBo bo);

    /**
     * 校验并批量删除考试分类信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
