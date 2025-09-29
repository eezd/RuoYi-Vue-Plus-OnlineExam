package org.dromara.edu.service;

import org.dromara.edu.domain.vo.EduQuestionBankVo;
import org.dromara.edu.domain.bo.EduQuestionBankBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 题库Service接口
 *
 * @author eezd
 * @date 2025-09-28
 */
public interface IEduQuestionBankService {

    /**
     * 查询题库
     *
     * @param id 主键
     * @return 题库
     */
    EduQuestionBankVo queryById(Long id);

    /**
     * 分页查询题库列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 题库分页列表
     */
    TableDataInfo<EduQuestionBankVo> queryPageList(EduQuestionBankBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的题库列表
     *
     * @param bo 查询条件
     * @return 题库列表
     */
    List<EduQuestionBankVo> queryList(EduQuestionBankBo bo);

    /**
     * 新增题库
     *
     * @param bo 题库
     * @return 是否新增成功
     */
    Boolean insertByBo(EduQuestionBankBo bo);

    /**
     * 修改题库
     *
     * @param bo 题库
     * @return 是否修改成功
     */
    Boolean updateByBo(EduQuestionBankBo bo);

    /**
     * 校验并批量删除题库信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
