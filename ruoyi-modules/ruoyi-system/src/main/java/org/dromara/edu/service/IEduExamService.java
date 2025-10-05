package org.dromara.edu.service;

import org.dromara.edu.domain.vo.EduExamVo;
import org.dromara.edu.domain.bo.EduExamBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 考试信息Service接口
 *
 * @author eezd
 * @date 2025-10-04
 */
public interface IEduExamService {

    /**
     * 查询考试信息
     *
     * @param id 主键
     * @return 考试信息
     */
    EduExamVo queryById(Long id);

    /**
     * 分页查询考试信息列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 考试信息分页列表
     */
    TableDataInfo<EduExamVo> queryPageList(EduExamBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的考试信息列表
     *
     * @param bo 查询条件
     * @return 考试信息列表
     */
    List<EduExamVo> queryList(EduExamBo bo);

    /**
     * 新增考试信息
     *
     * @param bo 考试信息
     * @return 是否新增成功
     */
    Boolean insertByBo(EduExamBo bo);

    /**
     * 修改考试信息
     *
     * @param bo 考试信息
     * @return 是否修改成功
     */
    Boolean updateByBo(EduExamBo bo);

    /**
     * 校验并批量删除考试信息信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
