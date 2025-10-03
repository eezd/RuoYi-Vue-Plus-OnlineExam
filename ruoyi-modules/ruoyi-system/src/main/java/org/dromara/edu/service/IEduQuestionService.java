package org.dromara.edu.service;

import org.dromara.edu.domain.vo.EduQuestionVo;
import org.dromara.edu.domain.bo.EduQuestionBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 试题Service接口
 *
 * @author eezd
 * @date 2025-10-03
 */
public interface IEduQuestionService {

    /**
     * 查询试题
     *
     * @param id 主键
     * @return 试题
     */
    EduQuestionVo queryById(Long id);

    /**
     * 分页查询试题列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 试题分页列表
     */
    TableDataInfo<EduQuestionVo> queryPageList(EduQuestionBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的试题列表
     *
     * @param bo 查询条件
     * @return 试题列表
     */
    List<EduQuestionVo> queryList(EduQuestionBo bo);

    /**
     * 新增试题
     *
     * @param bo 试题
     * @return 是否新增成功
     */
    Boolean insertByBo(EduQuestionBo bo);

    /**
     * 修改试题
     *
     * @param bo 试题
     * @return 是否修改成功
     */
    Boolean updateByBo(EduQuestionBo bo);

    /**
     * 校验并批量删除试题信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
