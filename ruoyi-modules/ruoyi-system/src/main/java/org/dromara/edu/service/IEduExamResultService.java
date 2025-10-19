package org.dromara.edu.service;

import org.dromara.edu.domain.vo.EduExamResultVo;
import org.dromara.edu.domain.bo.EduExamResultBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 考试结果Service接口
 *
 * @author eezd
 * @date 2025-10-19
 */
public interface IEduExamResultService {

    /**
     * 查询考试结果
     *
     * @param id 主键
     * @return 考试结果
     */
    EduExamResultVo queryById(Long id);

    /**
     * 分页查询考试结果列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 考试结果分页列表
     */
    TableDataInfo<EduExamResultVo> queryPageList(EduExamResultBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的考试结果列表
     *
     * @param bo 查询条件
     * @return 考试结果列表
     */
    List<EduExamResultVo> queryList(EduExamResultBo bo);

    /**
     * 新增考试结果
     *
     * @param bo 考试结果
     * @return 是否新增成功
     */
    Boolean insertByBo(EduExamResultBo bo);

    /**
     * 修改考试结果
     *
     * @param bo 考试结果
     * @return 是否修改成功
     */
    Boolean updateByBo(EduExamResultBo bo);

    /**
     * 校验并批量删除考试结果信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
