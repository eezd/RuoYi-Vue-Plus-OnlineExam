package org.dromara.edu.service;

import org.dromara.edu.domain.vo.EduQuestionBankCategoryVo;
import org.dromara.edu.domain.bo.EduQuestionBankCategoryBo;

import java.util.Collection;
import java.util.List;

/**
 * 题库分类Service接口
 *
 * @author eezd
 * @date 2025-09-28
 */
public interface IEduQuestionBankCategoryService {

    /**
     * 查询题库分类
     *
     * @param id 主键
     * @return 题库分类
     */
    EduQuestionBankCategoryVo queryById(Long id);


    /**
     * 查询符合条件的题库分类列表
     *
     * @param bo 查询条件
     * @return 题库分类列表
     */
    List<EduQuestionBankCategoryVo> queryList(EduQuestionBankCategoryBo bo);

    /**
     * 新增题库分类
     *
     * @param bo 题库分类
     * @return 是否新增成功
     */
    Boolean insertByBo(EduQuestionBankCategoryBo bo);

    /**
     * 修改题库分类
     *
     * @param bo 题库分类
     * @return 是否修改成功
     */
    Boolean updateByBo(EduQuestionBankCategoryBo bo);

    /**
     * 校验并批量删除题库分类信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
