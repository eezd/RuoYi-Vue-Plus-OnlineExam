package org.dromara.edu.service;

import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.edu.domain.bo.EduExamBo;
import org.dromara.edu.domain.vo.EduExamVo;

/**
 * 考试信息Service接口
 *
 * @author eezd
 * @date 2025-10-04
 */
public interface IEduStudentExamService {

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

}
